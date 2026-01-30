return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    keys = {
      -- {
      --   "<leader>/",
      --   function()
      --     Snacks.picker.resume({ source = "grep" })
      --   end,
      --   desc = "Grep (Root Dir)",
      -- },
      -- {
      --   "<leader><leader>",
      --   function()
      --     Snacks.picker.resume({ source = "files" })
      --   end,
      --   desc = "Find Files (Root Dir)",
      -- },
    },
    opts = {
      bigfile = {
        linelength = 800,
      },
      notifier = { enabled = false },
      words = {
        enabled = true,
        modes = { "v" },
      },
      indent = { enabled = false },
      animate = { enabled = false },
      image = {},
      dashboard = {
        preset = {
          header = [[
          ]],
        },
      },
      lazygit = {
        toggle = true,
        config = {
          os = {
            edit = '[ -z ""$NVIM"" ] && (nvim -- {{filename}}) || (nvim --server ""$NVIM"" --remote-send ""q"" && nvim --server ""$NVIM"" --remote {{filename}})',
            editAtLine = '[ -z ""$NVIM"" ] && (nvim +{{line}} -- {{filename}}) || (nvim --server ""$NVIM"" --remote-send ""q"" && nvim --server ""$NVIM"" --remote {{filename}} && nvim --server ""$NVIM"" --remote-send "":{{line}}<CR>"")',
          },
          git = {
            merging = {
              manualCommit = false,
            },
          },
        },
      },
      picker = {
        sources = {
          explorer = {
            ---@diagnostic disable-next-line: missing-fields
            icons = {
              tree = {
                vertical = "  ",
                middle = "  ",
                last = "  ",
              },
            },
            diagnostics = false,
            layout = {
              cycle = false,
              preview = false,
              layout = {
                backdrop = false,
                width = 40,
                min_width = 40,
                height = 0,
                position = "left",
                border = "none",
                box = "vertical",
                { win = "list", border = "none" },
              },
            },
            win = {
              list = {
                keys = {
                  ["e"] = function(self)
                    local lines = vim.api.nvim_buf_get_lines(self.buf, 0, -1, false)
                    local max_width = 40
                    for _, line in ipairs(lines) do
                      local display_width = vim.fn.strdisplaywidth(line) + 2
                      if display_width > max_width then
                        max_width = display_width
                      end
                    end
                    local current_width = vim.api.nvim_win_get_width(self.win)
                    if current_width == max_width then
                      vim.api.nvim_win_set_width(self.win, 50)
                    else
                      vim.api.nvim_win_set_width(self.win, max_width)
                    end
                  end,
                },
              },
            },
          },
        },
      },
    },
  },
}
