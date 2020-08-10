
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

call plug#begin('~/.local/share/nvim/plugged')
" Colors
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'altercation/vim-colors-solarized'
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'mhartington/oceanic-next'

" UI
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
"Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mhinz/vim-grepper'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

" Syntax and alignment
Plug 'kien/rainbow_parentheses.vim'
Plug 'jiangmiao/auto-pairs'

" Completion
Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neco-vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'wellle/tmux-complete.vim'
Plug 'zchee/deoplete-go', { 'for': 'go' }
Plug 'zchee/deoplete-jedi', { 'for': 'python'}

" Go plugins
Plug 'fatih/vim-go', { 'for': 'go', 'tag': 'v1.22', 'do': ':GoUpdateBinaries' }

" TypeScript plugins
"Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'gko/vim-coloresque'

call plug#end()

let g:deoplete#enable_at_startup = 1
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
let g:neosnippet#enable_completed_snippet = 1
let g:neosnippet#enable_snipmate_compatibility = 1

" moving around, searching and patterns
set ignorecase
set smartcase

" displaying text
if (has("termguicolors"))
  set termguicolors
endif

let g:gruvbox_bold = 1
let g:gruvbox_italic = 1
let g:gruvbox_italicize_comments=1
let g:gruvbox_invert_selection = 1
let g:gruvbox_termcolors = 256
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_contrast_light="medium"

let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_uniform_status_lines = 1
let g:nord_uniform_diff_background = 1
"let g:nord_comment_brightness = 15
let g:nord_cursor_line_number_background = 1

let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1

let g:palenight_terminal_italics = 1
let ayucolor="mirage"

set background=dark
colorscheme nord

"let g:airline_theme='nord'

syntax on
set lazyredraw
set list
set listchars=tab:▸\ ,extends:›,precedes:‹,nbsp:·,trail:·
set nowrap
set number
set relativenumber
set scrolloff=1
set sidescrolloff=5

" syntax, highlighting and spelling
set cursorcolumn
set cursorline
set colorcolumn=100
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" multiple windows
set hidden
set laststatus=2

" message and info
set noerrorbells
set novisualbell
set showcmd
set noshowmode
set noruler

" editing text
set formatoptions+=ron
set undolevels=500

" tabs and indenting
set expandtab
set shiftround
set shiftwidth=4
set tabstop=4
set softtabstop=4

" reading and writing files set autowrite
set nobackup
set backupdir=/tmp

" the swap file
set noswapfile
set directory=/tmp

" command line editing
set history=1000

set mouse=
let mapleader=" "
let maplocalleader=" "
syn match myTodo contained "\<\(TODO\|FIXME\)"
hi def link myTodo Todo
" }}}

" Tagbar
nmap <F8> :TagbarToggle<CR>

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" Copy
vnoremap <leader>y "+y
nnoremap <leader>Y "+yg
nnoremap <leader>y "+y

" Paste
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Window navigation
nnoremap <c-left>  <c-w>5>
nnoremap <c-down>  <c-w>5-
nnoremap <c-up>    <c-w>5+
nnoremap <c-right> <c-w>5<
nnoremap <c-h>     <c-w>h
nnoremap <c-j>     <c-w>j
nnoremap <c-k>     <c-w>k
nnoremap <c-l>     <c-w>l
nnoremap <m-h>     <c-w>v
nnoremap <m-j>     <c-w>s<c-w>j
nnoremap <m-k>     <c-w>s
nnoremap <m-l>     <c-w>v<c-w>l
set splitbelow
set splitright

" Center file when j / k
nnoremap j jzz
nnoremap k kzz

" Center matches when searching
nnoremap N Nzz
nnoremap n nzz

" Go settings
let g:go_highlight_functions            = 1
let g:go_highlight_methods              = 1
let g:go_highlight_structs              = 1
let g:go_highlight_operators            = 1
let g:go_highlight_build_constraints    = 1
let g:go_highlight_extra_types          = 1
let g:go_highlight_function_arguments   = 1
let g:go_highlight_function_calls       = 1
let g:go_highlight_types                = 1
let g:go_highlight_fields               = 1
let g:go_fold_enable = ['import']
let g:go_auto_type_info = 1
let g:go_fmt_command = "goimports"
let g:go_auto_sameids = 1
"let g:go_gocode_propose_source=1
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>d :sp <CR>:exe "GoDoc" <CR>
au Filetype go nnoremap <leader>r :GoRun %<CR>

" Java settings
let g:LanguageClient_serverCommands = {
    \ 'java': ['/usr/bin/jdtls', '-data', getcwd()],
    \ 'go': ['gopls'],
    \ 'rust': ['rls'],
    \ 'python': ['pyls'],
    \ }
" Run gofmt on save
autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()

" YAML settings
au FileType yaml setlocal ts=2
au FileType yaml setlocal sts=2
au FileType yaml setlocal sw=2
au FileType yaml setlocal expandtab
au FileType yml setlocal ts=2
au FileType yml setlocal sts=2
au FileType yml setlocal sw=2
au FileType yml setlocal expandtab
" Python settings
au Filetype py set tabstop=4
au Filetype py set softtabstop=4
au Filetype py set shiftwidth=4
au Filetype py set textwidth=99
au Filetype py set expandtab
au Filetype py set autoindent
au Filetype py set fileformat=unix
au FileType py let python_highlight_all=1

" Ansible settings
let g:ansible_extra_keywords_highlight = '1'
let g:ansible_attribute_highlight = 'ab'
let g:ansible_name_highlight = 'b'

" Markdown settings
let vim_markdown_preview_toggle = 1 " Display images on toggle preview C-p
let vim_markdown_preview_browser = 'firefox'
let vim_markdown_preview_use_xdg_open = 1

" rust settings
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

" typescript settings
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compile_options = ''
au FileType typescript setlocal ts=2
au FileType typescript setlocal sts=2
au FileType typescript setlocal sw=2
au FileType typescript setlocal expandtab
au FileType typescript setlocal smarttab

" javascript settings
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0

" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'

" Prose mode
function! ProseMode()
  call goyo#execute(0, [])
  set spell noci nosi noai nolist noshowmode noshowcmd
  set complete+=s
endfunction

command! ProseMode call ProseMode()
nmap \p :ProseMode<CR>
