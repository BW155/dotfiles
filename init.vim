"No Compatibility, very annoying on RH/Windows/MacOS
set nocompatible

" All Plugins!
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'mikelue/vim-maven-plugin'

" Syntax files
Plug 'sheerun/vim-polyglot'

" Autocompletion
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Misc
Plug 'vim-airline/vim-airline'
Plug 'mhartington/oceanic-next'
Plug 'eugen0329/vim-esearch'

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

" Required for operations modifying multiple buffers like rename.
set hidden

" Vim config
set nu
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set encoding=utf8
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11
set clipboard=unnamed
nmap <silent> <A-Up> : wincmd <C-W>k<CR>
nmap <silent> <A-Down> :wincmd <C-W>j<CR>
nmap <silent> <A-Left> :wincmd <C-W>h<CR>
nmap <silent> <A-Right> :wincmd <C-W>l<CR>

" autocmd BufNewFile,BufRead *.vue set filetype=html

" syntax config
let python_highlight_all = 1

"Deoplete config
let g:deoplete#enable_at_startup = 1
" Deoplete tab config
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Terminal esc
tnoremap <Esc> <C-\><C-n>


"Environment setup

fun! INIT_ENV()
    belowright 10sp
    terminal
endfunction

" Shortcuts
nnoremap <leader>e :call INIT_ENV()<CR>
nmap <C-n> :NERDTreeToggle<CR>
nn <silent><leader>l :setl rnu!<cr>

" LSP config
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'python': ['pyls'],
    \ }
let g:LanguageClient_autoStart = 1

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

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
let g:airline_powerline_fonts = 1

" NERDTree Highlight
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

" FZF
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
