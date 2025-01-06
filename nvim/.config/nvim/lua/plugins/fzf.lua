local img_previewer ---@type string[]?
for _, v in ipairs({
  { cmd = "chafa", args = { "{file}", "--format=symbols" } },
}) do
  if vim.fn.executable(v.cmd) == 1 then
    img_previewer = vim.list_extend({ v.cmd }, v.args)
    break
  end
end

return {
  "ibhagwan/fzf-lua",
  opts = {
    defaults = {
      no_header = true,
    },
    previewers = {
      builtin = {
        extensions = {
          ["png"] = img_previewer,
          ["jpg"] = img_previewer,
          ["jpeg"] = img_previewer,
          ["gif"] = img_previewer,
          ["webp"] = img_previewer,
        },
        ueberzug_scaler = "fit_contain",
      },
    },
  },
}
