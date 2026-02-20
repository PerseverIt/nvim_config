return {
	'akinsho/toggleterm.nvim',
	version = "*",
	opts = {
		size = 20,
		open_mapping = [[<c-\>]], -- 快捷键 Ctrl + \ 打开/关闭
		direction = 'float', -- 浮窗模式，不占位
		float_opts = { border = 'curved' },
	},
	config = function(_, opts)
		require("toggleterm").setup(opts)

		-- 结合 Which-Key 中文描述
		local map = function(mode, l, r, desc)
			vim.keymap.set(mode, l, r, { desc = "终端: " .. desc })
		end

		map('n', '<leader>tf', '<cmd>ToggleTerm direction=float<cr>', '浮动终端')
		map('n', '<leader>th', '<cmd>ToggleTerm size=10 direction=horizontal<cr>', '水平终端')
		map('n', '<leader>tv', '<cmd>ToggleTerm size=80 direction=vertical<cr>', '垂直终端')
	end
}
