vim.filetype.add({
  pattern = {
    [".*%.component%.html"] = "htmlangular", -- Sets the filetype to `htmlangular` if it matches the pattern
    [".*%.mjml"] = "mjml", -- Sets the filetype to `html` if it matches the pattern
  },
})
