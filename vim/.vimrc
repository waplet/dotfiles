" Required
set nocompatible
filetype off

" set t_Co=256

" Loads vim-plug.
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'lilydjwg/colorizer'
" Optional plugins.
" Plug 'Links'
" Plug 'https://github.com/tpope/vim-sensible.git'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'Raimondi/delimitMate'
" Plug 'SirVer/ultisnips'
" Plug 'Z1MM32M4N/vim-superman'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
" Plug 'chriskempson/base16-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'drmikehenry/vim-fontsize'
" Plug 'ervandew/supertab'
" Plug 'ggVGc/vim-fuzzysearch'
" Plug 'guns/vim-clojure-static'
Plug 'haya14busa/incsearch.vim'
" Plug 'haya14busa/vim-operator-flashy'
" Plug 'honza/vim-snippets'
" Plug 'hynek/vim-python-pep8-indent'
" Plug 'justinmk/vim-sneak'
" Plug 'kana/vim-operator-user'
" Plug 'kchmck/vim-coffee-script'
" Plug 'kshenoy/vim-signature'
" Plug 'ludovicchabant/vim-gutentags'
Plug 'luochen1990/rainbow'
" Plug 'majutsushi/tagbar'
" Plug 'mattn/gist-vim'
" Plug 'mattn/webapi-vim'
Plug 'mhinz/vim-sayonara'
" Plug 'mileszs/ack.vim'
Plug 'morhetz/gruvbox'
" Plug 'mxw/vim-jsx'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'nelstrom/vim-visual-star-search'
" Plug 'pangloss/vim-javascript'
" Plug 'plasticboy/vim-markdown'
" Plug 'rhysd/devdocs.vim'
Plug 'scrooloose/nerdtree'
" Plug 'scrooloose/syntastic'
" Plug 'sjl/gundo.vim'
" Plug 'suan/vim-instant-markdown'
" Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-dispatch'
" Plug 'tpope/vim-eunuch'
" Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-leiningen'
" Plug 'tpope/vim-obsession'
" Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-sensible'
" Plug 'tpope/vim-sleuth'
" Plug 'tpope/vim-surround'
" Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/SQLUtilities'
" Plug 'vim-scripts/gitignore'
Plug 'vim-utils/vim-husk'
" Plug 'wellle/targets.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'mhartington/oceanic-next'
" Required by vim-plug.
call plug#end()

" Allows compiling haskell files with <F7>
autocmd FileType haskell nnoremap <F7> :w<CR>:!ghc % && ./%:t:r<CR>
au BufNewFile,BufRead *.hs set filetype=haskell

" Tabs to spaces
func! ResetIndentation()
    set tabstop=4       " The width of a TAB is set to 4.
                        " Still it is a \t. It is just that
                        " Vim will interpret it to be having
                        " a width of 4.
    set shiftwidth=4    " Indents will have a width of 4
    set softtabstop=4   " Sets the number of columns for a TAB
    set expandtab       " Expand TABs to spaces
endfunc

syntax on

call ResetIndentation()

set mouse=a

func! TabSize(size)
    :exe 'set tabstop=' . a:size
    :exe 'set shiftwidth=' . a:size
endfunc


" Adding base keymaps

" map <C-T> :tabe<CR>
" map <C-W> :tabc<CR>

" Disabled folds
set nofoldenable

" Disables swap-files
set noswapfile

" Show some special cahrs, well, specially
set list
set listchars=tab:→\ ,trail:·,nbsp:·

" Show at the start of wrapped lines.
let &showbreak = '↳ '

" Enables 'g' flag for search by default
set gdefault

" Ignore case when searching unless you type uppercase and lowercase letters.
set ignorecase
set smartcase

" Highlights line where cursor is.
set cursorline

" Set line numbers
set number

" Highlights search.
set hlsearch
" Delete highlight
nmap <C-l> :noh<CR>

" Don't update the display while executing macros.
set lazyredraw

set wildmode=longest,full

" Startup message is irritating.
set shortmess+=I

" The completion menu will show only when there is more than one match.
set completeopt=menuone

" Enables Vim built-in completion.
set omnifunc=syntaxcomplete#Complete

" Map leader to <Space>.
let mapleader = "\<Space>"

" Default Q is very annoying. Maps it to something useful.                    
nmap Q @q

" Go to next/prev tab.
nmap - gT
nmap = gt

" Move tabs. Idiomatic <S-{-,=}>.
nmap _ :tabm -1<CR>
nmap + :tabm +1<CR>

" Allows to switch back to tab you were before.
let g:last_tab = 1
nmap <Space><Space> :execute "tabn " . g:last_tab<CR>
au TabLeave * let g:last_tab = tabpagenr()

" Mappings for controlling splits.
" Was <M-h> instead of <Esc>h
nmap <Esc>h <C-w>h
nmap <Esc>j <C-w>j
nmap <Esc>k <C-w>k
nmap <Esc>l <C-w>l

" Wrap-friendly <j> and <k> keys.
nmap j gj
nmap k gk

nmap <M-q> :Sayonara<CR>

