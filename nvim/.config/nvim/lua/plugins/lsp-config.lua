-- -- Helper to execute LSP code actions by kind
-- local function lsp_action(action_kind)
--   return function()
--     vim.lsp.buf.code_action({
--       apply = true,
--       context = {
--         only = { action_kind },
--         diagnostics = {},
--       },
--     })
--   end
-- end
--
-- -- Helper to execute LSP workspace commands
-- local function lsp_execute(opts)
--   return function()
--     vim.lsp.buf_request(0, "workspace/executeCommand", {
--       command = opts.command,
--       arguments = opts.arguments and opts.arguments() or nil,
--     }, function(err, result)
--       if err then
--         vim.notify("Command not supported: " .. opts.command, vim.log.levels.WARN)
--         return
--       end
--       if opts.open and result then
--         -- Open results in quickfix if available
--         if type(result) == "table" and #result > 0 then
--           vim.fn.setqflist({}, " ", { title = opts.command, items = result })
--           vim.cmd("copen")
--         end
--       end
--     end)
--   end
-- end
--
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = false,
        virtual_lines = {
          current_line = true,
        },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "",
          },
          linehl = {},
          numhl = {
            [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
            [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
            [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
            [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
          },
        },
      },

      inlay_hints = { enabled = false },
      -- document_highlight = { enabled = false },

      servers = {
        -- tsgo = {
        --   keys = {
        --     -- Go to source definition (bypasses .d.ts files)
        --     {
        --       "gD",
        --       lsp_execute({
        --         command = "typescript.goToSourceDefinition",
        --         arguments = function()
        --           local params = vim.lsp.util.make_position_params(0, "utf-16")
        --           return { params.textDocument.uri, params.position }
        --         end,
        --         open = true,
        --       }),
        --       desc = "Goto Source Definition",
        --     },
        --     -- Find all file references
        --     {
        --       "gR",
        --       lsp_execute({
        --         command = "typescript.findAllFileReferences",
        --         arguments = function()
        --           return { vim.uri_from_bufnr(0) }
        --         end,
        --         open = true,
        --       }),
        --       desc = "File References",
        --     },
        --     -- Organize imports
        --     {
        --       "<leader>co",
        --       lsp_action("source.organizeImports"),
        --       desc = "Organize Imports",
        --     },
        --     -- Add missing imports
        --     {
        --       "<leader>cM",
        --       lsp_action("source.addMissingImports.ts"),
        --       desc = "Add Missing Imports",
        --     },
        --     -- Remove unused imports
        --     {
        --       "<leader>cu",
        --       lsp_action("source.removeUnused.ts"),
        --       desc = "Remove Unused Imports",
        --     },
        --     -- Fix all diagnostics
        --     {
        --       "<leader>cD",
        --       lsp_action("source.fixAll.ts"),
        --       desc = "Fix All Diagnostics",
        --     },
        --     -- Select TypeScript version
        --     {
        --       "<leader>cV",
        --       lsp_execute({ command = "typescript.selectTypeScriptVersion" }),
        --       desc = "Select TS Workspace Version",
        --     },
        --   },
        -- },
      },
    },
  },
}
