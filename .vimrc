set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax enable
set tabstop=2
set autoindent
set showcmd
set ruler
set cursorline
set encoding=utf-8
set showmatch
set sw=2
set laststatus=2
" set relativenumber
set noshowmode
set undofile 
"to save undofile
set undodir=~/.vim/undodir
set cursorcolumn
set backspace=indent,eol,start

map <C-L> 20zl " Scroll 20 characters to the right
map <C-H> 20zh " Scroll 20 characters to the left

"para cambiar de buffers sin guardar 
set hidden

call plug#begin('~/.vim/plugged')

"temas
Plug 'morhetz/gruvbox' 

" Ide 
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'stanangeloff/php.vim'
"git
Plug 'tpope/vim-fugitive'

" php
"" PHP Bundle
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install --no-dev -o'}
Plug 'stephpy/vim-php-cs-fixer'

" javascript
"" Javascript Bundle
Plug 'jelera/vim-javascript-syntax'

" typescript
Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'


" vuejs
Plug 'posva/vim-vue'
Plug 'leafOfTree/vim-vue-plugin'

if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif

"Linter
"Plug 'dense-analysis/ale'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

"airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"" Vim-Session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

call plug#end()

colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"
let NERDTreeQuitOnOpen=1

let mapleader=" "

nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>nt :NERDTreeFind<CR>
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>

"mapping

"
"" Split
nmap <Leader>h :split<CR>
nmap <Leader>v :vsplit<CR>

"Git
"
nmap <Leader>gb :Gblame<CR>

"" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>e :FZF -m<CR>
"Recovery commands from history through FZF
nmap <leader>y :History:<CR>
"""""""'""""""""
"conig airline
" vim-airline
let g:airline_theme = 'powerlineish'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1
" vim-airline
let g:airline#extensions#virtualenv#enabled = 1

" vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

" session management
let g:session_directory = "~/./session"
let g:session_autoload = "yes"
let g:session_autosave = "yes"
let g:session_command_aliases = 1
" session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>
"" short php
"go to definition
nmap <Leader>oo :call phpactor#GotoDefinition()<CR>
""go to parent
nmap <Leader>nn :call phpactor#Navigate()<CR>
"buffers
"close buffer
noremap <leader>c :bd<CR>
noremap <leader>cf :bd!<CR>