nmap H ^
vmap H ^
nmap L $
vmap L $

" Selects words
nmap * g*<C-o>
nmap # g#<C-o>

" Reselect text when indenting.
vmap < <gv
vmap > >gv

" Indent all the things!
nmap + gg=G2<C-o>

" Copy/pasting from/to system clipboard.
vmap <C-c> "+y
nmap <C-S-v> "+p
imap <C-S-v> <C-o>"*P
cmap <C-S-v> <C-r>+
cmap <S-Insert> <C-r>+

cmap <C-t> <C-a>tabe \| <C-e>

" Auto-closes that window when using q: instead of :q for mistake.
map q: :q

" Jump to next/previous function.
nmap <PageUp> <C-u>
nmap <PageDown> <C-d>

" Always go to exact position of the mark.
nmap ' `

" Hides 'Type :quit to exit'.
nnoremap <C-c> <C-c>:echo<CR>

"
" Auto-commands.
"

au filetype python setlocal makeprg=python\ %
au FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
au filetype html,htmldjango,css,scss,sass,javascript,coffee,sh,gitcommit setlocal iskeyword+=-
au filetype man setlocal nowrap

func! AuFtMarkdown()
    setlocal spell
    setlocal cc=80
    setlocal tw=80
endfunc
au filetype markdown call AuFtMarkdown()

func! AuFtVim()
    setlocal cc=78
    setlocal tw=78
endfunc
au filetype vim call AuFtVim()

func! AuFtPo()
    setlocal commentstring=#~\ %s
    setlocal cc=80
endfunc
au filetype po call AuFtPo()

func! AuFtSql()
    setlocal commentstring=--\ %s
endfunc
au filetype sql call AuFtSql()

func! AuFtGitCommit()
    setlocal spell
endfunc
au filetype gitcommit call AuFtGitCommit()


"" OceanicNext related
colorscheme OceanicNext

"
" Leader mappings (leaders).
" They are sorted alphabetically.
"

nmap <silent> <Leader>= <Plug>FontsizeBegin
nmap <silent> <Leader>+ <Plug>FontsizeInc
nmap <silent> <Leader>- <Plug>FontsizeDec
nmap <silent> <Leader>0 <Plug>FontsizeDefault

" Find in files (alternative grep).
nmap <Leader>a :Ack<Space>

" Blaming is always fun and it's useful for teaching. Be polite tho!
nmap <Leader>b :Gblame<CR>

" Colorize strings that are colors! Disabled by default because it's slow.
nmap <Leader>c :ColorToggle<CR>

" Search for diff markers.
nmap <Leader>d /\v[<>=]{4,}<CR>

" Open file.
nmap <Leader>e :e<Space>

" Reload file.
nmap <Leader>ee :e!<CR>

" Shortcut for setting filetype.
nmap <Leader>f :set ft=

" Restructures text so it doesn't go over `textwidth`.
vmap <Leader>q mtggvGgq`t

" Don't underestimate Vim help -- it is top notch!
nmap <Leader>h :help<Space>

nmap <Leader>m :make<CR>

" Shows registers.
nmap <Leader>r :registers<CR>

" Save and close buffer.
nmap <Leader>q :wq!<CR>

" Start selecting in visual-block mode.
nmap <Leader>v v<C-v>

nmap <Leader>w :w<CR>


if has('gui_running')
    " Sets color-scheme.
    " colorscheme slate
    " Solarized related
    " colorscheme solarized
    " let g:solarized_termcolors=256
    " let g:solarized_contrast="high"
    " let g:solarized_termtrans=1
    " set background=dark

    colorscheme solarized
    " Removes all GUI stuff.
    set guioptions=c

    " Sets font.
    " set guifont=Inconsolata-g\ for\ Powerline\ Medium\ 9
    set guifont=Monospace\ 9

    " Blink faster!
    set guicursor+=n-v-c:blinkon200

endif

"
" Rainbow configuration.
"

let g:rainbow_active = 1

let g:rainbow_conf = {
            \ 'guifgs': [
            \ "#F2777A",
            \ "#FFCC66",
            \ "#6699CC",
            \ "#CC99CC",
            \ "#F99157",
            \ "#66CCCC",
            \ "#99CC99",
            \ "#D27B53",
            \ ]
            \ }

"
" Instant Markdown configuration.
"

" Actually don't be instant.
" let g:instant_markdown_slow = 1

" Autostart is too of a surprise.
" let g:instant_markdown_autostart = 0

" It just makes sense to open preview like this.
" func! AuFtMarkdownInstantMarkdown()
"     nmap <buffer> <Space>m :InstantMarkdownPreview<CR>
" endfunc
" au filetype markdown call AuFtMarkdownInstantMarkdown()

"
" Colorized configuration.
"

let g:colorizer_startup = 0


"
" Airline configuration.
"

let g:airline_powerline_fonts = 1

"
" Nerd tree
"

nmap <C-k><C-b> :NERDTreeToggle<CR>

"
" Commentary
"

map <C-_> :Commentary<CR>

