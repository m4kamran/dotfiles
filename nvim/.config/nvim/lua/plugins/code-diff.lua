return {
  "esmuellert/codediff.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  cmd = "CodeDiff",
  config = function()
    require("codediff").setup({
      diff = {
        disable_inlay_hints = true,
      },
      keymaps = {
        view = {
          next_file = "<Tab>", -- Next file in explorer mode
          prev_file = "<S-Tab>", -- Previous file in explorer mode
        },
        conflict = {
          accept_incoming = "<leader>ct", -- Accept all incoming (theirs/left) changes
          accept_current = "<leader>co", -- Accept all current (ours/right) changes
          accept_both = "<leader>cb", -- Accept both changes (incoming first)
          discard = "<leader>cx", -- Discard both, keep base
          next_conflict = "]x", -- Jump to next conflict
          prev_conflict = "[x", -- Jump to previous conflict
        },
      },
    })

    -- Add winbar labels for CodeDiff merge conflict views
    local function setup_merge_winbar_labels()
      local lifecycle_ok, lifecycle = pcall(require, "codediff.ui.lifecycle")
      if not lifecycle_ok then
        return
      end

      local tabpage = vim.api.nvim_get_current_tabpage()
      local session = lifecycle.get_session(tabpage)
      if not session then
        return
      end

      local original_win, modified_win = lifecycle.get_windows(tabpage)
      local _, result_win = lifecycle.get_result(tabpage)

      -- Only set winbar labels if this is a conflict/merge session (has result window)
      if not result_win then
        return
      end

      -- Get git root from session or find it
      local git_root = session.git_root or vim.fn.getcwd()

      -- Get branch names from git merge state
      local ours_branch = nil
      local theirs_branch = nil

      -- Get current branch name (OURS)
      local ours_result =
        vim.fn.system("git -C " .. vim.fn.shellescape(git_root) .. " rev-parse --abbrev-ref HEAD 2>/dev/null")
      ours_branch = vim.trim(ours_result)
      if vim.v.shell_error ~= 0 or ours_branch == "" then
        ours_branch = "Current"
      end

      -- Try multiple methods to get THEIRS branch name

      -- Method 1: Read MERGE_MSG file which contains "Merge branch 'xxx'" message
      local merge_msg_path = git_root .. "/.git/MERGE_MSG"
      local merge_msg = vim.fn.readfile(merge_msg_path, "", 1)
      if merge_msg and merge_msg[1] then
        -- Parse "Merge branch 'feature-branch'" or "Merge branch 'feature-branch' of ..."
        local branch = merge_msg[1]:match("Merge branch '([^']+)'")
        if branch then
          theirs_branch = branch
        end
        -- Also try "Merge remote-tracking branch 'origin/xxx'"
        if not theirs_branch then
          branch = merge_msg[1]:match("Merge remote%-tracking branch '[^/]+/([^']+)'")
          if branch then
            theirs_branch = branch
          end
        end
      end

      -- Method 2: Try git name-rev on MERGE_HEAD
      if not theirs_branch then
        local name_rev = vim.fn.system(
          "git -C "
            .. vim.fn.shellescape(git_root)
            .. " name-rev --name-only --refs='refs/heads/*' MERGE_HEAD 2>/dev/null"
        )
        name_rev = vim.trim(name_rev)
        if
          vim.v.shell_error == 0
          and name_rev ~= ""
          and not name_rev:match("undefined")
          and not name_rev:match("MERGE_HEAD")
        then
          theirs_branch = name_rev:gsub("~%d+$", ""):gsub("%^%d+$", "")
        end
      end

      -- Method 3: Try refs/remotes as fallback
      if not theirs_branch then
        local name_rev =
          vim.fn.system("git -C " .. vim.fn.shellescape(git_root) .. " name-rev --name-only MERGE_HEAD 2>/dev/null")
        name_rev = vim.trim(name_rev)
        if vim.v.shell_error == 0 and name_rev ~= "" and not name_rev:match("undefined") then
          name_rev = name_rev:gsub("^remotes/origin/", "")
          name_rev = name_rev:gsub("^remotes/", "")
          name_rev = name_rev:gsub("~%d+$", "")
          name_rev = name_rev:gsub("%^%d+$", "")
          if name_rev ~= "" then
            theirs_branch = name_rev
          end
        end
      end

      -- Method 4: Check for rebase
      if not theirs_branch then
        local rebase_onto_path = git_root .. "/.git/rebase-merge/onto"
        local onto = vim.fn.readfile(rebase_onto_path, "", 1)
        if onto and onto[1] then
          local name_rev = vim.fn.system(
            "git -C " .. vim.fn.shellescape(git_root) .. " name-rev --name-only " .. vim.trim(onto[1]) .. " 2>/dev/null"
          )
          name_rev = vim.trim(name_rev)
          if vim.v.shell_error == 0 and name_rev ~= "" then
            theirs_branch = name_rev:gsub("^remotes/origin/", ""):gsub("~%d+$", "")
          end
        end
      end

      -- Fallback
      if not theirs_branch or theirs_branch == "" then
        theirs_branch = "Incoming"
      end

      if original_win and vim.api.nvim_win_is_valid(original_win) then
        vim.wo[original_win].winbar = "%#DiffDelete# THEIRS (" .. theirs_branch .. ") %*"
      end

      if modified_win and vim.api.nvim_win_is_valid(modified_win) then
        vim.wo[modified_win].winbar = "%#DiffAdd# OURS (" .. ours_branch .. ") %*"
      end

      if result_win and vim.api.nvim_win_is_valid(result_win) then
        vim.wo[result_win].winbar = "%#Title# RESULT (Edit here) %*"
      end
    end

    -- Hook into CodeDiff merge view creation
    vim.api.nvim_create_autocmd("User", {
      pattern = "CodeDiffVirtualFileLoaded",
      callback = function()
        vim.defer_fn(setup_merge_winbar_labels, 100)
      end,
    })

    -- Also try on TabEnter for when switching back to merge tab
    vim.api.nvim_create_autocmd("TabEnter", {
      callback = function()
        vim.defer_fn(setup_merge_winbar_labels, 50)
      end,
    })
  end,
}
