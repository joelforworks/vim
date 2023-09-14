set autoindent
set number
set mouse=a
set numberwidth=1
syntax on 
set guioptions-=r
set guioptions=ace
set encoding=utf-8
set relativenumber
set nocompatible
"" visual block
nnoremap q <c-v>
"" tabs
:map tn :tabnew<cr>

if system('uname -s') == "darwin\n"
  set clipboard=unnamed "osx
else
  set clipboard=unnamedplus "linux
endif




:imap ii <esc>
let g:pymode_python = 'python3'


call plug#begin()
" navigate
plug 'preservim/nerdtree'
" systax color
plug 'sheerun/vim-polyglot'
plug 'vim-python/python-syntax'
" status bar
plug 'vim-airline/vim-airline'
" html xml 
plug 'mattn/emmet-vim'
" themes
plug 'dracula/vim', { 'as': 'dracula' }

plug 'tomasiser/vim-code-dark'

plug 'rakr/vim-one'

plug 'morhetz/gruvbox'

plug 'terryma/vim-multiple-cursors'



" autocompletation
" plug 'lifepillar/vim-mucomplete'

plug 'neoclide/coc.nvim', {'branch': 'release'}
" fzf
plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
plug 'junegunn/fzf.vim'
" floatterm
plug 'voldikss/vim-floaterm'
" jedi 

plug 'davidhalter/jedi-vim'
" vdebuger
plug 'vim-vdebug/vdebug'

call plug#end()

" nerdtree maps
:map <space>n :nerdtreefind<cr>
:map <space>m :nerdtreetoggle %<cr> 
" status bar
:let g:airline_section_z = airline#section#create(['%3p%% %l:%3v']) 
" emmet-vim
:let g:user_emmet_leader_key = ','
" floaterm
:hi floaterm guibg=black
" themes

" dracula
"colorscheme dracula


 " gruvbox
"let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
 

 "colorscheme one
" call one#highlight('comment', '8f8f8f', '', 'none')
"" colorscheme codedark

" transparent background dracula and one theme

 autocmd vimenter * hi normal guibg=none ctermbg=none


" maps

:imap < <><left>
:imap ( ()<left>
:imap { {}<left>
:imap [ []<left>
" java 
"python
let g:python_highlight_all = 1
let g:syntastic_python_python_exec = 'python3'
" vsp
set splitbelow
set splitright

:map <c-j> <c-w>j
:map <c-k> <c-w>k
:map <c-h> <c-w>h
:map <c-l> <c-w>l

"" fzf

:map ,f :files<cr>
:map ,w :ag<cr>

" java 


" autocompletation

set completeopt-=preview
set completeopt+=longest,menuone,noinsert
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#always_use_completeopt = 1
let g:jedi#popup_on_dot = 0  " it may be 1 as well
let g:mucomplete#user_mappings = { 'sqla' : "\<c-c>a" }
let g:mucomplete#chains = { 'sql' : ['file', 'sqla', 'keyn'] }
set shortmess+=c
"let g:deoplete#enable_at_startup = 1
"let g:loaded_sql_completion = 0
"let g:omni_sql_default_compl_type = 'syntax'
"let g:omni_sql_no_default_maps = 1
"let g:ftplugin_sql_omni_key = '<leader>sql'
"let g:ftplugin_sql_omni_key = '<plug>disablesqlomni'

"filetype plugin off
"set omnifunc=



" floaterm
let g:floaterm_keymap_toggle = ',t'
let g:floaterm_keymap_next   = ',<tab>'
let g:floaterm_keymap_new    = ',nt'
map ,t :floatermnew! cd %:p:h <cr>clear<cr>

""""""""""""""
" coc config
""""""""""""""
" use tab for trigger completion with characters ahead and navigate.
" note: use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
let g:coc_node_path = '/usr/local/bin/node'

inoremap <silent><expr> <tab>
      \ pumvisible() ? "\<c-n>" :
      \ <sid>check_back_space() ? "\<tab>" :
      \ coc#refresh()

"inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<c-h>"

" the <tab> could be remapped by another plugin, use :verbose imap <tab> to
" check if it's mapped as expected
inoremap <silent><expr> <c-@> coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" make <cr> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<c-g>u\<cr>\<c-r>=coc#on_enter()\<cr>"

" use k to show documentation in preview window.
nnoremap <silent> k :call <sid>show_documentation()<cr>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call cocactionasync('dohover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" use `[g` and `]g` to navigate diagnostics
" use `:cocdiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <plug>(coc-diagnostic-prev)
nmap <silent> ]g <plug>(coc-diagnostic-next)


" css 

autocmd filetype scss setl iskeyword+=@-@
" multicursor
let g:multi_cursor_use_default_mapping=0

" default mapping
let g:multi_cursor_start_word_key      = '<c-n>'
let g:multi_cursor_select_all_word_key = '<a-n>'
let g:multi_cursor_start_key           = 'g<c-n>'
let g:multi_cursor_select_all_key      = 'g<a-n>'
let g:multi_cursor_next_key            = '<c-n>'
let g:multi_cursor_prev_key            = '<c-p>'
let g:multi_cursor_skip_key            = '<c-x>'
let g:multi_cursor_quit_key            = '<esc>'


" vdebuger

let g:vdebug_options = {
\  'port':9003,
\  'server':'localhost',
\  'break_on_open' : 0,
\  'ide_key' : 'vvvdebug'
\}

" laravel

au filetype php,blade let b:coc_root_patterns = ['.git', '.env', 'composer.json', 'artisan']


