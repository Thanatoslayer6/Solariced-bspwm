" Neovim configuration

"PLUG INS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
call plug#begin('~/.config/nvim/plugged')
" Tools
    Plug 'vim-airline/vim-airline' "airline like powerlevel10k
    Plug 'vim-airline/vim-airline-themes' "themes for airline
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Syntax
    Plug 'sheerun/vim-polyglot' "Better syntax support with tons of launguages
    Plug 'ap/vim-css-color' "Displays a preview of colors with CSS 
    Plug 'honza/vim-snippets' "get some snippets 
"Color-schemes and designs
    Plug 'chriskempson/base16-vim' "themes for integration with terminal theme (alacritty)
    Plug 'ryanoasis/vim-devicons' "Icons for coc-explorer and such
call plug#end()


"COLOR SETTINGS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"load color scheme first

set termguicolors "when u use base16colors enable this. It fixes airline themes..

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif


" these 2 lines below make neovim use a transparent background especially with
" alacritty

hi! Normal ctermbg=NONE guibg=NONE 
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE 

"SETTINGS I USE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

"use mouse inside neovim on all modes
:set mouse=a
"Set number lines in neovim
set number
set relativenumber
"change directory of neovim to the file's current directory
:set autochdir
"use the same clipboard from all instances of neovim
set clipboard+=unnamedplus
"remap normal mode easier 
inoremap jk <Esc>

"tabs for COC-Explorer~

"goes to the next tab
nnoremap <C-L> :tabn<cr>
"goes to the previous tab
nnoremap <C-H> :tabp<cr>
"exit a buffer or simply exit a tab
nnoremap <C-D> :tabclose <cr>

"FILE EXPLORER (Coc-Explorer) ~~~~~~~~~~~~~~~~~
:nnoremap <C-f> :CocCommand explorer <CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

" COC ~~~~~~~~~~~~~~~~~~~~~~
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
:verbose imap <tab>

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"AIRLINE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

