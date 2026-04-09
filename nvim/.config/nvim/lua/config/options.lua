-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
vim.g.lazyvim_prettier_needs_config = false
vim.g.ai_cmp = false
vim.g.lazyvim_picker = "snacks"
vim.g.lazyvim_blink_main = false
vim.g.root_spec = { "cwd" }
vim.g.lazyvim_python_lsp = "basedpyright"

vim.opt.cursorline = true

vim.opt.cursorlineopt = "number"
vim.opt.relativenumber = false
vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.sessionoptions = { "buffers", "curdir", "winsize", "help", "globals", "skiprtp", "folds" }
vim.opt.clipboard = "unnamedplus"
vim.opt.shell = "zsh"
-- vim.opt.guicursor = "n-v-c-sm:block-Cursor,i-ci-ve:block-CursorInsert,r-cr-o:block-CursorReplace"
vim.opt.autoread = true
vim.opt.swapfile = false

vim.opt.signcolumn = "yes"
vim.opt.foldcolumn = "auto:1"
vim.opt.statuscolumn = "%C %l %s"
vim.opt.fillchars:append({
  foldinner = " ",
})
vim.opt.numberwidth = 4
vim.opt.winborder = "none"
vim.opt.diffopt = {
  "internal",
  "filler",
  "closeoff",
  "context:12",
  "algorithm:histogram",
  "linematch:200",
  "indent-heuristic",
  "inline:word", -- Nvim 0.12: word-level inline diff (GitHub/GitLab style)
  "iwhite", -- I toggle this one, it doesn't fit all cases.
}

vim.filetype.add({
  pattern = {
    [".*%.component%.html"] = "htmlangular", -- Sets the filetype to `htmlangular` if it matches the pattern
    [".*%.mjml"] = "html", -- Sets the filetype to `html` if it matches the pattern
  },
})

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  once = true,
  callback = function()
    local events = { "BufReadPost", "BufNewFile" }
    local patterns = { "*.component.html", "*.container.html" }

    for _, event in ipairs(events) do
      for _, pattern in ipairs(patterns) do
        for _, autocmd in ipairs(vim.api.nvim_get_autocmds({ event = event, pattern = pattern })) do
          vim.api.nvim_del_autocmd(autocmd.id)
        end
      end
    end

    local group = vim.api.nvim_create_augroup("angular_treesitter_safe_start", { clear = true })
    vim.api.nvim_create_autocmd(events, {
      group = group,
      pattern = patterns,
      callback = function()
        local ok = pcall(vim.treesitter.start, nil, "angular")
        if not ok then
          pcall(vim.treesitter.start, nil, "html")
        end
      end,
    })
  end,
})
