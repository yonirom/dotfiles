set nocompatible       " disable vi compatibility.

filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim

" Plugins " {{{
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Valloric/vim-valloric-colorscheme'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
" Plugin 'garbas/vim-snipmate'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/nerdtree'
Plugin 'fugitive.vim'
Plugin 'repeat.vim'
Plugin 'godlygeek/tabular'
Plugin 'L9'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tComment'
" Plugin 'scrooloose/syntastic'
Plugin 'flazz/vim-colorschemes'
Plugin 'rizzatti/dash.vim'
Plugin 'kien/ctrlp.vim'
" Plugin 'fholgado/minibufexpl.vim'
Plugin 'majutsushi/tagbar'
Plugin 'torrancew/vim-openscad'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'burnettk/vim-angular'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'w0rp/ale'

Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-colorscheme-switcher'
Plugin 'airblade/vim-rooter'
Plugin 'tehmaze/vim-pythonGotoFile'
Plugin 'luochen1990/rainbow'
Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'nathanalderson/yang.vim'
Plugin 'mileszs/ack.vim'
Plugin 'farseer90718/vim-taskwarrior'
" Plugin 'prabirshrestha/async.vim'
" Plugin 'prabirshrestha/vim-lsp'
" Plugin 'ajh17/vimcompletesme'
Plugin 'sjl/splice.vim'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'skywind3000/gutentags_plus'
Plugin 'RRethy/vim-illuminate'
Plugin 'Yggdroot/indentLine'
Plugin 'ayu-theme/ayu-vim'
Plugin 'terryma/vim-smooth-scroll'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'

call vundle#end()
let g:colorscheme_switcher_define_mappings=0
map <F7> :NextColorScheme<CR>
map <S-F7> :PrevColorScheme<CR>
filetype plugin indent on             " Automatically detect file types.
" " }}}

nmap <F8> :TagbarToggle<CR>
nnoremap // :TComment<CR>
vnoremap // :TComment<CR>

" General "{{{
set history=256        " Number of things to remember in history.
set autowrite          " Writes on make/shell commands
set autoread
set background=dark

set timeoutlen=250     " Time to wait after ESC (default causes an annoying delay)
set clipboard+=unnamed " Yanks go on clipboard instead.
set pastetoggle=<F10>  " toggle between paste and normal: for 'safer' pasting from keyboard
set tags=./tags;$HOME  " walk directory tree upto $HOME looking for tags

" Modeline
set modelines=5      " default numbers of lines to read for modeline instructions
" Backup
set nowritebackup
set nobackup
set directory=/tmp// " prepend(^=) $HOME/.tmp/ to default path; use full path as backup filename(//)
" Buffers
set hidden           " The current buffer can be put to the background without writing to disk
" Match and search
set hlsearch       " highlight search
set ignorecase       " Do case in sensitive matching with
set smartcase        " be sensitive when there's a capital letter
set incsearch
" "}}}

