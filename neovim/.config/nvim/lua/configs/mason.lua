dofile(vim.g.base46_cache .. "mason")

return {
  PATH = "skip",

  ui = {
    icons = {
      package_pending = " ",
      package_installed = " ",
      package_uninstalled = " ",
    },
  },

  max_concurrent_installers = 10,

  ensure_installed = {
    "lua_ls",
    "vue-language-server@2.2.8",
    "typescript-language-server@4.3.4",
    "eslint-lsp",
    "vscode-langservers-extracted",
    "clangd",
    "clang-format",
    "codelldb",
  },

  automatic_installation = true,
}
