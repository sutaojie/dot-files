if &compatible
  set nocompatible
endif
set hidden

set noautochdir
set shortmess=a
set autowriteall

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/_vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'Shutnik/jshint2.vim'
Plugin 'rhysd/committia.vim'
Plugin 'dbakker/vim-projectroot'
Plugin 'posva/vim-vue'
Plugin 'mhinz/vim-startify'
Plugin 'mxw/vim-jsx'
Plugin 'Yggdroot/indentLine'
Plugin 'vim-scripts/vim-auto-save'
Plugin 'vim-ruby/vim-ruby'
Plugin 'jiangmiao/auto-pairs'
Plugin 'othree/html5.vim'
Plugin 'vimoutliner/vimoutliner'
Plugin 'leafgarland/typescript-vim'

Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-rails'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'wting/gitsessions.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'reedes/vim-colors-pencil'
Plugin 'xolox/vim-misc'


Plugin 'mikewest/vimroom'
Plugin 'sjl/gundo.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ervandew/supertab'
Plugin 'groenewege/vim-less'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'romainl/flattened'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
"Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-rooter'
Plugin 'vim-scripts/gitignore'
Plugin 'elzr/vim-json'
"colors
Plugin 'tomasr/molokai'
Plugin 'dsolstad/vim-wombat256i'
Plugin 'vim-scripts/wombat256.vim'
" snips
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-fugitive'

"neovim
"Plugin 'Shougo/deoplete.nvim'
"Plugin 'Shougo/neoyank.vim'
"Plugin 'Shougo/neomru.vim'
"Plugin 'Shougo/vimproc.vim'
"Plugin 'Shougo/unite.vim'
"Plugin 'tsukkee/unite-tag'
"Plugin 'ujihisa/unite-colorscheme'
"Plugin 'lambdalisue/unite-grep-vcs'

call vundle#end()            " required
filetype plugin indent on
syntax enable


" js hint 2
let jshint2_save = 1
let jshint2_max_height = 12


" git gutter
let g:gitgutter_diff_args = '--ignore-all-space --ignore-blank-lines'

let g:session_autosave = 'no'

let g:gundo_preview_height = 30
let g:gundo_right = 1
let g:syntastic_json_checkers = ['jsonlint']
let g:vim_json_syntax_conceal = 0

set guioptions-=L
set guioptions-=r
let mapleader = "\<space>"
let g:mapleader = "\<space>"
let g:EasyGrepWindowPosition = "botright"

set noshowmode
set autoread
set iskeyword=@,$,48-57,192-255,_

" project

function! <SID>AutoProjectRootCD()
  try
    if &ft != 'help'
      ProjectRootCD
    endif
  catch
    echon 'error'
  endtry
endfunction

autocmd BufEnter * call <SID>AutoProjectRootCD()

