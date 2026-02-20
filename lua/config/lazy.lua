-- 下载lazy并添加到运行时最高优先级
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out,                            "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

--设置全局leader键
vim.g.mapleader = " "
--设置局部leader键
vim.g.maplocalleader = "\\"

--启动lazy
require("lazy").setup({
	spec = {
		-- 在plugins目录下找插件
		{ import = "plugins" },
	},
	--默认安装时主题
	install = { colorscheme = { "habamax" } },
	--自动更新插件
	checker = { enabled = true },
})

