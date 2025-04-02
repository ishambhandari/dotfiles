vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    command = "setlocal spell spelllang=en_uk"
})

