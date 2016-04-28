" General settings
syntax on
set nu

" Install plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/seoul256.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

call plug#end()

" Keyboard shortcuts
inoremap jj <esc>
colorscheme seoul256
