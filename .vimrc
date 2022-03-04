let mapleader = ","

set number
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set showcmd
set shortmess=aIT
set hidden
set wildmenu
set wildmode=full
set incsearch
set hlsearch

" Plugins
call plug#begin('~/.vim/plugged')

" pretty colors
Plug 'ayu-theme/ayu-vim' " or other package manager

" Linting and auto fix engine
Plug 'dense-analysis/ale'

" Pretty status line
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'

Plug 'vim-scripts/vim-auto-save'

" easy commenting out/in
Plug 'tpope/vim-commentary'

" fuzz search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Automatic session management
Plug 'tpope/vim-obsession'

" git
Plug 'tpope/vim-fugitive'

" Library that makes it easy to add text objects
Plug 'kana/vim-textobj-user'

" add _ as a vim text object
Plug 'lucapette/vim-textobj-underscore'

Plug 'hashivim/vim-terraform'

Plug 'tpope/vim-eunuch'

call plug#end()

" let g:auto_save = 1  " enable AutoSave on Vim startup
" let g:auto_save_events = ["InsertLeave",]

" Colors
set termguicolors     " enable true colors support
"let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
colorscheme ayu

" necessary to show lightline with single file (shrug)
set laststatus=2
" useless with lightline
set noshowmode

"highlight clear SignColumn

let g:ale_linters = {'ruby': ['standardrb',], 'javascript': ['standard']}
let g:ale_fixers = {'ruby': ['standardrb',], 'javascript': ['standard']}
let g:ruby_indent_assignment_style = 'variable'
let g:ale_fix_on_save = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_sign_column_always = 1

let g:ale_javascript_standard_options = "--parser babel-eslint"

let g:lightline = {
\ 'colorscheme': 'darcula',
\ }

let g:lightline.component = {
      \   'filepath': '%f',
      \ }

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \ }

let g:lightline.active = { 
      \ 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ], ['lineinfo']],
      \ 'left': [['mode','paste'], ['readonly', 'filepath', 'modified']]
      \ }

let g:lightline.inactive = {
      \ 'left': [['filepath', 'modified']],
      \ 'right': [['lineinfo', 'percent']]
      \}

" Backup directory
set backupdir=/tmp//
set directory=/tmp//
set undodir=/tmp//

" FZF + rg
nnoremap <C-T> :Files<cr>
nnoremap <Leader>b :Buffers<cr>
nnoremap <Leader>s :BLines<cr>
nnoremap <Leader>f :Rg<cr>

" terminal
noremap <Leader>t :term<cr><C-w>H<C-w>80\|

" clear highlight after search
nnoremap <Leader>/ :noh<cr><cr>

" custom maps
nmap <Leader><Space> :w<cr>
nmap <Leader>we <C-w>=<cr>
inoremap kj <ESC>
