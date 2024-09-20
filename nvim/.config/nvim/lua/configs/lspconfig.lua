-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = { "cssls", "ts_ls", "angularls", "eslint" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- Eslint LSP
lspconfig.eslint.setup({
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
})

-- Angular LSP
local ok, mason_registry = pcall(require, 'mason-registry')
if not ok then
  vim.notify 'mason-registry could not be loaded'
  return
end

local angularls_path =
    mason_registry.get_package('angular-language-server'):get_install_path()

local cmd = {
  'ngserver',
  '--stdio',
  '--tsProbeLocations',
  table.concat({
    angularls_path,
    vim.uv.cwd(),
  }, ','),
  '--ngProbeLocations',
  table.concat({
    angularls_path .. '/node_modules/@angular/language-server',
    vim.uv.cwd(),
  }, ','),
}

require 'lspconfig'.angularls.setup {
  root_dir = lspconfig.util.root_pattern('angular.json', 'package.json', '.git'),
  cmd = cmd,
  on_new_config = function(new_config, new_root_dir)
    new_config.cmd = cmd
  end,
}

return config