" Formatting "{{{
set formatoptions=tcroqnj
"set fo+=o " Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
"set fo-=r " Do not automatically insert a comment leader after an enter
set fo-=t " Do no auto-wrap text using textwidth (does not apply to comments)


set nowrap
set textwidth=160          " wrap lines by default
set colorcolumn=+1        " this makes the color after the textwidth column highlighted
set wildmode=longest,list " At command line, complete longest common string, then list alternatives.

set backspace=indent,eol,start " more powerful backspacing

set tabstop=8     " Set the default tabstop
set softtabstop=2
set shiftwidth=2  " Set the default shift width for indents
set noexpandtab   " Make tabs into spaces (set by tabstop)
set shiftround    " makes indenting a multiple of shiftwidth
set smarttab      " Smarter tab levels

set autoindent
set copyindent          " copy the previous indentation on autoindenting
set cindent
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do,for,switch,case
set cino=b1,g0,N-s,t0,(0,W4  " see :h cinoptions-values
set smarttab            " smart tab handling for indenting
set magic               " change the way backslashes are used in search patterns
set bs=indent,eol,start " Allow backspacing over everything in insert mode

syntax on               " enable syntax
" "}}}

" Visual "{{{
" set nonumber        " Line numbers off
set number            " Line numbers on
set relativenumber    " Line numbers relative
set showmatch     " Show matching brackets.
set matchtime=5   " Bracket blinking.
set novisualbell  " No blinking
set noerrorbells  " No noise.
set laststatus=2  " Always show status line.
set noshowmode    " don't show the mode ("-- INSERT --") at the bottom
set vb t_vb=      " disable any beeps or flashes on error
set showcmd       " Display an incomplete command in the lower right corner of the Vim window
set shortmess=a   " Shortens messages
" set cursorline    " Highlight current line

" undo files, after closing
set undofile
set undodir=~/tmp,/var/tmp,/tmp,$TEMP

" none of these should be word dividers, so make them not be
set iskeyword+=_,$,@,%,#


set list                                          " Display unprintable characters f12 - switches
set listchars=tab:··,trail:·,extends:»,precedes:« " Unprintable chars mapping

set foldenable                                   " Turn on folding
set foldmethod=marker                            " Fold on the marker
set foldlevel=100                                " Don't autofold anything (but I can still fold manually)
set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds
set foldlevelstart=99                            " all folds open by default

set splitbelow
set splitright
set wildignore=*.pyc,*.o,__pycache__ " Wildcard file ignore

" "}}}

" Gui Options " {{{
if has("gui_running")
  "set guifont=Courier\ New:h12
  "set guifont=Consolas:h14
  set guifont=Source\ Code\ Pro:h12
  set antialias
endif
" " }}}

" Set termguicolors to work within tmux: https://github.com/vim/vim/issues/993
let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
set termguicolors     " enable true colors support

" Command and Auto commands " {{{
" Sudo write
comm! W exec 'w !sudo tee % > /dev/null' | e!
" " }}}

"Auto commands
au BufRead,BufNewFile {COMMIT_EDITMSG}                                set ft=gitcommit

" Close if only NERDTree left
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd BufEnter * silent! lcd %:p:h

" Automatically delete trailing DOS-returns and whitespace on file open and
" write.
autocmd BufRead,BufWritePre,FileWritePre * silent! %s/[\r \t]\+$//

autocmd FileType python set equalprg=yapf

" Key mappings " {{{
nnoremap <silent> <LocalLeader>rs :source ~/.vimrc<CR>
nnoremap <silent> <LocalLeader>re :e ~/.vimrc<CR>

" Tabs
nnoremap <silent> <LocalLeader>[ :tabprev<CR>
nnoremap <silent> <LocalLeader>] :tabnext<CR>

" Buffers
snoremap <silent> <LocalLeader>- :bd<CR>

map <S-CR> A<CR><ESC>

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" " }}}

":imap <C-J> <Plug>snipMateNextOrTrigger
":smap <C-J> <Plug>snipMateNextOrTrigger
let g:UltiSnipsExpandTrigger="<c-Space>"

let g:NERDTreeIgnore=['\.pyc', '\~$', '__pycache__']
let g:NERDTreeChDirMode=1
let g:NERDTreeMinimalUI=1

nmap <F2> :NERDTreeToggle<CR>
nmap <F3> :NERDTreeFind<CR>

"colorscheme grb256
"colorscheme hybrid
"colorscheme codeschool
"colorscheme molokai
let ayucolor="mirage"   " for dark version of theme
colorscheme ayu
inoremap ˙ <C-o>h
inoremap ∆ <C-o>j
inoremap ˚ <C-o>k
inoremap ¬ <C-o>l

let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  airline                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 0
let g:airline_theme = 'tomorrow'
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#gutentags#enabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  ctrl-p                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_max_files = 0
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
nnoremap <C-_> :CtrlPBuffer<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                syntastic                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"let g:syntastic_error_symbol = '✗'
"let g:syntastic_warning_symbol = '⚠'
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_python_checkers = ['pylama']
"let g:syntastic_python_flake8_args = '--select=F,C9 --max-complexity=10'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   ALE                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_linters = { 'python': ['mypy', 'flake8', 'pyre', 'pylama'], }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              YouCompleteMe                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_extra_conf_globlist = ['~/cheetah/*']
let g:ycm_filetype_specific_completion_to_disable = {'javascript': 1}
let g:ycm_confirm_extra_conf = 1
let g:ycm_use_clangd = 0
" let g:ycm_server_python_interpreter = '/usr/bin/python3'
" let g:ycm_server_use_vim_stdout = 1
" let g:ycm_server_log_level = 'debug'

nnoremap <leader>z :YcmForceCompileAndDiagnostics<cr>
nnoremap <leader>x :YcmCompleter GoTo<CR>
nnoremap <leader>c :YcmCompleter GoToDefinition<CR>
nnoremap <leader>v :YcmCompleter GoToDeclaration<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              editorconfig                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Ack                                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if executable('ag')
  let g:ackprg = 'ag --nogroup --nocolor --column'
endif

nnoremap <Leader>a :Ack!<Space>
nnoremap <leader>g :Ack! <C-R><C-W><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  smoothscoll                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
nnoremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
nnoremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
nnoremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  indentLine                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_char = '┆'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Illuminate                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi link illuminatedWord Visual


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                      Gutentags / Gutentags plus                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" enable gtags module
let g:gutentags_modules = ['ctags', 'gtags_cscope']

" generate datebases in my cache directory, prevent gtags files polluting my project
let g:gutentags_cache_dir = expand('~/.cache/tags')

" change focus to quickfix window after search
let g:gutentags_plus_switch = 1

" forbid gutentags adding gtags databases
let g:gutentags_auto_add_gtags_cscope = 0

" enable gutentag debugging
let g:gutentags_define_advanced_commands = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Vim Rooter                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rooter_manual_only = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" EDITOR SETTINGS
set ignorecase          " case insensitive searching
set smartcase           " but become case sensitive if you type uppercase characters
" this can cause problems with other filetypes
" see comment on this SO question http://stackoverflow.com/questions/234564/tab-key-4-spaces-and-auto-indent-after-curly-braces-in-vim/234578#234578
"set smartindent         " smart auto indenting
set nobackup            " no backup~ files.


" misc settings
set fileformat=unix            " file mode is unix
set fileformats=unix,dos,mac   " detects unix, dos, mac file formats in that order

set viminfo='20,\"500   " remember copy registers after quitting in the .viminfo
                        " file -- 20 jump links, regs up to 500 lines'


set mouse=a                 " enables the mouse in all modes
set mousemodel=popup_setpos " Right-click on selection should bring up a menu

" With this, the gui (gvim and macvim) now doesn't have the toolbar, the left
" and right scrollbars and the menu.
set guioptions-=T
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=m
set guioptions-=M

" this makes sure that shell scripts are highlighted
" as bash scripts and not sh scripts
let g:is_posix = 1

" if executable('clangd')
"     augroup lsp_clangd
"         autocmd!
"         autocmd User lsp_setup call lsp#register_server({
"                     \ 'name': 'clangd',
"                     \ 'cmd': {server_info->['clangd']},
"                     \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
"                     \ })
"         autocmd FileType c setlocal omnifunc=lsp#complete
"         autocmd FileType cpp setlocal omnifunc=lsp#complete
"         autocmd FileType objc setlocal omnifunc=lsp#complete
"         autocmd FileType objcpp setlocal omnifunc=lsp#complete
"     augroup end
" endif
