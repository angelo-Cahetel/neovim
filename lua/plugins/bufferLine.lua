return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				mode = "buffers",
				diagnostics = "nvim_lsp",
				separator_style = "thick",
				show_buffer_close_icons = true,
				show_close_icon = true,
			},
		})
	end,

	vim.keymap.set("n", "<leader>l", ":BufferLineCycleNext<CR>"),
	vim.keymap.set("n", "<leader>h", ":BufferLineCyclePrev<CR>"),
}
