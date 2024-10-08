
if true then
  return {}
end


return {
  "dmmulroy/tsc.nvim",
  config = function()
    require("tsc").setup({
      auto_open_qflist = true,
      auto_close_qflist = false,
      bin_path = vim.fn.findfile("node_modules/.bin/tsc"),
      enable_progress_notifications = true,
      flags = {
        noEmit = true,
        project = function()
          return vim.fn.findfile("tsconfig.json")
        end,
      },
      hide_progress_notifications_from_history = true,
      spinner = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" },
    })
  end
}
