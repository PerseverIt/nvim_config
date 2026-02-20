return {
	"lewis6991/gitsigns.nvim",
	opts = {
		on_attach = function(bufnr)
			local gitsigns = require("gitsigns")

			-- 辅助函数：定义快捷键并添加描述
			local function map(mode, l, r, desc)
				vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
			end

			-- --- 导航 (Navigation) ---
			map('n', ']c', function()
				if vim.wo.diff then
					vim.cmd.normal({ ']c', bang = true })
				else
					gitsigns.nav_hunk('next')
				end
			end, "下一个变更 (Hunk)")

			map('n', '[c', function()
				if vim.wo.diff then
					vim.cmd.normal({ '[c', bang = true })
				else
					gitsigns.nav_hunk('prev')
				end
			end, "上一个变更 (Hunk)")

			-- --- Git 操作 (Actions) ---
			map('n', '<leader>hs', gitsigns.stage_hunk, "暂存当前 Hunk")
			map('n', '<leader>hr', gitsigns.reset_hunk, "重置当前 Hunk")

			map('v', '<leader>hs', function()
				gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
			end, "暂存选中的 Hunk")

			map('v', '<leader>hr', function()
				gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
			end, "重置选中的 Hunk")

			map('n', '<leader>hS', gitsigns.stage_buffer, "暂存整个文件")
			map('n', '<leader>hR', gitsigns.reset_buffer, "重置整个文件")
			map('n', '<leader>hp', gitsigns.preview_hunk, "预览 Hunk 变更")
			map('n', '<leader>hi', gitsigns.preview_hunk_inline, "行内预览 Hunk")

			map('n', '<leader>hb', function()
				gitsigns.blame_line({ full = true })
			end, "查看详细 Blame")

			map('n', '<leader>hd', gitsigns.diffthis, "查看 Diff (当前索引)")
			map('n', '<leader>hD', function()
				gitsigns.diffthis('~')
			end, "查看 Diff (最后一次提交)")

			map('n', '<leader>hQ', function() gitsigns.setqflist('all') end, "将所有变更加入 Quickfix")
			map('n', '<leader>hq', gitsigns.setqflist, "将当前变更加入 Quickfix")

			-- --- 开关 (Toggles) ---
			map('n', '<leader>tb', gitsigns.toggle_current_line_blame, "切换行内 Blame 显示")
			map('n', '<leader>tw', gitsigns.toggle_word_diff, "切换单词级 Diff")

			-- --- 文本对象 (Text object) ---
			-- 用于像 v ih (选中 hunk) 或 d ih (删除 hunk) 这样的操作
			map({ 'o', 'x' }, 'ih', gitsigns.select_hunk, "选中当前 Hunk")
		end,
	},
}
