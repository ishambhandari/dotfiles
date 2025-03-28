return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "kyazdani42/nvim-web-devicons",
  },
  config = function () 
    vim.keymap.set('n', '<leader>n', ":Neotree filesystem reveal left<CR>")
  end

}
