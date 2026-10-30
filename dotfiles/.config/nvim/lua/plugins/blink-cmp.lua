return {
  "saghen/blink.cmp",
  event = { "InsertEnter" },
  version = "*",
  opts = {
    keymap = {
      preset = "default",
      ["<Down>"] = { "select_next", "fallback" },
      ["<Up>"] = { "select_prev", "fallback" },
      ["<Tab>"] = { "accept", "fallback" },
    },
    sources = {
      default = { "lsp", "path", "buffer" },
    },
    completion = {
      documentation = { auto_show = true },
    },
  },
}
