# knowledge-writer

> 个人知识库写入 Skill — 把对话中学到的知识点、踩坑经验自动分类写入 GitHub 知识库（VitePress 静态站点）。

## 能力

- 从当前对话中提取知识点 / 问题与解决 / 经验教训
- 按主题自动分类（AI / K8s / 工具 …）
- 写入对应 topic 的 `index.md` + `docs/daily/YYYY-MM-DD.md`
- 自动 `git pull → commit → push` 到知识库仓库

## 触发词

- 记录一下 / 记一下 / 帮我记一下这个
- 沉淀 / 归档 / 写入知识库
- 粘贴其他 AI（ChatGPT / Kimi / 豆包）对话 + "帮我整理归档"

## 支持的 Agent

这个 skill 可在以下 Agent 中使用：

- **OpenClaw** — `~/.openclaw/skills/knowledge-writer/`
- **WorkBuddy** — `~/.workbuddy/skills/knowledge-writer/`
- **CodeBuddy** — `~/.codebuddy/skills/knowledge-writer/`

推荐以其中一个为源，另外两个用 symlink 指过去，更新自动同步。

## 安装

### 方式 1：Git clone（推荐）

```bash
# 选一个 Agent 作为源头（这里以 openclaw 为例）
git clone https://github.com/SayGoodBey/skill-knowledge-writer.git \
  ~/.openclaw/skills/knowledge-writer

# 其他 Agent 创建 symlink
ln -s ~/.openclaw/skills/knowledge-writer ~/.workbuddy/skills/knowledge-writer
ln -s ~/.openclaw/skills/knowledge-writer ~/.codebuddy/skills/knowledge-writer
```

### 方式 2：手动复制

下载压缩包解压到对应 `~/.<agent>/skills/` 目录。

## 配置

skill 会读取以下环境变量（建议写到 `~/.zshrc`）：

| 变量 | 说明 | 必需 |
|------|------|------|
| `GITHUB_TOKEN` | GitHub Personal Access Token（`repo` 权限） | push 时必需 |
| `KB_GITHUB_USER` | 知识库仓库拥有者（默认 `SayGoodBey`） | 否 |
| `KB_REPO_NAME` | 知识库仓库名（默认 `knowledge-base`） | 否 |
| `KB_WORKSPACE` | 本地知识库工作目录（默认 `~/.openclaw/workspace/knowledge-base`） | 否 |

## 更新

```bash
cd ~/.openclaw/skills/knowledge-writer
git pull
```

由于其他 Agent 通过 symlink 指过来，`git pull` 一次三端同步。

## 目录结构

```
knowledge-writer/
├── SKILL.md                 # 入口：描述 + 触发词 + 工作流程
├── references/
│   └── categories.md        # 分类体系参考
├── scripts/
│   └── sync.sh              # git 同步脚本（pull/push）
└── README.md                # 本文件
```

## License

MIT
