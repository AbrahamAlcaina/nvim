return {
  {
    "nvimtools/none-ls.nvim",
    event = "BufReadPre",
    dependencies = { "davidmh/cspell.nvim" },
    opts = function(_, opts)
      local nls = require("null-ls")
      local cspell = require('cspell')
      local cspell_config = vim.fn.expand("$HOME/.config/cspell.json")
      local shared_config = {
        find_json = function()
          return cspell_config
        end,
      }
      opts.sources = vim.list_extend(opts.sources, {
        cspell.diagnostics.with({ config = shared_config }),
        cspell.code_actions.with({ config = shared_config })
      })
    end,
  }, }
