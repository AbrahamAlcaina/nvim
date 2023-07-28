return {
    {
        -- Solarize color scheme
        'shaunsingh/solarized.nvim',
        priority = 1000,
        config = function()
          vim.opt.background="light"
          vim.cmd.colorscheme 'solarized'
        end,
      },
}