" nerdtree
let g:NERDTreeWinPos = "right"
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=0
nnoremap <silent> <leader>f :<c-u>ProjectRootExe NERDTreeFind<cr>
autocmd FileType nerdtree call s:nerdtree_settings()
function! s:nerdtree_settings()
  " Play nice with supertab
  " Enable navigation with control-j and control-k in insert mode
  nmap <buffer> <ESC>   :NERDTreeClose<CR>
  nmap <buffer> <c-c>   :NERDTreeClose<CR>
  nmap <buffer> `   :NERDTreeClose<CR>
  nmap <buffer> q   :NERDTreeClose<CR>
endfunction

" NERDTree tabs
let g:nerdtree_tabs_open_on_console_startup = 0
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:nerdtree_tabs_open_on_new_tab = 0
let g:nerdtree_tabs_autofind = 1

" NERDTree git
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "M",
    \ "Staged"    : "+",
    \ "Untracked" : "?",
    \ "Renamed"   : "R",
    \ "Unmerged"  : "C",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

nnoremap <leader>k :Bclose<CR>


" auto save
let g:auto_save = 0  " enable AutoSave on Vim startup
let g:auto_save_in_insert_mode = 0

" ctrlp
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]((\.(git|hg|svn))|(bower_components|node_modules|target))$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ 'link': 'some_bad_symbolic_links',
      \ }
nnoremap <leader>b :b#<CR>
nnoremap <c-b> :CtrlPBuffer<CR>
inoremap <c-b> <c-o>:CtrlPBuffer<CR>
nnoremap <c-e> :CtrlPMRUFiles<CR>
inoremap <c-e> <c-o>:CtrlPMRUFiles<CR>
noremap <c-g> <c-o>:Ag<CR>
let g:ctrlp_use_caching = 0
set grepprg=ag\ --nogroup\ --nocolor
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['.git']

let g:ctrlp_prompt_mappings = {
      \ 'ToggleType(1)':        ['<tab>', '<c-up>'],
      \ 'ToggleType(-1)':       ['<s-tab>', '<c-down>'],
      \ 'PrtExpandDir()':       ['<c-f>'],
      \ }


autocmd Filetype ruby,coffee,sass,scss,jade,erb setlocal ts=2 sw=2
autocmd Filetype md,markdown setlocal ts=4 sw=4
autocmd Filetype mk,markdown setlocal expandtab
au BufNewFile,BufRead *.vue setlocal filetype=vue
autocmd Filetype vue setlocal filetype=html
autocmd Filetype coffee SnipMateLoadScope eruby

" emmet
let g:user_emmet_install_global = 1
"autocmd FileType html,erb,css,less,sass,scss EmmetInstall
"autocmd FileType html,erb,css,less,sass,scss imap <buffer> <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
let g:user_emmet_leader_key='<C-A-S-Z>'
imap   <C-y>   <plugin>(emmet-expand-abbr)
nmap   <C-y>   <plugin>(emmet-expand-abbr)
vmap   <C-y>   <plugin>(emmet-expand-abbr)

" markdown
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_folding_style_pythonic = 0
let g:vim_markdown_conceal = 0

let g:session_autoload = 'no'

" tab
map <leader>1 :b 1<cr>
map <leader>2 :b 2<cr>
map <leader>3 :b 3<cr>
map <leader>4 :b 4<cr>
map <leader>5 :b 5<cr>
map <leader>6 :b 6<cr>
map <leader>7 :b 7<cr>
map <leader>8 :b 8<cr>
map <leader>9 :b 9<cr>
map <s-tab> :bp<cr>
nnoremap <C-T> :tabnew %:p<CR>
nnoremap <tab> :bn<cr>

" fold
set nofen
set foldlevel=0
set foldmethod=manual
set foldnestmax=5

vnoremap <space><space> zf
nnoremap <space><space> za




"encoding
set encoding=utf8
scriptencoding utf-8
set fileencodings=ucs-bom,utf-8,gbk,cp936,gb18030,big5,euc-jp,euc-kr,latin1
autocmd BufNewFile,BufRead *.git/{,modules/**/}{COMMIT,MERGE}* set fenc=utf8



" better
set lazyredraw
map q: :q
"vnoremap <silent> y y`]
"vnoremap <silent> p p`]
"nnoremap <silent> p p`]
nnoremap <Leader>w :w<CR>
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>t :tabnew<CR>
function! ClipboardYank()
  call system('pbcopy', @@)
endfunction
function! ClipboardPaste()
  let @@ = system('pbpaste')
endfunction

