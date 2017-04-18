" General settings"{{{
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let g:python_host_skip_check = 1
let g:python3_host_skip_check = 1

if has('unix')
    let g:python_version = matchstr(system("python --version | cut -f2 -d' '"), '^[0-9]')
    if g:python_version =~ 3
        let g:python2_host_prog = "/usr/local/bin/python2"
    else
        let g:python3_host_prog = "/usr/local/bin/python3"
    endif
endif
"}}}

" package manager"{{{
if has('vim_starting')
    set runtimepath+=~/.config/nvim/bundle/neobundle.vim
    set runtimepath+=~/.fzf
    set runtimepath+=/usr/local/opt/fzf
endif

if &compatible
    set nocompatible               " Be iMproved
endif

call neobundle#begin(expand('~/.config/nvim/bundle'))


" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'ekalinin/Dockerfile.vim'
NeoBundle 'morhetz/gruvbox'
NeoBundle 'honza/vim-snippets'
NeoBundle 'pearofducks/ansible-vim'
NeoBundle 'fatih/vim-go'
NeoBundle 'luochen1990/rainbow'
NeoBundle 'Matt-Deacalion/vim-systemd-syntax'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
NeoBundle 'junegunn/fzf.vim'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on
"}}}

" Appearance"{{{
colorscheme gruvbox
let g:gruvbox_contrast_light='hard'
let g:gruvbox_contrast_dark='hard'
let g:airline_powerline_fonts = 1
syntax on
set foldenable
set nu
set background=light
set colorcolumn=80,100
set cursorline
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set listchars=eol:$,tab:>·,trail:~,extends:>,precedes:<,space:.
set list

" Let braces be colored
let g:rainbow_active = 1
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
"}}}

" File settings"{{{
autocmd FileType vim,txt setlocal foldmethod=marker"}}}

" Keyboard shortcuts"{{{
let mapleader="\<SPACE>"
inoremap jj <esc>

noremap j gj
noremap k gk

noremap <Leader>ec :r !
noremap <Leader>cef gg"+yG
vmap <Leader>y "+y
vmap <Leader>d "+d

map <C-p> :Files<CR>
"}}}

" Plugin settings"{{{

" Editorconfig
let g:EditorConfig_core_mode = 'external_command'

" Snippets
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"

" Fzf
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_layout = { 'down': '~40%' }

"}}}

" FileType settings{{{
" Strip trailing whitespace for these filetypes
autocmd FileType c,cpp,java,php,python autocmd BufWritePre <buffer> %s/\s\+$//e
""}}}
