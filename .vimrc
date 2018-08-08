source ~/.vimrc.bundles

syntax on

set tabstop=4
set shiftwidth=4
set backspace=2
set ignorecase
set smartcase " Case sensitive when uc present
set hlsearch  " Highlight search terms
set incsearch " Find as you type search
set showmatch " Show matching brackets/parenthesis

set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

" Support Shift Tab
inoremap <S-Tab> <C-d>

" Undo
set undofile
set undodir=~/.vim/undodir " Set undofile store path
set undolevels=1000        " Maximum number of changes that can be undone
set undoreload=10000       " Maximum number lines to save for undo on a buffer reload

" NERDTree
map <C-e> :NERDTreeToggle<CR>

" FZF
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
map <C-P> :FZF<CR>

" Indent Guides
colorscheme bclear
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

cab W  w
cab Wq wq
cab wQ wq
cab WQ wq
cab Q  q

source ~/.vimrc.local
