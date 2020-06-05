call plug#begin("~/.vim/plugged")
  " Plugin Section
    Plug 'dracula/vim'
    Plug 'scrooloose/nerdtree'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'leafgarland/typescript-vim'
    Plug 'peitalin/vim-jsx-typescript'
    Plug 'vim-airline/vim-airline' 
	Plug 'xuyuanp/nerdtree-git-plugin'
	Plug 'tpope/vim-fugitive'
	Plug 'airblade/vim-gitgutter'
    Plug '907th/vim-auto-save'
    Plug 'pangloss/vim-javascript'
    Plug 'jiangmiao/auto-pairs'
call plug#end()

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-css',
\ ]

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)

" The Primeagen Config
syntax on

set guicursor=
set noshowmatch
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c


"Config Section
" Theme Settings
if (has("termguicolors"))
	 set termguicolors
 endif
 syntax enable
 colorscheme dracula


 " NERDTree Settings
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" Integrated Terminal

" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" toggle terminal on ctrl+n
let g:terminal_is_open = 0
let g:terminal_has_init = 0

function! OpenTerminal()
  if g:terminal_is_open
    hide
    let g:terminal_is_open = 0
  else
    if g:terminal_has_init
      sb 2
      resize 10
      let g:terminal_is_open = 1
    else
      split term://bash
      resize 10
      let g:terminal_is_open = 1
      let g:terminal_has_init = 1
    endif
  endif
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>


" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Search / Fuzzy Finder
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Prettier 
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" vmap <leader>f  <Plug>(coc-format-selected)
nmap <C-s> :Prettier<CR>

" AutoSave 
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_silent = 1  " do not display the auto-save notification"
