return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "saghen/blink.cmp" },

  config = function()
    local pyright_cmd = vim.fn.executable("uv") == 1
        and { "uv", "run", "pyright-langserver", "--stdio" }
      or { "pyright-langserver", "--stdio" }

    -- Pyright for Python LSP
    vim.lsp.config("pyright", {
      capabilities = require("blink.cmp").get_lsp_capabilities(),
      cmd = pyright_cmd,
    })
    vim.lsp.enable("pyright")

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local opts = { buffer = args.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "[d", function()
          vim.diagnostic.jump({ count = -1 })
        end, opts)
        vim.keymap.set("n", "]d", function()
          vim.diagnostic.jump({ count = 1 })
        end, opts)
      end,
    })
  end,
}
