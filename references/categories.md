# 分类体系参考

本文档定义知识库的分类体系，供 AI 判断知识归属时参考。**与 `SKILL.md` 的分类表保持同步，二者作为一组维护。**

## 用户工作画像（决定分类设计的根本依据）

- **角色**：前端开发工程师
- **主要项目**：
  - 集群管理控制台（K8s 控制台前端，**React** 项目）
  - DRMS 容灾系统（**Next.js** 项目）
- **业务模块**：GPU 监控、云监控、容灾演练、节点监控、Pod 监控、边缘集群部署 UI
- **常用技术栈**：React、Next.js、TypeScript、i18next（中文源码 + 构建期 hash 扫描）、dayjs、immer、husky v4、lint-staged、eslint
- **正在探索**：MCP + 本地 Agent 自动化（TAPD / WeTerm3 / 浏览器 / 开发工具）

分类体系按"前端主业 + 业务项目 + 工程化"三大支柱组织，K8s / AI 作为辅助领域知识保留。

## 双轴分类原则

| 轴 | 路径前缀 | 放什么 |
|---|---|---|
| **技术轴**（可复用知识） | `frontend/` `k8s/` `ai/` `devops/` | 抽象的、跨项目可用的技术要点 |
| **项目轴**（项目专属决策） | `projects/<项目名>/` | 模块实现、业务约定、架构决策、踩坑 |

**判断流程**：先问"别的项目能用吗？"
- 能 → 技术轴
- 不能 → 项目轴
- 都沾 → 两边都记，技术轴写抽象要点 + 链接到项目轴的具体落地

## 当前分类

### 🎨 前端（主业）
| 子分类 | 路径 | 涵盖内容 |
|--------|------|----------|
| React | `topics/frontend/react/` | Hooks、组件设计、性能优化、状态管理模式 |
| Next.js | `topics/frontend/next/` | App Router、SSR/SSG、数据获取、middleware |
| TypeScript | `topics/frontend/typescript/` | 类型设计、泛型技巧、工程实践 |
| 构建工具 | `topics/frontend/build-tools/` | webpack、vite、turborepo、husky、lint-staged |
| 样式方案 | `topics/frontend/styling/` | CSS、tailwind、CSS-in-JS、主题切换 |
| 国际化 i18n | `topics/frontend/i18n/` | i18next、中文源码、构建期 hash 扫描、语言包管理 |
| 状态管理 | `topics/frontend/state/` | redux、zustand、immer、context、状态架构 |
| 测试 | `topics/frontend/testing/` | vitest、jest、playwright、组件测试、mock |
| 性能优化 | `topics/frontend/performance/` | 渲染优化、包体积、懒加载、Lighthouse、内存泄漏 |

### 🚀 业务项目
| 子分类 | 路径 | 涵盖内容 |
|--------|------|----------|
| 集群管理控制台 | `topics/projects/cluster-console/` | React 项目，K8s 控制台前端：GPU 监控、云监控、容灾演练、节点监控、Pod 监控、边缘集群部署 UI |
| DRMS 容灾系统 | `topics/projects/drms/` | Next.js 项目：任务步骤、进度算法、轮询逻辑、异常处理 |

### 🔧 DevOps 与工程化
| 子分类 | 路径 | 涵盖内容 |
|--------|------|----------|
| CI/CD | `topics/devops/ci-cd/` | GitHub Actions、腾讯 CI、流水线、自动发布 |
| Git | `topics/devops/git/` | git flow、commit 规范、常用命令、疑难操作 |
| 代码质量 | `topics/devops/code-quality/` | eslint、prettier、husky、lint-staged 配置与实践 |
| 自动化 | `topics/devops/automation/` | MCP + 本地 Agent、Shell 技巧（nohup/tmux/disown）、AI 驱动的 TAPD/浏览器自动化 |

### ☸️ Kubernetes（辅助领域知识）
| 子分类 | 路径 | 涵盖内容 |
|--------|------|----------|
| Node | `topics/k8s/node/` | 节点管理、调度、污点容忍、标签选择器 |
| Deployment | `topics/k8s/deployment/` | 部署策略、滚动更新、回滚、HPA |
| Pod | `topics/k8s/pod/` | 生命周期、Init Container、Sidecar、探针、未就绪诊断 |
| PV/PVC | `topics/k8s/pv-pvc/` | 持久卷、存储类、动态供给、CSI |
| Service | `topics/k8s/service/` | ClusterIP、NodePort、LoadBalancer、Ingress |
| GPU 工作负载 | `topics/k8s/gpu/` | GPU device plugin、qGPU 切片、TCE 排障、容器内 GPU 验证 |

### 🤖 AI
| 子分类 | 路径 | 涵盖内容 |
|--------|------|----------|
| 工作流 | `topics/ai/workflow/` | Agent 编排、Pipeline、DAG、LangGraph、Dify |
| MCP | `topics/ai/mcp/` | Model Context Protocol、工具注册、Server/Client |
| Skill | `topics/ai/skill/` | OpenClaw Skill、SKILL.md 规范、技能设计 |

### 🗂 兜底
| 子分类 | 路径 | 涵盖内容 |
|--------|------|----------|
| 工具 | `topics/tools/` | （已降权，新内容优先走 devops/）老的工具笔记 |
| 其他 | `topics/misc/` | 单次出现、暂时无法归类的零散知识 |

## 分类判断规则

1. **优先精确匹配**：内容明确属于某子分类则直接归入
2. **关键词辅助**：参考 SKILL.md 中的关键词表
3. **跨分类时**：技术分类写抽象要点 + 链接，项目分类写具体落地
4. **新建分类**：同一新方向出现 2+ 次时创建新子分类目录
5. **避免碎片化**：单次出现的零散知识进 `misc/`，跨项目 3+ 次才考虑升级为一级分类

## 扩展分类（按需创建）

当以下方向的知识积累到一定量时，可创建独立分类：
- `topics/backend/` - 如未来涉及 Node.js / 后端服务
- `topics/network/` - 网络协议、抓包、调试
- `topics/database/` - 数据库
- `topics/linux/` - Linux 系统
- `topics/security/` - 安全
- `topics/data-viz/` - 数据可视化（如果监控面板做得多）

## 同步维护清单

新增/修改分类时，必须同步更新：

1. **`docs/.vitepress/config.ts`** —— `nav` 和 `sidebar` 配置
2. **`docs/index.md`** —— 首页 features
3. **父级 `index.md`** —— 比如新增 `frontend/xxx/` 要更新 `frontend/index.md` 索引
4. **本文件 `references/categories.md`** —— 表格 + 关键词
5. **`SKILL.md`** —— 分类表（与本文件保持一致）

## 历史变更

- **2026-05-07 v2**：基于用户真实工作画像（前端主业 + 集群管理 + DRMS）重组体系。新增 `frontend/` (9 子)、`projects/` (2 子)、`devops/` (4 子) 三大一级分类；K8s 下新增 `gpu/`；`tools/` 降权由 `devops/` 接力。
- **2026-05-07 v1**：初版分类，AI / K8s / tools / misc。
