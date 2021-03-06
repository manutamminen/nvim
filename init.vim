" - For Neovim: stdpath( data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" ======Plugins
" Make sure you use single quotes
Plug 'junegunn/vim-easy-align'
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
Plug 'tpope/vim-commentary'
Plug 'liuchengxu/vim-which-key'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'lucasprag/simpleblack'
Plug 'itchyny/lightline.vim'
" Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ntpeters/vim-better-whitespace'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'axvr/org.vim'
Plug 'LukeGoodsell/nextflow-vim'
Plug 'tpope/vim-surround'
Plug 'skywind3000/asyncrun.vim'

" Better Visual Guide
Plug 'Yggdroot/indentLine'

" syntax check
Plug 'w0rp/ale'

" Autocomplete
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'
Plug 'gaalcaras/ncm-R'

" Formater
Plug 'Chiel92/vim-autoformat'

" Initialize plugin system
call plug#end()

" =======General settings
filetype plugin indent on

" turn hybrid line numbers on
set number
set relativenumber
set wildmenu
set tabstop=2
set shiftwidth=2
set expandtab
set noshowcmd
set clipboard=unnamed
set hidden
set ignorecase
set smartcase
set autoread
set inccommand=nosplit
set colorcolumn=80
set nocompatible
filetype plugin on
runtime macros/matchit.vim
let g:markdown_folding = 1
highlight Folded ctermfg=LightGrey
highlight Folded ctermbg=LightGrey

" ======Custom keybindings
nnoremap ö $
vnoremap ö $
let g:mapleader = "\<Space>"
let g:maplocalleader = 'ä'
nnoremap ' `
tnoremap <Esc> <C-\><C-n>

" ======Python settings
autocmd FileType python map <buffer> <localleader>ff :Autoformat<CR>
" autocmd FileType python map <buffer> <localleader>ww :bd!<CR>
" autocmd FileType python map <buffer> <localleader>ee :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python map <buffer> <localleader>ee :w<CR>:AsyncRun -mode=term python "%"<CR><ESC>:resize 10<CR>Gzb<C-w>k

" ======R settings
autocmd FileType R map <buffer> <localleader>ee :call SendParagraphToR("echo", "down")<CR>
autocmd FileType R map <buffer> <localleader>ef :call SendFunctionToR("echo", "down")<CR>
let R_assign_map = "--"
let R_min_editor_width = 80
let R_rconsole_width = 1000
let R_rconsole_height = 20
let R_objbr_opendf = 0

" ======coc settings
" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
"
" "Close preview window when completion is done.
" autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" ======Visual settings
colorscheme simpleblack
highlight LineNr ctermfg=darkgrey

" ======Key mappings
nnoremap <leader>fs :w<CR>
nnoremap <leader>qq :q<CR>
inoremap kj <ESC>
inoremap <C-k> <ESC>Da
inoremap <C-e> <ESC>$a
inoremap <C-a> <ESC>0i

nnoremap <leader>ev :split $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

iabbrev @@ mavatam@utu.fi
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Ale
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8']}
let g:ale_linters = {'r': ['lintr']}
" let g:ale_fixers = {'r': ['lintr']}


" NCM2
augroup NCM2
  autocmd!
  " enable ncm2 for all buffers
  autocmd BufEnter * call ncm2#enable_for_buffer()
  " :help Ncm2PopupOpen for more information
  set completeopt=noinsert,menuone,noselect
  " When the <Enter> key is pressed while the popup menu is visible, it only
  " hides the menu. Use this mapping to close the menu and also start a new line.
  inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
  " uncomment this block if you use vimtex for LaTex
  " autocmd Filetype tex call ncm2#register_source({
  "           \ 'name': 'vimtex',
  "           \ 'priority': 8,
  "           \ 'scope': ['tex'],
  "           \ 'mark': 'tex',
  "           \ 'word_pattern': '\w+',
  "           \ 'complete_pattern': g:vimtex#re#ncm2,
  "           \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
  "           \ })
augroup END

