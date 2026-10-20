vim.pack.add({
  {
    src = "https://github.com/neovim/nvim-lspconfig",
  },
  {
    src = "https://github.com/stevearc/conform.nvim",
  },
}, {
  confirm = false,
})

local profiles = require("languages")
local formatters_by_ft = {}
local options_by_ft = {}

for _, profile in ipairs(profiles) do
  local lsp_config = vim.tbl_deep_extend("force", {
    filetypes = vim.deepcopy(profile.filetypes),
  }, profile.lsp.config or {})

  vim.lsp.config(profile.lsp.name, lsp_config)
  vim.lsp.enable(profile.lsp.name)

  for _, filetype in ipairs(profile.filetypes) do
    formatters_by_ft[filetype] = vim.deepcopy(profile.formatters or {})
    options_by_ft[filetype] = vim.deepcopy(profile.options or {})
  end
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = vim.tbl_keys(options_by_ft),
  callback = function(event)
    for name, value in pairs(options_by_ft[event.match]) do
      vim.bo[event.buf][name] = value
    end
  end,
})

require("conform").setup({
  formatters_by_ft = formatters_by_ft,
  format_on_save = function(buffer)
    if formatters_by_ft[vim.bo[buffer].filetype] == nil then
      return nil
    end

    return {
      timeout_ms = 500,
      lsp_format = "fallback",
    }
  end,
})
