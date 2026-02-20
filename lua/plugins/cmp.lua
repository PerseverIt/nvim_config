return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp", -- 核心：让 cmp 获得 LSP 的数据
		"hrsh7th/cmp-buffer", -- 补全当前文件里的关键词
		"hrsh7th/cmp-path", -- 补全路径
		"hrsh7th/cmp-cmdline", -- 补全命令行 (:)
		"hrsh7th/cmp-vsnip", -- 代码片段补全 (对应你例子里的 vsnip)
		"hrsh7th/vim-vsnip", -- 代码片段引擎
	},
	config = function()
		local cmp = require("cmp")

		cmp.setup({
			snippet = {
				expand = function(args)
					vim.fn["vsnip#anonymous"](args.body) -- 使用 vsnip 引擎
				end,
			},
			mapping = cmp.mapping.preset.insert({
				['<C-b>'] = cmp.mapping.scroll_docs(-4),
				['<C-f>'] = cmp.mapping.scroll_docs(4),
				['<C-Space>'] = cmp.mapping.complete(),
				['<C-e>'] = cmp.mapping.abort(),
				['<CR>'] = cmp.mapping.confirm({ select = true }), -- 回车确认补全
				['<Tab>'] = cmp.mapping.select_next_item(), -- Tab 下一个
				['<S-Tab>'] = cmp.mapping.select_prev_item(), -- Shift-Tab 上一个
			}),
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' }, -- 优先级最高：LSP
				{ name = 'vsnip' }, -- 优先级次之：代码片段
			}, {
				{ name = 'buffer' }, -- 优先级最低：当前文件单词
			})
		})

		-- 命令行 / 搜索 补全
		cmp.setup.cmdline({ '/', '?' }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = { { name = 'buffer' } }
		})
		cmp.setup.cmdline(':', {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({ { name = 'path' } }, { { name = 'cmdline' } })
		})
	end
}
