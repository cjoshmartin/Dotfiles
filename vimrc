if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
"" Plugs go here!

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdcommenter'

"" Text hightlighting

Plug 'bfrg/vim-cpp-enhanced-highlight'
Plug 'Rip-Rip/clang_complete'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-markdown'
Plug 'elzr/vim-json'
Plug 'ervandew/eclim'

"vim-workspaces
Plug 'thaerkh/vim-workspace'

"for closing current buffer (:Bclose)
Plug 'rbgrouleff/bclose.vim'

"" fuzz finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }


" Initialize plugin system
call plug#end()
 "PlugUpdate " TODO:  autoupdate when vim starts
" personal setup
let mapleader=","       " leader is comma
set mouse=a
nnoremap <F6> :w
set guifont=Menlo\ Regular:h18 "font
set showcmd             " show command in bottom bar
set number
set relativenumber
map ; :
set backspace=indent,eol,start

set backup " Vim keeps deleting my work, ugh!
set backupdir=/var/tmp,/tmp "backups are not in the directory
set directory=/var/tmp,/tmp " yay no more commiting swaps to git
" keep files up today
set autoread
au CursorHold * checktime

" Note:
" `"+y` - copy to clipboard
" `"+p` or `:put +` - paste from clipboard
set clipboard=unnamed "sets vim's clipboard to the system clipboard (NOTE: a version of vim with clipboard support is required)

""  to lazy to hold shift
map ; :

filetype plugin on

" Indentation settings for using 4 spaces instead of tabs.
" " Do not change 'tabstop' from its default value of 8 with this setup.
 set shiftwidth=4
 set softtabstop=4
 set expandtab



" Nerd Tree stuff

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif "Controls how nerdtree will auto open

nmap <leader>t :NERDTreeToggle<CR> " Open tree
nmap <leader>j :NERDTreeFind<CR> " search tree

let NERDTreeShowHidden=1 " show hidden files

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " Closes nerdTree if the vim buffer is the only one open
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Airline
"
let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'


let base16colorspace=256  " Access colors present in 256 colorspace


"reload vim without closing
map <leader>s :source %<CR>


" save more history
set hidden
set history=100


" JSX Highlighting
let g:jsx_ext_required = 0


"CPP Highlighting

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1


"fzf settings
map <leader>f :Files<CR>
map <leader>b :Buffers<CR>
map <leader>m :Maps<CR>

"Workspaces
nnoremap <leader>w :ToggleWorkspace<CR>

let g:workspace_persist_undo_history = 1  " enabled = 1 (default), disabled = 0
let g:workspace_undodir='.undodir'


" Closing the current buffer
nnoremap <leader>q :Bclose<CR>


"color scheme settings
colorscheme slate
let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
