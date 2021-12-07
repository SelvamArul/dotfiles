" vundle setup start
set nocompatible              " required
set showcmd
filetype off                  " required

set rtp+=~/.vim/bundle/fzf
let mapleader = "\<Space>"

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/vundle.vim'
" Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
" Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'Yggdroot/indentLine'
Plugin 'sainnhe/sonokai'
" Plugin 'vim-scripts/SyntaxRange'
Plugin 'tpope/vim-commentary'
" Plugin 'junegunn/rainbow_parentheses.vim'
Plugin 'easymotion/vim-easymotion' " the most awesome plugin ever!!!
Plugin 'vim-airline/vim-airline'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'jaxbot/semantic-highlight.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'turbio/bracey.vim'
Plugin 'chrisbra/Recover.vim' "swp file management
" Plugin 'kh3phr3n/python-syntax'
call vundle#end()            " required
filetype plugin indent on    " required
" vundle setup end

set encoding=utf-8

set cursorline " show the cursor position all the time
set showmatch " highlight matching braces

set confirm " confirm :q in case of unsaved changes

set incsearch " do incremental search
set smartcase " ...unless capital letters are used

" map <C-n> :NERDTreeToggle<CR>
set tabstop=4
set shiftwidth=4

set softtabstop=4 
set expandtab
set smartindent
set smarttab
let g:ycm_global_ycm_extra_conf = ".vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"

let g:indentLine_bgcolor_term = 239 
let g:indentLine_setColors = 0
let g:indentLine_char = '┆'

" Enable folding
set foldmethod=indent
set foldlevel=99


let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

let python_highlight_all=1
syntax on
nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>:

set number 
set relativenumber

" let g:solarized_termcolors=16 
" set t_Co=256 
" set background=dark


" Important!! 
" if has('termguicolors') 
"     set termguicolors 
" endif 

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" https://github.com/sainnhe/sonokai/issues/20
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
let g:sonokai_style = 'atlantis'
let g:sonokai_disable_italic_comment = 1
colorscheme sonokai

" refresh NERDTree automatically
" map <C-n> :call NERDTreeToggleAndRefresh()<CR>

" function NERDTreeToggleAndRefresh()
"   :NERDTreeToggle
"   if g:NERDTree.IsOpen()
"     :NERDTreeRefreshRoot
"   endif
" endfunction
" refresh NERDTree automatically

" Use ctrl-[hjkl] to select the active split!
" https://stackoverflow.com/questions/6053301/easier-way-to-navigate-between-vim-split-panes
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" enable mouse split resizing
set mouse=n
set ttymouse=xterm2

set list
set listchars=tab:>-

" use F3 to save the current file without leaving insert mode
inoremap <F3> <C-O>:w<CR>

" disable concealing latex command. This is a super annoying feature
autocmd BufEnter *.tex set conceallevel=0
autocmd BufEnter *.tex set concealcursor=n

" Brackets pairs rainbow colorizer
" https://www.reddit.com/r/vim/comments/n2kbs3/bracket_pair_colorizer_in_vim_compatible_with/gwmc2e2/?context=8&depth=9
" let g:rainbow#max_level = 16
" let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
" autocmd FileType * RainbowParentheses

" let NERDTreeShowHidden=0
" let g:NERDTreeIgnore = ['\.git$']

let g:airline_powerline_fonts = 1


nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <Space>b :Buffers<CR>
let g:fzf_preview_window = 'right:60%'
nnoremap <c-p> :Files<cr>
map <C-g> :Ag><CR>

nnoremap <Leader>s :SemanticHighlightToggle<cr>

" fugitive shortcuts
nnoremap <leader>ys :G<CR>
nnoremap <leader>yc :Git commit<CR>
nnoremap <leader>yp :Git push<CR>


" let g:ycm_global_ycm_extra_conf = '$HOME/.ycm_extra_conf.py'
" ycm symbol search
nmap <leader>yfd <Plug>(YCMFindSymbolInDocument)
nmap <leader>yfw <Plug>(YCMFindSymbolInWorkspace)