noremap ;; :%s:::g<Left><Left><Left>
noremap ;' :%s:::cg<Left><Left><Left><Left>
autocmd FileType coffee,erb,html,css,scss,rb setlocal foldmethod=indent
"autocmd FileType javascript set formatprg=prettier\ --stdin\ --print-width\ 120\ --single-quote\ true\ --trailing-comma\ es5\ --semi\ false
"autocmd BufWritePre *.js exe "normal! gggqG\<C-o>\<C-o>"
map 0 ^
map j gj
map k gk
nnoremap Y "+y
nnoremap <silent><S-b> :<C-u>call search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%^','bW')<CR>
nnoremap <silent><S-w> :<C-u>call search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%$','W')<CR>
noremap <C-S> :w<CR>
vnoremap <C-T> :tabnew %:p:h<CR>
noremap <F11> <C-u>:wincmd o<CR>
set autoindent
set shm=at
set cmdheight=2
set nosmartindent
set nocindent
set backspace=eol,start,indent
set background=light
"set completeopt=menuone
set expandtab
set listchars=tab:>·
set fileformats=unix,dos,mac
set history=10000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lbr
set mat=2
set mouse=
set mousemodel=extend
set nobackup
set switchbuf=usetab
set nolinebreak
set noswapfile
set nowb
set wrap
set pastetoggle=<F4>
set relativenumber
set number
set sessionoptions-=buffers
set sessionoptions-=options
set shiftwidth=2
set showmatch
set smartcase
set smarttab
set splitbelow
set splitright
set tabstop=2
set undodir=/Users/frank/.vim/undodir/
set undofile
"set viminfo^=% " Remember info about open buffers on close

" wild
set whichwrap+=<,>,h,l
set wildignore=*.o,*~,*.pyc
set wildmenu
set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>
nnoremap <M-`> :b <C-Z>

" airline
"let g:airline_section_b = '%{strftime("%H:%M")}'

if has("gui_running")
  set guifont=Sauce\ Code\ Powerline:h13
endif

" colorscheme
colorscheme molokai
set colorcolumn=0
map <F11> :let &background = ( &background == "dark"? "light" : "dark" )<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
  let l:currentBufNum = bufnr("%")
  let l:alternateBufNum = bufnr("#")

  if buflisted(l:alternateBufNum)
    buffer #
  else
    bnext
  endif

  if bufnr("%") == l:currentBufNum
    new
  endif

  if buflisted(l:currentBufNum)
    execute("bdelete! ".l:currentBufNum)
  endif
endfunction

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir
set undolevels=1000         " How many undos
set undoreload=20000        " number of lines to save for undo

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
  let myUndoDir = expand(vimDir . '/undodir')
  " Create dirs
  call system('mkdir ' . vimDir)
  call system('mkdir ' . myUndoDir)
  let &undodir = myUndoDir
  set undofile
endif


"airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" StripTrailingWhitespaces
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
"set spell spelllang=en_us

"rails
nnoremap <leader>rt :<c-u>!rails t<CR>
nnoremap <leader>rr :<c-u>!bin/rake routes<CR>
nnoremap <leader>rv :<c-u>Eview<CR>
nnoremap <leader>rc :<c-u>Econtroller<CR>

" jsx
let g:jsx_ext_required = 0

" startify

let g:startify_files_number           = 8
let g:startify_change_to_dir          = 1
let g:startify_update_oldfiles        = 1
let g:startify_session_autoload       = 1
let g:startify_session_persistence    = 1

let g:startify_bookmarks = [
        \ { 'c': '~/_vimrc' },
        \ ]

let g:startify_custom_header =
        \ startify#fortune#cowsay('═','║','╔','╗','╝','╚')

let g:startify_custom_footer =
       \ ['', "   Vim is charityware. Please read ':help uganda'.", '']

let g:startify_list_order = [
      \ ['  # 最近使用的文件'],
      \ 'files',
      \ ['  # 会话'],
      \ 'sessions',
      \ ['  # 书签'],
      \ 'bookmarks'
      \ ]

nnoremap <leader>h :<c-u>:ProjectRootCD<cr>
nnoremap <leader>b :<c-u>silent exec "!open %:p"<CR>
autocmd FileType javascript imap <buffer> <c-l> <c-o>:<c-u>silent exec "!prettier --single-quote --trailing-comma es5 --print-width 120 --semi false --write %:p" \| echon '已格式化' <CR>
autocmd FileType javascript nmap <buffer> <c-l> :<c-u>silent exec "!prettier --single-quote --trailing-comma es5 --print-width 120 --semi false --write %:p" \| echon '已格式化' <CR>
autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])
fun! RememberLine()
    if &ft =~ 'gitcommit'
        return
    endif
    if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif 
endfun
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost * call RememberLine()
let g:committia_min_window_width=120
