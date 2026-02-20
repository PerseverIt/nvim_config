return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		lazy = false,  --启动立即加载

		config = function() --setup函数放到里面
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
			})

			-- setup must be called before loading
			vim.cmd.colorscheme "catppuccin"
		end,
	},
}
