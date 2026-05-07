---
name: knowledge-writer
description: 个人知识库写入技能。将对话中学到的知识点、遇到的问题、经验教训自动分类并写入 GitHub 知识库项目（VitePress）。触发场景：用户说"记录"、"记一下"、"沉淀"、"归档"、"写入知识库"、"记录这个知识点"时激活。也适用于用户粘贴其他 AI 对话内容要求整理归档的场景。
---

# Knowledge Writer

将对话中的知识沉淀到 GitHub 知识库（VitePress 静态站点）。

## 仓库信息

- **仓库**: `SayGoodBey/knowledge-base`
- **远程地址**: `https://github.com/SayGoodBey/knowledge-base.git`
- **本地路径**: 由 `scripts/sync.sh` 自动管理（clone 到 workspace 下）
- **网站**: `https://saygoodbey.github.io/knowledge-base/`

## 工作流程

### 1. 提取知识

从当前对话上下文中提取：
- **知识点**: 学到了什么（概念、原理、方法）
- **问题与解决**: 遇到了什么问题、如何解决
- **经验教训**: 踩了什么坑、有什么最佳实践

### 2. 自动分类

根据内容关键词和语义判断分类：

| 分类路径 | 主题 | 关键词 |
|----------|------|--------|
| `topics/ai/workflow/` | AI 工作流 | agent、工作流、编排、pipeline |
| `topics/ai/mcp/` | MCP 协议 | mcp、tool、protocol、server |
| `topics/ai/skill/` | Skill 开发 | skill、SKILL.md、技能 |
| `topics/k8s/node/` | K8s 节点 | node、调度、taint、cordon |
| `topics/k8s/deployment/` | 部署 | deployment、replica、rolling update |
| `topics/k8s/pod/` | Pod | pod、container、init、sidecar |
| `topics/k8s/pv-pvc/` | 存储 | pv、pvc、storageclass、volume |
| `topics/k8s/service/` | 服务 | service、ingress、loadbalancer |
| `topics/tools/` | 工具 | git、docker、cli、配置 |
| `topics/misc/` | 其他 | 无法归入以上分类 |

**动态扩展**: 如果内容明显属于新方向（如 Go 语言、网络、数据库等），在 `topics/` 下创建新目录并更新 VitePress sidebar 配置。

### 3. 写入文件

执行 `scripts/sync.sh` 完成 git 操作，然后写入 Markdown 文件。

#### 写入 Topic 文件

在对应分类目录的 `index.md` 中追加知识点：

```markdown
## [知识点标题] <日期>

**场景**: 简述遇到的场景或问题背景

**要点**:
- 要点 1
- 要点 2

**示例**（如有）:
\`\`\`
代码或命令示例
\`\`\`

---
```

#### 写入每日日志

同时在 `docs/daily/YYYY-MM-DD.md` 中记录（如文件不存在则创建）：

```markdown
# YYYY-MM-DD 学习日志

## 知识点
- [分类] 标题 → 详见 topics/xxx/

## 问题与解决
- **问题**: xxx
- **解决**: xxx

## 今日总结
简要总结今天学到的内容。
```

### 4. 提交并推送

```bash
scripts/sync.sh push "📝 add: <简要描述>"
```

### 5. 反馈用户

告知用户：
- 记录了什么内容
- 归入了哪个分类
- 网站链接（对应页面）

## 使用方式

用户只需说以下任意触发词：
- "记录一下"
- "帮我记一下这个"
- "沉淀这个知识点"
- "归档"
- "写入知识库"

也支持用户粘贴其他 AI（ChatGPT/Kimi/豆包等）的对话内容，说"帮我整理归档"。

## 注意事项

1. **Git 认证**: 使用 HTTPS + token 方式（已配置在 remote URL 中）
2. **冲突处理**: 始终先 pull 再 push，避免冲突
3. **幂等性**: 同一知识点不重复写入，通过标题+日期判断
4. **VitePress 配置**: 新增分类时需同步更新 `docs/.vitepress/config.ts` 的 sidebar
5. **编码规范**: 文件名使用英文小写 + 连字符，内容用中文
