set autoindent
set number
set mouse=a
set numberwidth=1
syntax on 
set guioptions-=r
set guioptions=Ace
set encoding=utf-8
set relativenumber
set nocompatible
"" Visual block
nnoremap q <c-v>
"" tabs
:map tn :tabnew<cr>

if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
else
  set clipboard=unnamedplus "Linux
endif




:imap ii <ESC>
let g:pymode_python = 'python3'


call plug#begin()
" navigate
Plug 'preservim/NERDTree'
" systax color
Plug 'sheerun/vim-polyglot'
Plug 'vim-python/python-syntax'
" status bar
Plug 'vim-airline/vim-airline'
" HTML XML 
Plug 'mattn/emmet-vim'
" themes
Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'tomasiser/vim-code-dark'

Plug 'rakr/vim-one'

Plug 'morhetz/gruvbox'

Plug 'terryma/vim-multiple-cursors'


" autocompletation
" Plug 'lifepillar/vim-mucomplete'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" floatterm
Plug 'voldikss/vim-floaterm'
" jedi 

Plug 'davidhalter/jedi-vim'

call plug#end()

" nerdtree maps
:map <Space>n :NERDTreeToggle<CR> 
" status bar
:let g:airline_section_z = airline#section#create(['%3p%% %L:%3v']) 
" emmet-vim
:let g:user_emmet_leader_key = ','
" floaterm
:hi Floaterm guibg=black
" themes

" dracula
"colorscheme dracula


 " gruvbox
"let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
 

 "colorscheme one
" call one#highlight('Comment', '8F8F8F', '', 'none')
"" colorscheme codedark

" Transparent background dracula and one theme

 autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE


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

:map <C-j> <C-W>j
:map <C-k> <C-W>k
:map <C-h> <C-W>h
:map <C-l> <C-W>l

"" fzf

:map ,f :Files<CR>
:map ,w :Ag<CR>

" JAVA 


" Autocompletation

set completeopt-=preview
set completeopt+=longest,menuone,noinsert
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#always_use_completeopt = 1
let g:jedi#popup_on_dot = 0  " It may be 1 as well
let g:mucomplete#user_mappings = { 'sqla' : "\<c-c>a" }
let g:mucomplete#chains = { 'sql' : ['file', 'sqla', 'keyn'] }
set shortmess+=c
"let g:deoplete#enable_at_startup = 1
"let g:loaded_sql_completion = 0
"let g:omni_sql_default_compl_type = 'syntax'
"let g:omni_sql_no_default_maps = 1
"let g:ftplugin_sql_omni_key = '<Leader>sql'
"let g:ftplugin_sql_omni_key = '<Plug>DisableSqlOmni'

"filetype plugin off
"set omnifunc=



" floaterm
let g:floaterm_keymap_toggle = ',t'
let g:floaterm_keymap_next   = ',<Tab>'
let g:floaterm_keymap_new    = ',nt'
map ,T :FloatermNew! cd %:p:h <CR>clear<CR>

""""""""""""""
" CoC Config
""""""""""""""
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
let g:coc_node_path = '/usr/local/bin/node'

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" the <tab> could be remapped by another plugin, use :verbose imap <tab> to
" check if it's mapped as expected
inoremap <silent><expr> <c-@> coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)


" css 

autocmd FileType scss setl iskeyword+=@-@
" multicursor
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

