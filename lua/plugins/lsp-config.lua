return {
	{
		"mason-org/mason.nvim",
		dependencies = {
			"mason-org/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason").setup()

			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "eslint", "ts_ls", "tailwindcss", "pytight", "pylsp" },
			})

			vim.diagnostic.config({
				virtual_text = true,
				underline = true,
			})

			vim.lsp.enable("lua_ls")
		end,
	},
}
