require("typescript-tools").setup {
  settings = {
    expose_as_code_action = "all",
    jsx_close_tag = {
      enable = true,
      filetypes = { "javascriptreact", "typescriptreact" },
    },
    tsserver_file_preferences = {
      includeInlayParameterNameHints = "all",
      includeAutomaticOptionalChainCompletions = true,
      displayPartsForJSDoc = true,
      generateReturnInDocTemplate = true,
      includeInlayFunctionLikeReturnTypeHints = true,
      includeCompletionsWithObjectLiteralMethodSnippets = true,
      includeCompletionsForModuleExports = true,
      quotePreference = "auto",
      allowRenameOfImportPath = true,
    },
    tsserver_format_options = {
      allowIncompleteCompletions = true,
      allowRenameOfImportPath = true,
    },
  },
}
