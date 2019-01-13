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

Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Rip-Rip/clang_complete'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-markdown'
Plug 'elzr/vim-json'
Plug 'ervandew/eclim'
Plug 'tmux-plugins/vim-tmux' 
Plug 'ekalinin/Dockerfile.vim'
"js setup
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'ternjs/tern_for_vim'
" clang setup?
Plug 'JBakamovic/yavide'

"vim-workspaces
Plug 'thaerkh/vim-workspace'
Plug '907th/vim-auto-save' " Auto saves
" Open brower windows
Plug 'tyru/open-browser.vim'

" better window navigation
Plug 't9md/vim-choosewin'

"for closing current buffer (:Bclose)
Plug 'rbgrouleff/bclose.vim'

"inline git files diffs
Plug 'mhinz/vim-signify'

" cool plugin to test code
Plug 'metakirby5/codi.vim'

"A class outline for c++ or the OOP 
Plug 'majutsushi/tagbar'

" vim-startify
Plug 'mhinz/vim-startify'
"" fuzz finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Asynchronous Lint Engine
Plug 'w0rp/ale'
"

" auto complete
"Plug 'ncm2/ncm2'

Plug 'rizzatti/dash.vim'

"
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
endif


" better in file search
Plug 'haya14busa/incsearch.vim'

Plug 'janko-m/vim-test'

" Writing stuff
Plug 'reedes/vim-pencil'
Plug 'tpope/vim-abolish' " Fancy abbreviation replacements
Plug 'junegunn/limelight.vim' " Highlights only active paragraph
Plug 'junegunn/goyo.vim' " Full screen writing mode
Plug 'reedes/vim-lexical' " Better spellcheck mappings
Plug 'reedes/vim-litecorrect' " Better autocorrections
Plug 'reedes/vim-textobj-sentence' " Treat sentences as text objects
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax' 

" Initialize plugin system
call plug#end()

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
"oppsite of "J"
nnoremap K i<CR><Esc>

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


"javascript setup
" JSX Highlighting
let g:jsx_ext_required = 0
let g:syntastic_javascript_checkers = ['eslint']

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

" incsearch.vim 
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" vim-choosewin
nmap  -  <Plug>(choosewin)

" ale 
let g:ale_completion_enabled = 1
let g:deoplete#enable_at_startup = 1

" check one time after 4s of inactivity in normal mode
set autoread                                                                                                                                                                                    
au CursorHold * checktime 

nmap <leader>c :TagbarToggle<CR>
"color scheme settings
colorscheme slate

" might need to change this path based on system
let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
let g:python3_host_prog ='/Users/josh/.pyenv/versions/neovim3/bin/python'

augroup pencil
   autocmd!
   autocmd filetype markdown,mkd call pencil#init()
       \ | call lexical#init()
       \ | call litecorrect#init()
       \ | setl spell spl=en_us fdl=4 noru nonu nornu
       \ | setl fdo+=search
  augroup END
 " Pencil / Writing Controls {{{
   let g:pencil#wrapModeDefault = 'soft'
   let g:pencil#textwidth = 74
   let g:pencil#joinspaces = 0
   let g:pencil#cursorwrap = 1
   let g:pencil#conceallevel = 3
   let g:pencil#concealcursor = 'c'
   let g:pencil#softDetectSample = 20
   let g:pencil#softDetectThreshold = 130
 " }}}
 "
let g:auto_save = 1  " do not display the auto-save notification
