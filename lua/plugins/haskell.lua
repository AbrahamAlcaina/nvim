vim.g.haskell_tools = {
  tools = {
    codeLens = {
      autoRefresh = true,
    },
    hoogle = { mode = "telescope-local" },
    hover = { enable = true },
    fastTags = { enable = true },
  },
}

return {
  'mrcjkb/haskell-tools.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim', "nvim-telescope/telescope.nvim"
  },
  version = '^2', -- Recommended
  ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' },

}
-- ~/.config/nvim/after/ftplugin/haskell.lua
