set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" Basics configurations 
" set term=screen-256color
set guicursor=
set noshowmode
set cursorline
set nobackup
set nowritebackup
set noswapfile
set clipboard=unnamedplus
set autowrite     " Automatically :write before running commands
set shortmess+=a
set shortmess+=s
set shortmess+=c
set shortmess+=F
set fillchars+=vert:│,fold:-

" Mappings
let mapleader = ","
nnoremap <silent> <leader>h :noh<cr>
map <silent> <Leader>n <plug>NERDTreeTabsToggle<CR>
nnoremap <leader>ev :tabnew $MYVIMRC<cr>
nnoremap <leader>ec :CocConfig<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>vs :vnew<cr>
nnoremap <leader>hs :new<cr>
nnoremap <leader>in :IndentLinesToggle<cr>
nnoremap <leader>f :Ack! 
nnoremap <leader>= :CocCommand prettier.formatFile<cr>
vnoremap <leader>r "hy:%s/<C-r>h//gc<left><left><left>

" Make searching better set gdefault
set gdefault
set ignorecase    " case insensitive searching (unless specified)
set smartcase
set showmatch

" Softtabs, 4 spaces
set tabstop=4
set shiftwidth=4
set shiftround
set expandtab
set smartindent
set title        " show nice title in xterm
let &showbreak='↳ ' 
" set nowrap
" set wrapmargin=16
" set textwidth=78
" set cc=+1

" Numbers
set nonumber
set numberwidth=2
set relativenumber

" Splits
set splitright
set splitbelow

" Plugins
" set rtp+=~/.config/nvim/plugins/Vundle.vim/ " set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/
call plug#begin('~/.config/nvim/plugins')
Plug 'itchyny/lightline.vim'  " A light and configurable statusline/tabline plugin for Vim.
Plug 'chriskempson/base16-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vwxyutarooo/nerdtree-devicons-syntax'
Plug 'tpope/vim-surround' " This plugin is a tool for dealing with pairs of surroundings.
Plug 'raimondi/delimitmate' " provides automatic closing of quotes, parenthesis, brackets, etc.
Plug 'tmhedberg/matchit'
Plug 'alvan/vim-closetag'  " close tage if you press >
Plug 'vim-scripts/tComment' " TComment will comment out/uncommented.
Plug 'yggdroot/indentline' " show indention level
Plug 'christoomey/vim-tmux-navigator'
Plug 'danro/rename.vim'
Plug 'wincent/terminus'
Plug 'stanangeloff/php.vim'
Plug 'jwalton512/vim-blade'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'mustache/vim-mustache-handlebars'
Plug 'tpope/vim-repeat'
Plug 'mileszs/ack.vim'
Plug 'ryanoasis/vim-devicons'
call plug#end()

" Plugins Configuration  
" ----------- coc.nvim  ------------- 
" inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <C-Space> for trigger snippet expand.
imap <C-Space> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" ----------- NERDTree ------------- 
let g:NERDTreeMinimalUI=1

" ----------- ctrlp ------------- 
let g:ctrlp_map = '<leader>p'
let g:ctrlp_show_hidden = 1
let g:ctrlp_open_multiple_files = 't'
let g:ctrlp_open_new_file = 't'
set wildignore+=*/node_modules/*,*/tmp/*,*.so,*.swp,*.zip,*.mp3,*.mp4,*.ogg,*.pdf,*.jpg,*.jpeg,*.gif,*.deb,*.webm,*.mkv

" ----------- base16 ------------------------
if exists('$KONSOLE_PROFILE_NAME') !~ 1
    let base16colorspace=256
endif
if filereadable(expand("~/.vimrc_background"))
    source ~/.vimrc_background
endif

" ----------- lightline ------------------------
let g:lightline = {
            \'colorscheme': 'solarized',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'readonly', 'relativepath', 'fileformat', 'modified'] ],
            \   'right': [ [ 'lineinfo']
            \              ]
            \ },
            \'component': {
            \'lineinfo': '%3p%% :   %3l/%-2v',
            \},
            \'component_function': {
            \'readonly': 'LightlineReadonly',
            \'filetype': 'MyFiletype',
            \'fileformat': 'MyFileformat',
            \},
            \'separator': { 'left': '', 'right': '' },
            \'subseparator': { 'left': '', 'right': '' }
            \}

function! LightlineReadonly()
    return &readonly ? '' : ''
endfunction

function! LightlineFugitive()
    if exists('*fugitive#head')
        let branch = fugitive#head()
        return branch !=# '' ? ''.branch : ''
    endif
    return ''
endfunction

function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
    return WebDevIconsGetFileTypeSymbol()
endfunction
  
" ----------- vim-php-namespace ------------------------
" function! IPhpInsertUse()
"     call PhpInsertUse()
"     call feedkeys('a',  'n')
" endfunction
" autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

" ---------- vim-closetag -----------------------
let g:closetag_filenames = "*.xml,*.html,*.xhtml,*.phtml"
au FileType xml,html,phtml,php,blade.php,xhtml,js let b:delimitMate_matchpairs = "(:),[:],{:}"

" ---------- delimitMate -----------------------
let delimitMate_expand_cr = 1
au FileType mail let b:delimitMate_expand_cr = 1

" ---------- indentline -----------------------
let g:indentLine_enabled = 1
let g:indentLine_char = '│' " let g:indentLine_char = '┊'
let g:indentLine_bufTyepExlude = ['Nerd_tree.*']
let g:indentLine_fileTypeExclude = ['help', 'markdown', 'reason']
let g:vim_json_syntax_conceal = 1

" ---------- devicons -----------------------
" let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:webdevicons_enable_ctrlp = 1
let g:webdevicons_enable_nerdtree = 1

" Tab navigation like Firefox.
nnoremap <C-t>     :tabnew<CR>

execute 'highlight link EndOfBuffer ColorColumn'
execute 'highlight clear VertSplit'
execute 'highlight link VertSplit LineNr'