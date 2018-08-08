source ~/.vimrc.bundles

set tabstop=4
syntax on
set shiftwidth=4

set backspace=2
set ignorecase

" NERDTree
map <C-e> :NERDTreeToggle<CR>

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
