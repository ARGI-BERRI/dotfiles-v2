vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.encoding = 'utf-8'

vim.opt.number = true

-- file util
vim.opt.autoread = true
vim.opt.hidden = true

-- view
vim.opt.title = true
vim.opt.number = true
vim.opt.ruler = true
vim.opt.cursorline = true
vim.opt.showmatch = true
vim.opt.showcmd = true
vim.opt.showmode = true
vim.opt.showmatch = true
vim.opt.scrolloff = 5

-- tab
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.autoindent = true

-- search
vim.opt.wrapscan = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- misc
vim.opt.wildmenu = true
vim.opt.gdefault = true
vim.opt.termguicolors = true
vim.opt.mouse = ""

-- set leader key as Space
vim.g.mapleader = " "

require("config.lazy")

-- <leader>rr to run 'uv run python %' when the file type is Python
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.keymap.set("n", "<leader>rr", function()
      local file = vim.fn.expand("%:p")
      vim.cmd("botright split | terminal uv run python " .. vim.fn.shellescape(file))
      vim.cmd("startinsert")
    end, { buffer = true, desc = "uv run python %" })
  end,
})

-- colorscheme
vim.cmd [[
    colorscheme kanagawa
    hi Normal guibg=NONE ctermbg=NONE
    hi LineNr guibg=NONE ctermbg=NONE
    hi VertSplit guibg=NONE ctermbg=NONE
    hi Special guibg=NONE ctermbg=NONE
    hi Identifier guibg=NONE ctermbg=NONE
    hi Comment guibg=None ctermbg=NONE
]]
