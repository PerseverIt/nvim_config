local opt = vim.opt --opt变量为vim.opt

--行号
opt.number = true	--开启行号显示
opt.relativenumber = true --开启相对行号显示

--缩进
opt.tabstop = 4 --开启tab显示为4格
opt.shiftwidth = 4 --开启tab宽度为4格
opt.smartindent = true --开启根据代码结构自动缩进

--搜索
opt.ignorecase = true --开启搜索忽略大小写
opt.smartcase = true --如果包含大写则区分大小写

--UI
opt.termguicolors = true --开启24位真色彩,主题需要
opt.wrap = false --不自动换行，这里我有点想自动换行
opt.cursorline = true --高亮当前


--文件
opt.swapfile = false --不生成防崩溃文件，没必要
opt.backup = false	--不生成备份文件
opt.undofile = true --关闭文件也能保持撤销

--性能
opt.updatetime = 300 --LSP诊断更快刷新
opt.signcolumn = "yes" --防止LSP错误、Git修改标记导致界面抖动

--leader键
vim.g.maleader = " "
