let mapleader="\<Space>"
set background=dark
set number
set vb
set encoding=utf-8
set mouse=a
syntax on
set ruler
set cmdheight=1
set hid
set laststatus=2
set showmode
set showcmd
set showmatch
set showbreak=<
set autoread
set ignorecase
set shiftwidth=4
set smarttab
set expandtab
set cursorline
set softtabstop=4
set tabstop=4
set autoindent
set smartindent
set nobackup
set nowb
set noswapfile
set colorcolumn=80
set clipboard=unnamedplus
set diffopt+=vertical
set incsearch
set hlsearch
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0
set nocompatible
filetype plugin on

command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
let g:netrw_banner=0 " disable banner in netrw
let g:netrw_liststyle=3 " tree view in netrw

" <plugins>
call plug#begin('~/.config/nvim/plugged')
Plug 'tomasiser/vim-code-dark'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'airblade/vim-gitgutter'
Plug 'zivyangll/git-blame.vim'
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'
" LSP
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'
Plug 'piec/vim-lsp-gopls'
call plug#end()

" zivyangll/git-blame.vim
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>
" junegunn/fzf.vim
nnoremap <Leader>p :Files<CR>
nnoremap <Leader>b :Buffers<CR>
" prabirshrestha/asyncomplete.vim'
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
" prabirshrestha/vim-lsp
" vimwiki/vimwiki
let g:vimwiki_list = [{'path': '~/Documents/wiki/', 'syntax': 'markdown', 'ext': '.md'}]
au FileType vimwiki setlocal shiftwidth=6 tabstop=6 noexpandtab
" </plugins>

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END

colorscheme codedark
execute 'source ' . $HOME . '/.config/nvim/statusline.vim'
