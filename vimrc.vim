if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
"" Plugs go here!

Plug 'rizzatti/dash.vim'


Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdcommenter'
"" Text hightlighting
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-markdown'
Plug 'elzr/vim-json'
Plug 'tmux-plugins/vim-tmux' 
Plug 'ekalinin/Dockerfile.vim'
"js setup
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'ternjs/tern_for_vim'
" clang setup?
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Rip-Rip/clang_complete'
Plug 'JBakamovic/yavide'

"vim-workspaces
"Plug '907th/vim-auto-save' " Auto saves
"for closing current buffer (:Bclose)
Plug 'rbgrouleff/bclose.vim'

"inline git files diffs
Plug 'mhinz/vim-signify'

"A class outline for c++ or the OOP 
Plug 'majutsushi/tagbar'

"" fuzz finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" auto complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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
set showcmd             " show command in bottom bar
set backspace=indent,eol,start

" Note:
" `"+y` - copy to clipboard
" `"+p` or `:put +` - paste from clipboard
set clipboard=unnamed "sets vim's clipboard to the system clipboard (NOTE: a version of vim with clipboard support is required)

" no space
nnoremap g_ $

filetype plugin on

 " Export of pdfs easier
nnoremap <silent><leader>e :Pandoc pdf<CR>

nnoremap <leader>\ :vsplit<CR>
nnoremap <leader>- :split<CR>

nnoremap <leader>[ [sz=
nnoremap <leader>] ]sz=
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
"
map <leader>f :Files<CR>
map <leader>b :Buffers<CR>
map <leader>m :Maps<CR>


" Closing the current buffer
nnoremap <leader>q :Bclose<CR>

" Make command
map <leader>m :make<CR>

" check one time after 4s of inactivity in normal mode
set autoread                                                                                                                                                                                    
au CursorHold * checktime 

nmap <leader>c :TagbarToggle<CR>
"color scheme settings
colorscheme slate


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

" I have some trouble reading and proof reading espically 
" So I found this reddit thread that allows me to have TTS in vim
" https://www.reddit.com/r/vim/comments/2odq4l/osx_texttospeech_in_vim/cmroh22?utm_source=share&utm_medium=web2x
vnoremap <silent><leader>r "xy:call system('say '. shellescape(@x) .' &')<CR>
nnoremap <silent><leader>r :call system('say '.shellescape(expand('<cword>')).' &')<CR>

set number


" Test edit
"
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
