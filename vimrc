
set nocompatible              " be iMproved, required
filetype off                  " required
set number 

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'delimitMate.vim'
Plugin 'Syntastic'
Plugin 'aperezdc/vim-template'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" For solarized plugin (color scheme): 
" https://github.com/altercation/vim-colors-solarized
if !has("gui_running")
    let g:solarized_termtrans=1
    let g:solarized_termcolors=256
endif

let hour = strftime("%H")
if 6 <= hour && hour < 18
  set background=light
else
  set background=dark
endif

colorscheme solarized
" ------------

" For Powerline plugin (status bar):  
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

if has("gui_running")
   let s:uname = system("uname")
   if s:uname == "Darwin\n"
      set guifont=Inconsolata\ for\ Powerline:h15
   endif
endif

set laststatus=2 " Always show the statusline
" ------------

:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar

"For YCM plugin: 
let g:ycm_register_as_syntastic_checker = 0 "default 1 ( = on)
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py' 


" For Syntastic plugin: 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"



" Vim Doxygen 
let g:DoxygenToolkit_briefTag_pre="@Synopsis  " 
let g:DoxygenToolkit_paramTag_pre="@Param " 
let g:DoxygenToolkit_returnTag="@Returns   " 
