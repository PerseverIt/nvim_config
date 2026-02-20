--------------------------------------------------
-- 创建 augroup（防止重复加载）
--------------------------------------------------
local group = vim.api.nvim_create_augroup("CoreAutoCmds", { clear = true })

--------------------------------------------------
-- 1️⃣ 保存前删除行尾空格
--------------------------------------------------
vim.api.nvim_create_autocmd("BufWritePre", {
	group = group,
	pattern = "*",
	callback = function()
		local save = vim.fn.winsaveview()
		vim.cmd([[%s/\s\+$//e]])
		vim.fn.winrestview(save)
	end,
})

--------------------------------------------------
-- 2️⃣ 打开文件恢复上次光标位置
--------------------------------------------------
vim.api.nvim_create_autocmd("BufReadPost", {
	group = group,
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local line_count = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= line_count then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

--------------------------------------------------
-- 3️⃣ 进入插入模式关闭相对行号
--------------------------------------------------
vim.api.nvim_create_autocmd("InsertEnter", {
	group = group,
	callback = function()
		vim.opt.relativenumber = false
	end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
	group = group,
	callback = function()
		vim.opt.relativenumber = true
	end,
})

--------------------------------------------------
-- 4️⃣ 打开终端自动进入插入模式
--------------------------------------------------
vim.api.nvim_create_autocmd("TermOpen", {
	group = group,
	callback = function()
		vim.cmd("startinsert")
	end,
})


--------------------------------------------------
-- 6️⃣ 高亮 yank 内容
--------------------------------------------------
vim.api.nvim_create_autocmd("TextYankPost", {
	group = group,
	callback = function()
		vim.highlight.on_yank({ timeout = 150 })
	end,
})
