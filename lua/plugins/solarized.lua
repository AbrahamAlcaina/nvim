-- for now disable it, testing tokonight
if true then
  return {}
end

return {
  {
    -- Solarize color scheme
    "shaunsingh/solarized.nvim",
    priority = 1000,
    config = function()
      vim.opt.background = "light"
    end,
  },
}
