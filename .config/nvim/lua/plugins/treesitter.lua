return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',  
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
          "bash", "c", "diff", "html", "javascript", "jsdoc", "json", "jsonc",
          "lua", "luadoc", "luap", "markdown", "markdown_inline", "printf",
          "python", "query", "regex", "toml", "tsx", "typescript", "vim",
          "vimdoc", "xml", "yaml",
        },
        auto_install = true
      })
    end
  }
}
