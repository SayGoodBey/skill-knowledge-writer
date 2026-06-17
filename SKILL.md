---
name: knowledge-writer
description: 个人知识库写入技能。将对话中学到的知识点、遇到的问题、经验教训自动分类并写入 GitHub 知识库项目（VitePress）。触发场景：用户说"记录"、"记一下"、"沉淀"、"归档"、"写入知识库"、"记录这个知识点"时激活。也适用于用户粘贴其他 AI 对话内容要求整理归档的场景。
---

# Knowledge Writer

将对话中的知识沉淀到 GitHub 知识库（VitePress 静态站点）。

## 仓库信息

- **仓库**: `SayGoodBey/knowledge-base`
- **远程地址**: `https://github.com/SayGoodBey/knowledge-base.git`
- **本地路径**: `<workspace>/knowledge-base`（`<workspace>` 即当前 IDE 工作区根目录，由 skill 在运行时自适应解析）
- **网站**: `https://saygoodbey.github.io/knowledge-base/`

## 工作流程

### 0. 同步仓库（每次操作前必做）

```bash
cd <workspace>/knowledge-base
git pull --rebase origin main
```

如果本地不存在，先 clone：
```bash
cd <workspace>
git clone https://github.com/SayGoodBey/knowledge-base.git
cd knowledge-base
```

### 1. 提取知识

从当前对话上下文中提取：
- **知识点**: 学到了什么（概念、原理、方法）
- **问题与解决**: 遇到了什么问题、如何解决
- **经验教训**: 踩了什么坑、有什么最佳实践

### 2. 自动分类

根据内容关键词和语义判断分类。**用户主业是前端开发，主要项目是集群管理控制台（React）和 DRMS 容灾系统（Next.js）**，分类体系按此优化。

> 完整的分类详情、用户工作画像、扩展规则、同步维护清单参见 [`references/categories.md`](./references/categories.md)。本节是简化版速查，**两份文档需保持同步**。

#### 双轴分类原则

- **技术分类** `topics/frontend/`、`topics/k8s/`、`topics/ai/`、`topics/devops/`：放**可复用**的通用知识
- **项目分类** `topics/projects/xxx/`：放**项目专属**的决策、模块实现、业务约定

判断流程：先问"别的项目能用吗？" → 能 → 技术分类；不能 → 项目分类。同一知识点可以在两处都记录，技术分类写抽象要点，项目分类写具体落地并链接过去。

#### 分类表

| 分类路径 | 主题 | 关键词 |
|----------|------|--------|
| **🎨 前端（主业）** |||
| `topics/frontend/react/` | React | hook、useState、useEffect、memo、组件 |
| `topics/frontend/next/` | Next.js | next、app router、ssr、ssg、middleware |
| `topics/frontend/typescript/` | TypeScript | ts、类型、泛型、typescript |
| `topics/frontend/build-tools/` | 构建工具 | webpack、vite、turborepo、husky、lint-staged |
| `topics/frontend/styling/` | 样式方案 | css、tailwind、styled-components、主题 |
| `topics/frontend/i18n/` | 国际化 | i18next、i18n、中文源码、语言包、hash 扫描 |
| `topics/frontend/state/` | 状态管理 | redux、zustand、immer、context、state |
| `topics/frontend/testing/` | 测试 | vitest、jest、playwright、单元测试 |
| `topics/frontend/performance/` | 性能优化 | 性能、lighthouse、包体积、懒加载、内存泄漏 |
| **🚀 业务项目** |||
| `topics/projects/cluster-console/` | 集群管理（React） | 集群管理、GPU 监控、云监控、容灾演练、节点监控、Pod 监控、kube-state-metrics |
| `topics/projects/drms/` | DRMS（Next.js） | drms、容灾、任务引擎、进度、轮询 |
| **🔧 DevOps** |||
| `topics/devops/ci-cd/` | CI/CD | github actions、流水线、腾讯 CI、发布 |
| `topics/devops/git/` | Git | git、commit、rebase、分支 |
| `topics/devops/code-quality/` | 代码质量 | eslint、prettier、husky、lint-staged、代码规范 |
| `topics/devops/automation/` | 自动化 | mcp、agent、自动化、shell、脚本、nohup、tmux、TAPD 自动化 |
| **☸️ Kubernetes（辅助领域知识）** |||
| `topics/k8s/node/` | K8s 节点 | node、调度、taint、cordon、污点 |
| `topics/k8s/deployment/` | 部署 | deployment、replica、rolling update |
| `topics/k8s/pod/` | Pod | pod、container、init、sidecar |
| `topics/k8s/pv-pvc/` | 存储 | pv、pvc、storageclass、volume |
| `topics/k8s/service/` | 服务 | service、ingress、loadbalancer |
| `topics/k8s/gpu/` | GPU 工作负载 | gpu、nvidia、cuda、qgpu、tke.cloud.tencent.com/qgpu、nvml |
| **🤖 AI** |||
| `topics/ai/workflow/` | AI 工作流 | agent、工作流、编排、pipeline、langgraph、dify |
| `topics/ai/mcp/` | MCP 协议 | mcp、tool、protocol、server |
| `topics/ai/skill/` | Skill 开发 | skill、SKILL.md、技能 |
| **🗂 兜底** |||
| `topics/misc/` | 其他 | 无法归入以上分类 |

