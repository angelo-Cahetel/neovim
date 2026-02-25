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
				ensure_installed = { "lua_ls", "eslint", "ts_ls", "tailwindcss", "pyright", "pylsp" },
			})

			vim.diagnostic.config({
				virtual_text = false,
				underline = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			local ok_blink, blink = pcall(require, "blink.cmp")
				if ok_blink then
					capabilities = blink.get_lsp_capabilities(capabilities)
				end

				vim.lsp.config("ts_ls", {
					capabilities = capabilities,
				})
				vim.lsp.config("html", {
					capabilities = capabilities,
				})
				vim.lsp.config("lua_ls", {
					capabilities = capabilities,
				})

				vim.lsp.enable("ts_ls")
				vim.lsp.enable("html")
				vim.lsp.enable("lua_ls")

				vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
				vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
				vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
