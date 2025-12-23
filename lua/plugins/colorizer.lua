return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup({
      "*", -- ativa em todos os arquivos
    })
  end,
}