**动态扩展**: 如果内容明显属于新方向（如 Go 语言、网络、数据库等），在 `topics/` 下创建新目录并同步更新：
- `docs/.vitepress/config.ts` 的 `nav` 和 `sidebar`
- 本 SKILL.md 的分类表
- 父级 `index.md` 的索引

### 3. 写入文件

#### 3.1 写入 Topic 文件

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

#### 3.2 写入每日日志

在 `docs/daily/YYYY-MM-DD.md` 中记录（如文件不存在则创建）：

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

#### 3.3 ⚠️ 更新 VitePress 配置（关键步骤，不可遗漏！）

每次新建 daily 文件后，**必须**同步更新以下两处，否则网站不会显示新页面：

**① 更新 `docs/.vitepress/config.ts` 的 sidebar**

在 `'/daily/'` 的 `items` 数组中插入新条目，按日期降序排列（最新在最前）：

```typescript
// 找到 sidebar '/daily/' 部分的 items 数组
items: [
  { text: '索引', link: '/daily/' },
  { text: 'YYYY-MM-DD · 简短标题', link: '/daily/YYYY-MM-DD' },  // ← 新增（插在索引后面，按日期降序）
  // ... 旧条目
]
```

**② 更新 `docs/daily/index.md` 索引页**

在「最近记录」列表顶部插入新链接：

```markdown
## 最近记录

- [YYYY-MM-DD](/daily/YYYY-MM-DD) —— 简短标题    ← 新增
- [旧日期](/daily/旧日期) —— 旧标题
```

**③ 如果新建了 topic 分类目录**，还需：
- 在 `config.ts` 对应 sidebar section 加入条目
- 在父级 `index.md` 加入链接

### 4. 提交并推送

```bash
cd <workspace>/knowledge-base
git add -A
git commit -m "📝 add: <简要描述>"
git push origin main
```

### 5. 反馈用户

告知用户：
- 记录了什么内容
- 归入了哪个分类
- 网站链接（对应页面）
- sidebar 是否已同步更新

## 使用方式

用户只需说以下任意触发词：
- "记录一下"
- "帮我记一下这个"
- "沉淀这个知识点"
- "归档"
- "写入知识库"

也支持用户粘贴其他 AI（ChatGPT/Kimi/豆包等）的对话内容，说"帮我整理归档"。

## 注意事项

1. **Git 操作**: 直接使用 git 命令，操作前先 `git pull --rebase origin main` 避免冲突
2. **冲突处理**: 始终先 pull 再 push；如遇冲突，优先保留远程版本再追加本地内容
3. **幂等性**: 同一知识点不重复写入，通过标题+日期判断
4. **VitePress 注册**: ⚠️ **新增 daily 文件或新 topic 分类时，必须同步更新 `config.ts` sidebar 和对应 `index.md`**，否则网站导航中不显示
5. **编码规范**: 文件名使用英文小写 + 连字符，内容用中文
6. **daily sidebar 排序**: 按日期降序（最新在最前），索引条目始终在第一位
