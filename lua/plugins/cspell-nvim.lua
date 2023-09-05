return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    dependencies = { "davidmh/cspell.nvim" },
    opts = function(_, opts)
      local cspell = require('cspell')
      local config = {
        find_json = function(cwd)
          return "/home/abraham/.config/cspell.json"
        end,
      }
      opts.sources = vim.list_extend(opts.sources, { cspell.diagnostics.with({ config = config }) })
      opts.sources = vim.list_extend(opts.sources, { cspell.code_actions.with({ config = config }) })
      -- how i solved it
      -- https://github.com/davidmh/cspell.nvim/issues/12
      -- https://github.com/LazyVim/LazyVim/discussions/154
    end,
  }, }
