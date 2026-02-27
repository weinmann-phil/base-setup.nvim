return {
  'zbirenbaum/copilot.lua',
  requires = {
    "copilotlsp-nvim/copilot-lsp",
    init = function()
      vim.g.copilot_nes_debounce = 500
    end,
  }
  cmd = 'Copilot',
  event = "InsertEnter",
  panel = {
    enabled = true,
    auto_refresh = false,
    keymap = {
      jump_prev = "[[",
      jump_next = "]]",
      accept = "<CR>",
      refresh = "gr",
      open = "<M-CR>",
    },
    layout = {
      position = "bottom",
      ratio = 0.4,
    },
  },
  options = {
    suggestions = {
      enabled = true,
      auto_trigger = false,
      debounce = 30,
      keymap = {
        accept = "<C-l>",
        accept_word = false,
        accept_line = false,
        next = "<C-n>",
        prev = "<C-p>",
        dismiss = "<C-c>",
        toggle_auto_trigger = false,
      },
    },
    filetypes = {
      markdown = true,
      yaml = true,
      terraform = true,
      javascript = true,
      typescript = true,
      java = true,
      kotlin = true,
      scala = true,
      golang = true,
      csharp = true,
      gitcommit = true,
      gitrebase = true,
    },
    nes = {
      enabled = false, -- requires copilot-lsp as a dependency
      auto_trigger = false,
      keymap = {
        accept_and_goto = false,
        accept = false,
        dismiss = false,
      },
    },
    auth_provider_url = nil, -- URL to authentication provider, if not "https://github.com/"
    logger = {
      file = vim.fn.stdpath("log") .. "/copilot-lua.log",
      file_log_level = vim.log.levels.OFF,
      print_log_level = vim.log.levels.WARN,
      trace_lsp = "off", -- "off" | "debug" | "verbose"
      trace_lsp_progress = false,
      log_lsp_messages = false,
    },
    copilot_node_command = 'node', -- Node.js version must be > 22
    workspace_folders = {},
    copilot_model = "",
    disable_limit_reached_message = false,  -- Set to `true` to suppress completion limit reached popup
    root_dir = function()
      return vim.fs.dirname(vim.fs.find(".git", { upward = true })[1])
    end,
    should_attach = function(_, _)
      if not vim.bo.buflisted then
        logger.debug("not attaching, buffer is not 'buflisted'")
        return false
      end

      if vim.bo.buftype ~= "" then
        logger.debug("not attaching, buffer 'buftype' is " .. vim.bo.buftype)
        return false
      end

      return true
    end,
    server = {
      type = "nodejs", -- "nodejs" | "binary"
      custom_server_filepath = nil,
    },
    server_opts_overrides = {},
  },
  config = function(_, options)
    require("copilot").setup(options)
  end,
}
