source ~/.vimrc.bundles

syntax on

colorscheme bclear

set tabstop=4
set shiftwidth=4
set backspace=2
set ignorecase
set smartcase " Case sensitive when uc present
set hlsearch  " Highlight search terms
set incsearch " Find as you type search
set wildmenu  " Show list instead of just completing

set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

" Support Shift Tab
inoremap <S-Tab> <C-d>

" Undo
set undofile
set undodir=~/.vim/undodir " Set undofile store path
set undolevels=1000        " Maximum number of changes that can be undone
set undoreload=10000       " Maximum number lines to save for undo on a buffer reload

" airline
let g:airline_theme='term'

" NERDTree
map <C-e> :NERDTreeToggle<CR>

" FZF
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
map <C-p> :FZF<CR>

" tab
map <C-t> :tabedit 

" toggle sh
map <C-d> :sh<CR>

" preview replace
map <C-f> :OverCommandLine<CR>

" signify
let g:signify_sign_add        = '+'
let g:signify_sign_delete     = '-'
let g:signify_sign_change     = '~'
let g:signify_sign_show_count = 0
highlight SignifySignAdd    cterm=bold ctermfg=green
highlight SignifySignDelete cterm=bold ctermfg=red
highlight SignifySignChange cterm=bold ctermfg=yellow
highlight SignColumn        ctermbg=none

" Indent Guides
let g:indent_guides_start_level           = 2
let g:indent_guides_guide_size            = 1
let g:indent_guides_enable_on_vim_startup = 1

cab W  w
cab Wq wq
cab wQ wq
cab WQ wq
cab Q  q

source ~/.vimrc.local
