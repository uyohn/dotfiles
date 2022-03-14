set encoding=utf-8

" PLUGINS

call plug#begin('~/.local/share/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'plasticboy/vim-markdown'

Plug 'preservim/tagbar'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'phanviet/vim-monokai-pro'
Plug 'rakr/vim-one'
Plug 'ryanoasis/vim-devicons'

Plug 'ActivityWatch/aw-watcher-vim'

call plug#end()


" COC CONFIG

set conceallevel=2

let g:coc_global_extensions = [
\	'coc-json',
\	'coc-css',
\	'coc-html',
\	'coc-emmet',
\	'coc-git',
\	'coc-markdownlint',
\	'coc-explorer',
\ 	'coc-clangd' ]

inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1] =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

" Use `complete_info` if your vim supports it, like:
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"




" GENERAL

set hidden
set cmdheight=2

set wrap
set linebreak
set tabstop=4
set shiftwidth=4

set number relativenumber
set incsearch

set noshowmode

set clipboard=unnamedplus

syntax on

set autoindent


" SPLITS
set splitright
set splitbelow

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l


" GET OUT OF TERMINAL
tnoremap <Esc> <C-\><C-n>


" THEME
set termguicolors
let g:enable_italics_font = 1
let g:enable_bold_font = 1
let g:hybrid_transparent_background = 1

set background=dark
colorscheme monokai_pro

hi def link gasOpcodeX86_PENT_SSE  x86_64

" AIRLINE
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='molokai'


" MAPPINGS
let mapleader=" "

nmap <leader>n	:CocCommand explorer	<CR>
nmap <leader>v	:CocList outline	<CR>
map <leader>c	:TagbarToggle		<CR>

map <leader>q	:w <CR> :bd		<CR>
map <leader>h	:bprevious		<CR>
map <leader>l	:bnext			<CR>

" journal
map <leader>d :put =strftime('# Day: %a - %d. %B %Y') <CR>

" AUTOCMD

" disable comments on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" asm files
autocmd BufRead,BufNewFile *.asm set filetype=masm
autocmd BufRead,BufNewFile *.ASM set filetype=masm

" filetype html for ejs
autocmd BufRead,BufNewFile *.ejs set filetype=html

" run xrdb whenever Xdefaults or Xresources are updated
autocmd BufWritePost ~/.Xresources,~/.Xdefaults !xrdb %

" source new init.vim
autocmd BufWritePost ~/.config/nvim/init.vim :source %

" spicetify update
autocmd BufWritePost ~/.config/spicetify/Themes/*/color.ini :!spicetify update

autocmd BufRead ~/.config/polybar/config set filetype=dosini


" Skeletons
if has("autocmd")
	augroup templates
		autocmd BufNewFile *.sh          0r ~/.config/nvim/templates/bash.skeleton
		autocmd VimEnter   */Journal/**  0r ~/.config/nvim/templates/journal.skeleton
	augroup END
endif
