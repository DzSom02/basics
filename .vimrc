" Tab to 4 spaces
set softtabstop=4
set tabstop=4
set expandtab

" Line Numbers
set number

" Stuff for molokai colors
syntax on
set t_Co=256
set termguicolors
colorscheme molokai

" Line Width
set colorcolumn=80

set nowrap
"set textwidth=79
set cursorline

" Enable mouse for vim
set mouse=a

" Copy to clibboard
" set clipboard=unnamedplus

" Paste from the correct place or not (0 register) 
" nnoremap p "0p

" This stuff is for not copy to the register when pasting with visual
" I haven't found how to hide this function (yet)
" function! RestoreRegister()
"   let @" = s:restore_reg
"   return ''
" endfunction
" 
" function! s:Repl()
"     let s:restore_reg = @"
"     return \"p@=RestoreRegister()\<cr>\"
" endfunction
" 
" \" \"\NB: this supports \"rp that replaces the selection by the contents of @r
" vnoremap <silent> <expr> p <sid>Repl()

"End of this stuff


" ---------------------> Automatic things. <----------------------------------
" Python template for files .py
au bufnewfile *.py 0r $HOME/.vim/templates/sentinel.temp

" Autoremove whitespaces of empty lines.
autocmd BufWritePre *.py %s/\s\+$//e

" One space before def in classes.
" autocmd BufWritePre *.py :%s/\([^_]\n\)\(    def\)/\1\r\2/e

autocmd BufWritePre *.py :%s/\([^_]\)\(\n    @.*\n\)\(    def\)/\1\r\2\3/e

" 2 spaces before class when there are less than 2
autocmd BufWritePre *.py :%s/\(.\)\(\n\{1,2\}class\)/\1\r\r\rclass/e

" 2 spaces before class when there are more than 2
autocmd BufWritePre *.py :%s/\n\{4,50\}class/\r\r\rclass/e

" 1 space before def in classe when 0
autocmd BufWritePre *.py :%s/\(.\)\(\n    # _\{73\}\)/\1\r\2/e

" Add auto the beatiful commets for python.
autocmd BufWritePre *.py :%s/\(\n\n\)\(    @.*\n    def.*:\)/\1    # _________________________________________________________________________\r\2/e
autocmd BufWritePre *.py :%s/\(\n\)\(\n    def .\+):$\)/\r\r    # _________________________________________________________________________\2/e
"
" Keep only 1 empty line between a method and the previous
" autocmd BufWritePre *.py :%s/\(\n\{3,50\}\)\(    # _\{73\}\)/\r\r\2/e
"
autocmd BufWritePre *.py :%s/\(\n\{3,50\}\)\(    def.*:\)/\r\r\2/e

" Delete blank lines at the end of the python documents
autocmd BufWritePre *.py :v/\_s*\S/d



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"        BUNDLE STUFF                                                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"       END BUNDLE STUFF                                                      "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Plugins for bundle
Plugin 'scrooloose/syntastic'
Plugin 'valloric/youcompleteme'
" Plugin 'honza/vim-snippets'
" Plugin 'sirver/ultisnips'
Plugin 'ervandew/supertab'
Plugin 'heavenshell/vim-pydocstring'
Plugin 'reedes/vim-wordy'
Plugin 'vim-scripts/indentpython.vim'
" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'  
Plugin 'tpope/vim-fugitive' 
Plugin 'ap/vim-css-color'
Plugin 'AnsiEsc.vim'

" Use Google Docstring Style
let g:ultisnips_python_style = "google"

" YouCompleteMe and UltiSnips compatibility, with the helper of supertab
" (via http://stackoverflow.com/a/22253548/1626737)
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

" Autoclose preview windows from youcompleteme
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

"flake8 stuff
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_python_checkers = ['flake8']

" Syntastic plugin configuration
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [], 'passive_filetypes': []}

map <F2> :SyntasticCheck <CR>
map <F3> :SyntasticToggleMode <CR>
map <F4> :Pydocstring <CR>

" vim Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='luna' 
let g:airline#extensions#tabline#buffer_nr_show = 1

