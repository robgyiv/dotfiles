" Plugins setup

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.local/share/nvim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'srstevenson/vim-picker', { 'branch': 'main' }
" Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'tpope/vim-surround'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-fugitive'
Plug 'mcchrish/nnn.vim'

Plug 'Shougo/ddc.vim'
Plug 'Shougo/ddc-around'
Plug 'Shougo/ddc-matcher_head'
Plug 'Shougo/ddc-sorter_rank'
Plug 'vim-denops/denops.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}


" Themes
Plug 'liuchengxu/space-vim-theme'
Plug 'sbdchd/neoformat'
Plug 'sophacles/vim-processing'
Plug 'tpope/vim-vinegar'
Plug 'yuttie/hydrangea-vim'
Plug 'christophermca/meta5'
Plug 'haishanh/night-owl.vim'
Plug 'bluz71/vim-moonfly-colors'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'scalameta/nvim-metals'
Plug 'sainnhe/everforest'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'yunlingz/ci_dark'
Plug 'morhetz/gruvbox'

call plug#end()

" Editor settings

" Show filename in terminal tab: https://askubuntu.com/a/589717
autocmd BufEnter * let &titlestring = '' . expand("%:t")
set termguicolors
colorscheme space_vim_theme
" let g:tokyonight_style = "day"
let g:lightline = {
      \ 'colorscheme': 'ci_dark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
" let &colorcolumn="80"
" set cursorline
set colorcolumn=80,120
let mapleader = "\<Space>"
set autoread
set background=dark
set cursorline
set hlsearch
set ignorecase
set incsearch
set lazyredraw
" Display unprintable characters f12 - switches
set list
" Unprintable chars mapping
set listchars=tab:>\ ,trail:•,extends:»,precedes:«
set number
set relativenumber
" Open new split panes to right and bottom
set splitbelow
set splitright
set title
" Visual autocomplete for command menu
set wildmenu
set clipboard=unnamed
let g:neoformat_enabled_python = ['black']
let g:neoformat_enabled_javascript = ['prettier-eslint']
let g:neoformat_enabled_sbt = ['scalafmt']
let g:neoformat_enabled_scala = ['scalafmt']

" Edit crontab with vim
autocmd filetype crontab setlocal nobackup nowritebackup
" Set filetype for Python Processing files
au BufRead,BufNewFile *.pyde set filetype=python
au BufRead,BufNewFile *.pde set filetype=java shiftwidth=2 softtabstop=2 expandtab

au BufReadPost *.pde set syntax=java

" Mappings

" Navigate splits more easily
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" vim-picker
nmap <unique> <leader>pe <Plug>(PickerEdit)
nmap <unique> <leader>ps <Plug>(PickerSplit)
nmap <unique> <leader>pt <Plug>(PickerTabedit)
nmap <unique> <leader>pv <Plug>(PickerVsplit)
nmap <unique> <leader>pb <Plug>(PickerBuffer)
nmap <unique> <leader>p] <Plug>(PickerTag)
nmap <unique> <leader>pw <Plug>(PickerStag)
nmap <unique> <leader>po <Plug>(PickerBufferTag)
nmap <unique> <leader>ph <Plug>(PickerHelp)

" indentLines
map <leader>ig :IndentLinesToggle<CR>
let g:indentLine_enabled = 0
let g:indentLine_color_gui = '#2C323C'
let g:indentLine_char = '│'

" Neoformat
map <leader>af :Neoformat<CR>

" defx
nnoremap <leader>n :execute "Defx " . expand("%:p:h")<CR>

" Plugin settings

" vim-vinegar
let g:netrw_liststyle = 3

" fzy
function! FzyCommand(choice_command, vim_command)
  try
    let output = system(a:choice_command . " | fzy ")
  catch /Vim:Interrupt/
    " Swallow errors from ^C, allow redraw! below
  endtry
  redraw!
  if v:shell_error == 0 && !empty(output)
    exec a:vim_command . ' ' . output
  endif
endfunction

if (has("termguicolors"))
  set termguicolors
endif

" Use fileame in buffer for tmux tab, reset it on quit
" Credit https://stackoverflow.com/questions/15123477/tmux-tabs-with-name-of-file-open-in-vim/29693196#29693196
autocmd BufEnter * call system("tmux rename-window " . expand("%:t"))
autocmd VimLeave * call system("tmux rename-window fish")

" pyenv
let g:python_host_prog = '/Users/robbie/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/robbie/.pyenv/versions/neovim3/bin/python'

" ale
let b:ale_fixers = {'javascript': ['prettier', 'eslint'], 'scala': ['scalafmt']}
let g:ale_fix_on_save = 1
let g:ale_linters = {'javascript': ['eslint', 'flow']}

" ddc
call ddc#custom#patch_global('sources', ['around'])
call ddc#custom#patch_global('sourceOptions', {
      \ '_': {
      \   'matchers': ['matcher_head'],
      \   'sorters': ['sorter_rank']},
      \ })
call ddc#enable()

" nnn
" Set custom mappings
nnoremap <silent> <leader>nn :NnnPicker<CR>

" Start n³ in the current file's directory
nnoremap <leader>n :NnnPicker %:p:h<CR>

let g:nnn#action = {
      \ '<c-t>': 'tab split',
      \ '<c-s>': 'split',
      \ '<c-v>': 'vsplit' }

" treesitter
" require'nvim-treesitter.configs'.setup {
"   highlight = {
"     enable = true,
"     -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
"     -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
"     -- Using this option may slow down your editor, and you may see some duplicate highlights.
"     -- Instead of true it can also be a list of languages
"     additional_vim_regex_highlighting = false,
"   },
" }
" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()

" " coq
" " main one
" Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" " 9000+ Snippets
" Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

" " lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
" " Need to **configure separately**

" Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
" " - shell repl
" " - nvim lua api
" " - scientific calculator
" " - comment banner
" " - etc
