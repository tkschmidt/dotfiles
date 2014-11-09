""git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"vim +PluginInstall +qall
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'godlygeek/tabular'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'elixir-lang/vim-elixir'
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'fatih/molokai'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'airblade/vim-gitgutter'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
call vundle#end()            " required
filetype plugin indent on    " required
"" map , as the leader key

""helps with buffer
set hidden
syntax on
"folding settings
set foldmethod=syntax   "fold based on indent
set nofoldenable        "dont fold by default
"set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set noswapfile                 " Don't use swapfile
set nobackup                   " Don't create annoying backup files
set splitright                 " Split vertical windows right to the current windows
set splitbelow                 " Split horizontal windows below to the current windows
set encoding=utf-8             " Set default encoding to UTF-8
set autowrite                  " Automatically save before :next, :make etc.
set autoread                   " Automatically reread changed files without asking me anything
set laststatus=2
set showcmd                    " Show me what I'm typing
set showmode                   " Show current mode.
set lazyredraw                 " Wait to redraw                                                              "
set incsearch                  " Shows the match while typing
set hlsearch                   " Highlight found searches
set ignorecase                 " Search case insensitive...
set smartcase                  " ... but not when search pattern contains upper case characters
set ttyfast
set mouse=a                    " Automatically enable mouse usage
set mousehide                  " Hide the mouse cursor while typing
set cursorline                 " Highlight current line
set wildmenu                   " Show list instead of just completing
set wildmode=list:longest,full " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]  " Backspace and cursor keys wrap too
set scrolljump=5               " Lines to scroll when cursor leaves screen
set scrolloff=3                " Minimum lines to keep above and below cursor
" speed up syntax highlighting
set nocursorcolumn
set nocursorline
"syntax sync minlines=256"
colorscheme molokai
set tags=./tags;/,~/.vimtags


""""""""""""""""""
"""""mapping""""""
""""""""""""""""""
let mapleader = ","
"pressing F6 executes active line in bash
nnoremap <F4> :NERDTreeToggle<cr>
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
nmap <F6> :.w !bash
nmap <F9> :set ignorecase! ignorecase?
nnoremap <leader>k :NERDTreeToggle<cr>
" Press Space to turn off highlighting and clear any message already
" displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
"next and previous error of make"
map cn <esc>:cn<cr>
map cp <esc>:cp<cr>
""case insetive search tooglebar
nnoremap <leader>l :TagbarToggle<CR>
""go to tag definition
nnoremap <leader>j <C-]>
""go back from tag
nnoremap <leader>h <C-t>
" Move to the previous buffer with "gp"
 nnoremap <leader>p :bp<CR>
" " Move to the next buffer with "gn"
 nnoremap <leader>o :bn<CR>
" " List all possible buffers with "gl"
 nnoremap <leader>m :ls<CR>
" " List all possible buffers with "gb" and accept a new buffer argument [1]
 nnoremap <leader>b :ls<CR>:b
"" close split but
 nmap <leader>d :b#<bar>bd#<CR>
" Shortcuts
" Change Working Directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:airline#extensions#tabline#enabled = 1

" is needed to create new files with NERDtab
:set modifiable
let g:gitgutter_max_signs = 1000  "default value 500"

" Instead of reverting the cursor to the last position in the buffer, we
"     " set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call  setpos('.', [0, 1, 1, 0])

" Map <Leader>ff to display all lines with keyword under cursor
"     " and ask which one to jump to
nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

if isdirectory(expand("~/.vim/bundle/tabular"))
	nmap <Leader>a& :Tabularize /&<CR>
	vmap <Leader>a& :Tabularize /&<CR>
	nmap <Leader>a= :Tabularize /=<CR>
	vmap <Leader>a= :Tabularize /=<CR>
	nmap <Leader>a=> :Tabularize /=><CR>
	vmap <Leader>a=> :Tabularize /=><CR>
	nmap <Leader>a: :Tabularize /:<CR>
	vmap <Leader>a: :Tabularize /:<CR>
	nmap <Leader>a:: :Tabularize /:\zs<CR>
	vmap <Leader>a:: :Tabularize /:\zs<CR>
	nmap <Leader>a, :Tabularize /,<CR>
	vmap <Leader>a, :Tabularize /,<CR>
	nmap <Leader>a,, :Tabularize /,\zs<CR>
	vmap <Leader>a,, :Tabularize /,\zs<CR>
	nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
	vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
endif

" vim-airline {
" " Set configuration options for the statusline plugin vim-airline.
" " Use the powerline theme and optionally enable powerline symbols.
" " To use the symbols , , , , , , and .in the statusline
" " segments add the following to your .vimrc.before.local file:
" "   let g:airline_powerline_fonts=1
" " If the previous symbols do not render for you then install a
" " powerline enabled font.
"
" " See `:echo g:airline_theme_map` for some more choices
" " Default in terminal vim is 'dark'
if isdirectory(expand("~/.vim/bundle/vim-airline/"))
	let g:airline_powerline_fonts=1
	if !exists('g:airline_theme')
		let g:airline_theme = 'molokai'
	endif
	if !exists('g:airline_powerline_fonts')
"     " Use the default set of separators with a few customizations
		let g:airline_left_sep='›'  " Slightly fancier than '>'
		let g:airline_right_sep='‹' " Slightly fancier than '<'
	endif
endif
"         " }
