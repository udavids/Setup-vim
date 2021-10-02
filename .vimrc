" Set compatibility to Vim only.
set nocompatible
set nolist
set rnu

" number width
set numberwidth=1

" show position rows and columns
set ruler

" interact with the mouse
set mouse=a

" clipboard
set clipboard=unnamed

" Indentation with space
set sw=2

" Helps force plug-ins to load correctly when it is turned back on below.
filetype off

" Turn on syntax highlighting.
syntax on

" For plug-ins to load correctly.
filetype plugin indent on

" Turn off modelines
set modelines=0

" Automatically wrap text that extends beyond the screen length.
set wrap

" Vim's auto indentation feature does not work properly with text copied
" from outside of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

" Uncomment below to set the max textwidth. Use a value corresponding to the
" width of your screen.
set textwidth=80
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5

" Fixes common backspace problems
set backspace=indent,eol,start

" Speed up scrolling in Vim
set ttyfast

" Status bar
set laststatus=2

" Display options
set showmode
set showcmd

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Show line numbers
set number

" Set status line display
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

" Encoding
set encoding=utf-8

" Highlight matching search patterns
 set hlsearch

" Enable incremental search
set incsearch

" Include matching uppercase words with lowercase search term
set ignorecase

" Include only uppercase words with uppercase search term
set smartcase

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb
" of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

set t_Co=256

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

call plug#begin('~/.vim/plugged')

" Themes
Plug 'morhetz/gruvbox'

" Navigation 'IDE'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'preservim/nerdcommenter'
Plug 'Yggdroot/indentLine'

" Statusline
Plug 'vim-airline/vim-airline'

" Typing
Plug 'jiangmiao/auto-pairs'

" Autocomplete
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" tmux
Plug 'christoomey/vim-tmux-navigator'

" vim-go
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries'  }

" Jedi-vim --> python
Plug 'davidhalter/jedi-vim'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}

" HTML
Plug 'mattn/emmet-vim'

" Javascript
Plug 'jelera/vim-javascript-syntax'

" Bracey server is like extension to vs code  LIVE SERVER
Plug 'turbio/bracey.vim'
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}

call plug#end()

" Colorschemes
" Gruvbox
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'

" Tagbar
nmap <F8> :TagbarToggle<CR>

let g:kite_supported_languages = ['javascript', 'python', 'go', 'HTML','Css']
let mapleader = " "

" plug easymotion -> space + s to search
nmap <Leader>s <Plug>(easymotion-s2)

" Plug NerdTree --> space + nt to open and :q + intro to close and m to see the menu
nmap <Leader>nt :NERDTreeFind<CR>
let NERDTreeQuitOnOpen = 1 " To close Nerdtree with open other file

" shortcuts to save and exit with the space key
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>

noremap <leader>gs :CocSearch
noremap <leader>fs :Files<cr>
noremap <leader><cr> <cr><c-w>h:q<cr>

let g:airline_powerline_fonts = 1

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
:imap ii <Esc>

" Snippets are separated from the engine. Add this if you want them:
" Trigger configuration. You need to change this to something other than <tab>
" if you use one of the following:
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" python
" vim-python
augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
      \ formatoptions+=croq softtabstop=4
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

" jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#smart_auto_mappings = 0

" Bracey server
let g:bracey_auto_start_browser = 1
" Bracey configuration
  " this starts the bracey server and optionally opens your default web browser
  " to bracey's address. if you have an html file open as your current buffer, it
  " will be displayed and you may begin editing it live.
    " :Bracey
      " will shutdown the server and stop sending commands
        " :BraceyStop
          " force the current web page to be reloaded
            " :BraceyReload
