# Neovim Configuration

个人 Neovim 配置，基于 lazy.nvim 插件管理器，适用于嵌入式开发和日常编程。

## 特性

- **插件管理**: lazy.nvim (懒加载，启动快)
- **LSP 支持**: lua_ls, clangd, rust_analyzer, makefile_language_server
- **代码补全**: nvim-cmp + vsnip
- **语法高亮**: treesitter
- **格式化**: conform.nvim (保存自动格式化)
- **主题**: catppuccin-mocha
- **文件管理**: neo-tree + telescope

## 目录结构

```
~/.config/nvim/
├── init.lua                 # 入口文件
├── lua/
│   ├── config/
│   │   ├── options.lua      # 基础选项
│   │   ├── keymaps.lua      # 快捷键映射
│   │   ├── autocmds.lua     # 自动命令
│   │   └── lazy.lua         # 插件管理器配置
│   └── plugins/             # 插件配置
└── lsp/                     # LSP 服务器配置
```

## 核心快捷键

Leader 键: `空格`

### 文件操作
| 快捷键 | 功能 |
|--------|------|
| `<leader>w` | 保存文件 |
| `<leader>q` | 退出 |
| `<leader>Q` | 强制退出 |
| `jk` | 退出插入模式 |

### 搜索 (Telescope)
| 快捷键 | 功能 |
|--------|------|
| `<leader>ff` | 查找文件 |
| `<leader>fg` | 全文搜索 |
| `<leader>fb` | 缓冲区列表 |
| `<leader>fh` | 帮助文档 |

### 窗口管理
| 快捷键 | 功能 |
|--------|------|
| `<leader>sv` | 垂直分屏 |
| `<leader>sh` | 水平分屏 |
| `<C-h/j/k/l>` | 窗口间切换 |

### LSP
| 快捷键 | 功能 |
|--------|------|
| `gd` | 跳转到定义 |
| `gr` | 查找引用 |
| `K` | 查看文档 |
| `<leader>rn` | 重命名 |
| `<leader>ca` | 代码操作 |

### 文件树 (Neo-tree)
| 快捷键 | 功能 |
|--------|------|
| `<leader>e` | 打开/关闭侧边栏 |
| `<leader>o` | 定位当前文件 |

### 终端 (ToggleTerm)
| 快捷键 | 功能 |
|--------|------|
| `Ctrl+\` | 打开/关闭终端 |
| `<leader>tf` | 浮动终端 |
| `<leader>th` | 水平终端 |
| `<leader>tv` | 垂直终端 |

### 嵌入式开发
| 快捷键 | 功能 |
|--------|------|
| `<leader>mb` | 编译工程 (make) |
| `<leader>mf` | 烧录程序 (make flash) |
| `<leader>fm` | 格式化代码 |

## 插件列表

| 插件 | 用途 |
|------|------|
| lazy.nvim | 插件管理 |
| nvim-lspconfig | LSP 配置 |
| mason.nvim | LSP/DAP 安装器 |
| nvim-cmp | 代码补全 |
| nvim-treesitter | 语法高亮 |
| conform.nvim | 代码格式化 |
| telescope.nvim | 模糊搜索 |
| neo-tree.nvim | 文件树 |
| catppuccin | 主题 |
| lualine.nvim | 状态栏 |
| bufferline.nvim | 标签栏 |
| gitsigns.nvim | Git 标记 |
| diffview.nvim | Git diff 查看 |
| toggleterm.nvim | 终端管理 |
| which-key.nvim | 快捷键提示 |
| trouble.nvim | 诊断列表 |
| todo-comments.nvim | TODO 高亮 |
| nvim-autopairs | 自动括号 |
| indent-blankline.nvim | 缩进线 |

## 安装

```bash
# 备份原有配置
mv ~/.config/nvim ~/.config/nvim.bak

# 克隆配置
git clone https://github.com/YOUR_USERNAME/nvim.git ~/.config/nvim

# 启动 Neovim，插件会自动安装
nvim
```

## 依赖

- Neovim >= 0.10
- Git
- [Nerd Font](https://www.nerdfonts.com/) (图标显示)
- ripgrep (Telescope live_grep)
- Node.js (部分 LSP)
- clang-format, stylua, rustfmt (格式化)

## License

MIT
