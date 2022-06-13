set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set listchars=tab:\|\ 
set list
set path+=**
set shiftwidth=4
set nowrap
set expandtab
set smartindent
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
" set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set mouse=nicr 
set mouse=a 
set signcolumn=yes
set guifont=Monaco\ 15 
set ic
set conceallevel=2
set list lcs=tab:\|\
let g:airline_powerline_fonts = 1
call plug#begin('~/.vim/plugged')
Plug 'alvan/vim-closetag'
Plug 'gruvbox-community/gruvbox'
Plug 'mattn/emmet-vim'
Plug 'Yggdroot/indentLine'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
Plug 'tpope/vim-fugitive'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'jiangmiao/auto-pairs'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'sbdchd/neoformat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'sbdchd/neoformat'
Plug 'lilydjwg/colorizer'
Plug 'lambdalisue/suda.vim'
Plug 'overcache/NeoSolarized'
Plug 'dylanaraps/wal.vim'
Plug 'joshdick/onedark.vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
call plug#end()

highlight Normal guibg=none
" normal mode:
nnoremap <c-j> 5j
nnoremap <c-k> 5k
" visual mode:
xnoremap <c-j> 5j
xnoremap <c-k> 5k
:inoremap jk <esc>
let g:prettier#autoformat = 0
" AutoMode
autocmd BufWritePre *.js,*.jsx,*.mjs,*.css,*.less,*.scss, PrettierAsync
autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

autocmd BufWritePre *.js Neoformat
"ColorScheme 
colorscheme onedark 
"coc conf 
source /home/isham/.config/nvim/coc.vim
"Custom map 
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>
"let
" let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" let g:indentLine_enabled = 0
" highlight Conceal guifg=#ff0000 guibg=#00ff00
let g:indentLine_setConceal = 0
let g:indentLine_char = '|'
" let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 1
let g:indentLine_color_term = 109 
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ }
