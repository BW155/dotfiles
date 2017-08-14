"No Compatibility, very annoying on RH/Windows/MacOS
set nocompatible

" All Plugins!
call plug#begin()
Plug 'scrooloose/nerdtree'

" Syntax files
Plug 'pangloss/vim-javascript'
Plug 'nono/jquery.vim'
Plug 'rust-lang/rust.vim'
Plug 'keith/swift.vim'
Plug 'othree/html5.vim'
Plug 'stanangeloff/php.vim'
Plug 'mitsuhiko/vim-jinja'
Plug 'cespare/vim-toml'
Plug 'hdima/python-syntax'
Plug 'hail2u/vim-css3-syntax'
Plug 'udalov/kotlin-vim'
Plug 'mhartington/oceanic-next'

" Autocompletion
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Misc
Plug 'vim-airline/vim-airline'

call plug#end()

" Required for operations modifying multiple buffers like rename.
set hidden

" Vim config
set nu

" Deoplete config
let g:deoplete#enable_at_startup = 1
" Deoplete tab config
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"


" Shortcuts
map <C-n> :NERDTreeToggle<CR>

" LSP config
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ }
let g:LanguageClient_autoStart = 1

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
colorscheme OceanicNext

" Airline
let g:airline_theme='oceanicnext'
let g:airline#extensions#tabline#enabled = 1
