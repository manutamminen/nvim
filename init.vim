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

let g:markdown_folding = 1
highlight Folded ctermfg=LightGrey
highlight Folded ctermbg=LightGrey

" Folding plugin setting:
" set nocompatible
" if has("autocmd")
"   filetype plugin indent on
" endif

" autocmd TextChanged,TextChangedI <buffer> silent write

" vim-autoformat
" noremap <F3> :Autoformat<CR>

" ======Leader settings
nnoremap ö $
vnoremap ö $
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

" ======Python settings
autocmd FileType python map <buffer> <localleader>ff :Autoformat<CR>
autocmd FileType python map <buffer> <localleader>ww :bd!<CR>
autocmd FileType python map <buffer> <localleader>ee :w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" ======R settings
" nnoremap <localleader>ee :call SendParagraphToR("echo", "down")<CR>
" nnoremap <localleader>ef :call SendFunctionToR("echo", "down")<CR>
autocmd FileType R map <buffer> <localleader>ee :call SendParagraphToR("echo", "down")<CR>
autocmd FileType R map <buffer> <localleader>ef :call SendFunctionToR("echo", "down")<CR>
" nnoremap <C-p> <ESC>$a %>% <ESC>o
" nnoremap <C-p> $a %>% <ESC>o
let R_assign_map = "--"
let R_min_editor_width = 80
let R_rconsole_width = 1000
let R_rconsole_height = 20
let R_objbr_opendf = 0

" ======Denite settings
" Inspiration and plagiarism: https://github.com/ctaylo21/jarvis/blob/master/config/nvim/init.vim
" call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])
" call denite#custom#var('grep', 'command', ['rg'])
" call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])
" call denite#custom#var('grep', 'recursive_opts', [])
" call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
" call denite#custom#var('grep', 'separator', ['--'])
" call denite#custom#var('grep', 'final_opts', [])
" call denite#custom#var('buffer', 'date_format', '')
" let s:denite_options = {'default' : {
"       \ 'split': 'floating',
"       \ 'start_filter': 1,
"       \ 'auto_resize': 1,
"       \ 'source_names': 'short',
"       \ 'prompt': 'λ ',
"       \ 'highlight_matched_char': 'QuickFixLine',
"       \ 'highlight_matched_range': 'Visual',
"       \ 'highlight_window_background': 'Visual',
"       \ 'highlight_filter_background': 'DiffAdd',
"       \ 'winrow': 1,
"       \ 'vertical_preview': 1
"       \ }}
" function! s:profile(opts) abort
"   for l:fname in keys(a:opts)
"     for l:dopt in keys(a:opts[l:fname])
"       call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
"     endfor
"   endfor
" endfunction
" call s:profile(s:denite_options)

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

" let g:ctrlp_map = '<C-p>'
" let g:ctrlp_cmd = 'CtrlP'


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

" === Denite shorcuts === "
"   <leader>b - Browser currently open buffers
"   <leader>t - Browse list of files in current directory
"   <leader>g - Search current directory for occurences of given term and close window if no results
"   <leader>j - Search current directory for occurences of word under cursor
" nnoremap <leader>b :Denite buffer<CR>
" nnoremap <leader>t :DeniteProjectDir file/rec<CR>
" nnoremap <leader>g :<C-u>Denite grep:. -no-empty<CR>
" nnoremap <leader>j :<C-u>DeniteCursorWord grep:.<CR>

" Define mappings while in 'filter' mode
"   <C-o>         - Switch to normal mode inside of search results
"   <Esc>         - Exit denite window in any mode
"   <CR>          - Open currently selected file in any mode
"   <C-t>         - Open currently selected file in a new tab
"   <C-v>         - Open currently selected file a vertical split
"   <C-h>         - Open currently selected file in a horizontal split
" autocmd FileType denite-filter call s:denite_filter_my_settings()
" function! s:denite_filter_my_settings() abort
"   imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
"   inoremap <silent><buffer><expr> <Esc> denite#do_map('quit')
"   nnoremap <silent><buffer><expr> <Esc> denite#do_map('quit')
"   inoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
"   inoremap <silent><buffer><expr> <C-t> denite#do_map('do_action', 'tabopen')
"   inoremap <silent><buffer><expr> <C-v> denite#do_map('do_action', 'vsplit')
"   inoremap <silent><buffer><expr> <C-h> denite#do_map('do_action', 'split')
" endfunction

" Define mappings while in denite window
"   <CR>        - Opens currently selected file
"   q or <Esc>  - Quit Denite window
"   d           - Delete currenly selected file
"   p           - Preview currently selected file
"   <C-o> or i  - Switch to insert mode inside of filter prompt
"   <C-t>       - Open currently selected file in a new tab
"   <C-v>       - Open currently selected file a vertical split
"   <C-h>       - Open currently selected file in a horizontal split
" autocmd FileType denite call s:denite_my_settings()
" function! s:denite_my_settings() abort
"   nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
"   nnoremap <silent><buffer><expr> q denite#do_map('quit')
"   nnoremap <silent><buffer><expr> <Esc> denite#do_map('quit')
"   nnoremap <silent><buffer><expr> d denite#do_map('do_action', 'delete')
"   nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
"   nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
"   nnoremap <silent><buffer><expr> <C-o> denite#do_map('open_filter_buffer')
"   nnoremap <silent><buffer><expr> <C-t> denite#do_map('do_action', 'tabopen')
"   nnoremap <silent><buffer><expr> <C-v> denite#do_map('do_action', 'vsplit')
"   nnoremap <silent><buffer><expr> <C-h> denite#do_map('do_action', 'split')
" endfunction

" luafile $HOME/.config/nvim/plugins.lua

" nmap <localleader>t    <Plug>(iron-send-motion)
" vmap <localleader>v    <Plug>(iron-visual-send)
" nmap <localleader>r    <Plug>(iron-repeat-cmd)
" nmap <localleader>l    <Plug>(iron-send-line)
" nmap <localleader><CR> <Plug>(iron-cr)
" nmap <localleader>i    <plug>(iron-interrupt)
" nmap <localleader>q    <Plug>(iron-exit)
" nmap <localleader>c    <Plug>(iron-clear)

" tnoremap <Esc> <C-\><C-n>

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

" Jupytext
let g:jupytext_fmt = 'py'
let g:jupytext_style = 'hydrogen'

" Send cell to IronRepl and move to next cell.
" Depends on the text object defined in vim-textobj-hydrogen
" You first need to be connected to IronRepl
nmap ]x ctrih/^# %%<CR><CR>



