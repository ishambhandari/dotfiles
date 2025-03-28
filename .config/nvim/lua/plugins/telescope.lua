return {
  {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.8',
    requires = { 'nvim-lua/plenary.nvim' }, -- Changed from 'dependencies' to 'requires'
    config = function() 
      local builtin = require("telescope.builtin")
      vim.keymap.set('n', ';f', builtin.find_files, {})
      vim.keymap.set('n', ';r', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>n', ':Neotree filesystem reveal left<CR>')

      -- Treesitter
      local config = require("nvim-treesitter.configs")
      config.setup({
          ensure_installed = {
            "bash", "c", "diff", "html", "javascript", "jsdoc", "json", "jsonc",
            "lua", "luadoc", "luap", "markdown", "markdown_inline", "printf",
            "python", "query", "regex", "toml", "tsx", "typescript", "vim",
            "vimdoc", "xml", "yaml",
          },
          highlight = { enable = true },
          indent = { enable = true }, -- Corrected typo from 'enabole' to 'enable'
      })
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function() 
require("telescope").setup {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
      }
    }
  }
}
require("telescope").load_extension("ui-select")
    end

  }
}
