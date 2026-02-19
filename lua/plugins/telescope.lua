return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "查找文件" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "全文搜索" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "缓冲区列表" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "帮助文档" },
  },
}
