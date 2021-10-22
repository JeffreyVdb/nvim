" This should help with improvements
if &compatible
  set nocompatible " Be iMproved
endif


" This should make startup faster
let g:python_host_prog = expand('~/.pyenv/versions/neovim2/bin/python')
let g:python3_host_prog = expand('~/.pyenv/versions/neovim3/bin/python')
let g:python3_host_skip_check = 1

call plug#begin(stdpath('data') . '/plugged')
    " Theme
    Plug 'rktjmp/lush.nvim'
    Plug 'sainnhe/gruvbox-material'
    Plug 'itchyny/lightline.vim'

    Plug 'hashivim/vim-terraform'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'tpope/vim-commentary'
    Plug 'junegunn/fzf', { 'build': './install --all', 'merged': 0 }
    Plug 'junegunn/fzf.vim'
    Plug 'cespare/vim-toml'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'w0rp/ale'
    Plug 'neovim/nvim-lspconfig'
    Plug 'ziglang/zig.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'preservim/nerdtree'
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
call plug#end()

set clipboard=unnamed
set spelllang=en

" General settings
set mouse=a
syntax enable
set autoread
set number
set cursorline
set ignorecase
set smartcase
set termguicolors
set wildmode=longest,list,full

" Neovim true color
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" fold control
set foldmethod=indent
set foldnestmax=5
set foldlevelstart=20
nnoremap <space> za

" Windows splits
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Important!!
if has('termguicolors')
    set termguicolors
endif

" Theme
set background=dark
colorscheme gruvbox-material
let g:lightline = {
      \ 'colorscheme': 'gruvbox_material',
      \ }
let g:gruvbox_material_background = 'soft'
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_disable_italic_comment = 1

" Tab - Space indent behavior
set shiftround
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" Shortcuts / Keybinds
let mapleader=","
nnoremap <Leader>cef :%y+<CR>
vnoremap <Leader>Y "+y<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>Q :wqa<CR>
nnoremap <Leader>o <C-o>
nnoremap <Leader>i <C-i>
inoremap jj <esc>
noremap j gj
noremap k gk

" repeat selection after indent
vnoremap > ><CR>gv
vnoremap < <<CR>gv

" keep more context when scrolling off the end of a buffer
set scrolloff=10

" Use an undofile and save it somewhere reasonable (outside of working directory)
if has('persistent_undo')         "check if your vim version supports
  set undodir=$HOME/.vim/undo     "directory where the undo files will be stored
  set undofile                    "turn on the feature
endif

" move search result to middle of the screen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz

" Disable arrow keys (this is for noobs)
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Using :w!! allows saving as root
cmap w!! w !sudo tee > /dev/null %

" Visual stuff
set colorcolumn=100,120
set listchars=eol:$,trail:~,extends:>,tab:>\ ,precedes:<
set list
let g:airline_powerline_fonts = 0

" Strip trailing whitespace for these filetypes
autocmd FileType ansible,yaml,elixir,c,cpp,java,php,sh,zsh,python,vim autocmd BufWritePre <buffer> %s/\s\+$//e

" Code formatting for python
autocmd FileType python nnoremap <Leader>= :0,$!yapf<CR>
let g:python_highlight_all = 1

" Terraform
let g:terraform_align=1
let g:terraform_fmt_on_save=1

"
" FZF settings
"

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
let g:fzf_buffers_jump = 1
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'

map <C-p> :Files<CR>
map <Leader>g :Buffers<CR>
nnoremap <C-n> :NERDTree<CR>


" ====================================
" Tree sitter
" ====================================
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

" neovim/nvim-lspconfig
lua require'lspconfig'.bashls.setup{}

" COC
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
