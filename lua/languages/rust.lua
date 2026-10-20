return {
  filetypes = {
    "rust",
  },
  lsp = {
    name = "rust_analyzer",
    config = {
      settings = {
        ["rust-analyzer"] = {
          check = {
            command = "clippy",
          },
        },
      },
    },
  },
  formatters = {
    "rustfmt",
  },
  options = {
    tabstop = 4,
    shiftwidth = 4,
    softtabstop = 4,
    expandtab = true,
  },
}
