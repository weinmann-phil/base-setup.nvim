return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs', -- Sets main module to use for opts
  -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
  opts = {
    ensure_installed = { 
      'ada',
      'angular',
      'bash', 
      'bibtex',
      'c', 
      'cpp',
      'css',
      'c_sharp',
      'diff',
      'dockerfile',
      'dot',
      'gitcommit',
      'gitignore',
      'git_config',
      'git_rebase',
      'go',
      -- 'goctl',
      'gomod',
      'gosum',
      'gpg',
      'graphql',
      'helm',
      'html',
      'http',
      'ini',
      'java',
      'javascript',
      'json',
      'latex',
      'lua', 
      'luadoc', 
      'make',
      'markdown', 
      'markdown_inline', 
      'matlab',
      -- 'nginx',
      -- 'pip_requirements',
      'python',
      'query', 
      'regex',
      'ruby',
      'rust',
      'scala',
      'scss',
      'sql',
      'ssh_config',
      'terraform',
      'toml',
      'typescript',
      'vim', 
      'vimdoc',
      'xml',
      'yaml',
      'zig',
    },
    -- Autoinstall languages that are not installed
    auto_install = true,
    highlight = {
      enable = true,
      -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
      --  If you are experiencing weird indenting issues, add the language to
      --  the list of additional_vim_regex_highlighting and disabled languages for indent.
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
  },
  -- There are additional nvim-treesitter modules that you can use to interact
  -- with nvim-treesitter. You should go explore a few and see what interests you:
  --
  --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
  --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
  --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
}

