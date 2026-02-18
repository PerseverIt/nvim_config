--------------------------------------------------
-- Map 封装函数
--------------------------------------------------
local function map(mode, lhs, rhs, desc, opts)
  opts = opts or {}
  opts.desc = desc
  opts.silent = opts.silent ~= false
  vim.keymap.set(mode, lhs, rhs, opts)
end

--------------------------------------------------
-- 文件操作
--------------------------------------------------
map("n", "<leader>w", "<cmd>w<CR>", "保存文件")
map("n", "<leader>q", "<cmd>q<CR>", "退出")
map("n", "<leader>Q", "<cmd>q!<CR>", "强制退出")
map("n", "<leader>h", "<cmd>nohlsearch<CR>", "清除搜索高亮")

--------------------------------------------------
-- 窗口管理
--------------------------------------------------
map("n", "<leader>sv", "<cmd>vsplit<CR>", "垂直分屏")
map("n", "<leader>sh", "<cmd>split<CR>", "水平分屏")
map("n", "<leader>sc", "<cmd>close<CR>", "关闭当前窗口")

map("n", "<C-h>", "<C-w>h", "切换到左侧窗口")
map("n", "<C-l>", "<C-w>l", "切换到右侧窗口")
map("n", "<C-j>", "<C-w>j", "切换到下方窗口")
map("n", "<C-k>", "<C-w>k", "切换到上方窗口")

--------------------------------------------------
-- 插入模式
--------------------------------------------------
map("i", "jk", "<ESC>", "退出插入模式")

--------------------------------------------------
-- 缓冲区管理
--------------------------------------------------
map("n", "<leader>bn", "<cmd>bnext<CR>", "下一个缓冲区")
map("n", "<leader>bp", "<cmd>bprevious<CR>", "上一个缓冲区")
map("n", "<leader>bd", "<cmd>bdelete<CR>", "删除当前缓冲区")

--------------------------------------------------
-- 嵌入式开发常用
--------------------------------------------------
map("n", "<leader>mb", "<cmd>!make<CR>", "编译工程")
map("n", "<leader>mf", "<cmd>!make flash<CR>", "烧录程序")


--------------------------------------------------
-- LSP（如果启用）
--------------------------------------------------
map("n", "gd", vim.lsp.buf.definition, "跳转到定义")
map("n", "gr", vim.lsp.buf.references, "查找引用")
map("n", "K", vim.lsp.buf.hover, "查看文档")
map("n", "<leader>rn", vim.lsp.buf.rename, "重命名符号")

map("n", "<leader>e", "<cmd>Neotree toggle<CR>", "翻转侧边栏")
map("n", "<leader>o", "<cmd>Neotree reveal<CR>", "定位当前文件")
