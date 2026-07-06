local function open_lsp_list(opts)
  return function()
    opts.action({
      on_list = function(list)
        if #list.items == 0 then
          vim.notify("No " .. opts.title:lower() .. " found", vim.log.levels.INFO)
          return
        end

        local seen = {}
        local items = {}
        for _, item in ipairs(list.items) do
          local key = table.concat({ item.filename or item.bufnr, item.lnum, item.col }, ":")
          if not seen[key] then
            seen[key] = true
            items[#items + 1] = item
          end
        end

        vim.fn.setqflist({}, " ", {
          title = opts.title,
          items = items,
          context = list.context,
        })

        if opts.jump and #items == 1 then
          vim.cmd("silent cc 1")
          return
        end

        vim.cmd("botright copen 15")
      end,
    })
  end
end

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
        underline = {
          severity = {
            min = vim.diagnostic.severity.ERROR,
            max = vim.diagnostic.severity.ERROR,
          },
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
        ["*"] = {
          keys = {
            {
              "gd",
              open_lsp_list({ title = "Definitions", action = vim.lsp.buf.definition, jump = true }),
              desc = "Goto Definition (Quickfix)",
            },
            {
              "gr",
              open_lsp_list({
                title = "References",
                action = function(list_opts)
                  vim.lsp.buf.references(nil, list_opts)
                end,
              }),
              desc = "References (Quickfix)",
            },
            {
              "gI",
              open_lsp_list({ title = "Implementations", action = vim.lsp.buf.implementation, jump = true }),
              desc = "Goto Implementation (Quickfix)",
            },
            {
              "gy",
              open_lsp_list({ title = "Type Definitions", action = vim.lsp.buf.type_definition, jump = true }),
              desc = "Goto Type Definition (Quickfix)",
            },
          },
        },
        tsgo = true,
        vtsls = false,
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
      -- setup = {
      --   vtsls = function(_, opts)
      --     local on_attach = opts.on_attach
      --     opts.on_attach = function(client, bufnr)
      --       if on_attach then
      --         on_attach(client, bufnr)
      --       end
      --
      --       local caps = client.server_capabilities
      --       if not caps then
      --         return
      --       end
      --
      --       caps.completionProvider = nil
      --       caps.definitionProvider = false
      --       caps.typeDefinitionProvider = false
      --       caps.implementationProvider = false
      --       caps.referencesProvider = false
      --       caps.renameProvider = false
      --       caps.signatureHelpProvider = false
      --       caps.hoverProvider = false
      --       caps.documentSymbolProvider = false
      --       caps.workspaceSymbolProvider = false
      --       caps.documentHighlightProvider = false
      --       caps.inlayHintProvider = false
      --       caps.documentFormattingProvider = false
      --       caps.documentRangeFormattingProvider = false
      --       caps.documentOnTypeFormattingProvider = false
      --
      --       client.handlers["textDocument/publishDiagnostics"] = function() end
      --     end
      --   end,
      -- },
    },
  },
}
