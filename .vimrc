set nocompatible
set expandtab
set shiftwidth=2
set softtabstop=2
set noswapfile
set relativenumber
set number
set clipboard=unnamed
set termguicolors
set nowrap
set splitright
set splitbelow
call plug#begin()
Plug 'jaxbot/semantic-highlight.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'
Plug 'ternjs/tern_for_vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Raimondi/delimitMate'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdcommenter'
Plug 'mileszs/ack.vim'
Plug 'dracula/vim'
call plug#end()
color dracula
autocmd FileType javascript SemanticHighlight
nnoremap <Leader>f :NERDTreeToggle<Enter>
nnoremap <Leader>b :buffers<CR>:buffer<Space>
nnoremap <Leader>l :ALEFix<Enter>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeQuitOnOpen = 1
let g:ale_fixers = { 'javascript': ['eslint'], 'vue': ['eslint'] }
let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<C-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:delimitMate_expand_cr=2
let g:delimitMate_expand_space=2
let g:airline_theme='dracula'
