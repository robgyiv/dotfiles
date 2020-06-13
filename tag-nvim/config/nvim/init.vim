" Plugins setup

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.local/share/nvim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'srstevenson/vim-picker'
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'tpope/vim-surround'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-fugitive'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'liuchengxu/space-vim-dark'
Plug 'sbdchd/neoformat'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'sophacles/vim-processing'
Plug 'tpope/vim-vinegar'
Plug 'haishanh/night-owl.vim'
Plug 'nanotech/jellybeans.vim'

call plug#end()

" Editor settings

" Show filename in terminal tab: https://askubuntu.com/a/589717
autocmd BufEnter * let &titlestring = '' . expand("%:t")
colorscheme night-owl
let g:lightline = {
      \ 'colorscheme': 'nightowl',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
let &colorcolumn="80"
set cursorline
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
let g:deoplete#enable_at_startup = 1
set clipboard=unnamed
let g:neoformat_enabled_python = ['black']
let g:neoformat_enabled_javascript = ['prettier-eslint']

" Edit crontab with vim
autocmd filetype crontab setlocal nobackup nowritebackup

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
let b:ale_fixers = {'javascript': ['prettier', 'eslint']}
let g:ale_fix_on_save = 1
