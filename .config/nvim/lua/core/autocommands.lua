local projectSettings = {
  ["*/aviathon2022/freq-flyer-fe/*.vue"] = 2,
  ["*/aviathon2022/freq-flyer-fe/**/*.vue"] = 2,
  ["*/aviathon2022/aviathon-2022-freq-flyer-ticket-search/*.java"] = 4,
  ["*/aviathon2022/aviathon-2022-freq-flyer-ticket-search/**/*.java"] = 4
}

local setTab = function(size) vim.opt.tabstop = size
  vim.opt.softtabstop = size
  vim.opt.shiftwidth = size
end
local identationAutogroup = vim.api.nvim_create_augroup("IdentationAutogroup", { clear = true })
for k, v in pairs(projectSettings) do
  vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" },
    {
      pattern = k,
      callback = function()
        setTab(v)
      end,
      group = identationAutogroup
    }
  )
end

