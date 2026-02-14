return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")

      telescope.setup({
        defaults = {
          -- Padrões para ignorar arquivos (node_modules, .git, etc)
          file_ignore_patterns = {
            "node_modules",
            ".git",
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })

      -- Carrega a extensão ui-select
      pcall(telescope.load_extension, "ui-select")

      -- Atalhos
      vim.keymap.set("n", "<leader>s", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
    end,
  },
}
