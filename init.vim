" General settings
syntax on
set nu

let g:python_version = matchstr(system("python --version | cut -f2 -d' '"), '^[0-9]')
if g:python_version =~ 3
    let g:python2_host_prog = "/usr/bin/python2"
else
    let g:python3_host_prog = "/usr/bin/python3"
endif

" Install plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/seoul256.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'

call plug#end()

" Keyboard shortcuts
inoremap jj <esc>
colorscheme seoul256
