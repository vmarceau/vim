" Options
call plug#begin('~/.config/nvim/plugged')

" Appearance
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'dracula/vim'

" Utilities
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'psliwka/vim-smoothie'

" JS
Plug 'pangloss/vim-javascript' 

" Initialize plugin system
call plug#end()

set clipboard=unnamedplus                   " access to system clipboard
set completeopt=noinsert,menuone,noselect   " 
set cursorline                              " highlight current line
set hidden                                  " allow hidden buffers
set inccommand=split                        " 
set number                                  " line numbers in gutter
set relativenumber                          " relative line numbers in gutter
set splitbelow splitright                   " default split behavior
set title                                   " 
set ttimeoutlen=0                           " 
set wildmenu                                " 
set backspace=indent,eol,start              " more powerful backspace
set nobackup                                " 
set nowritebackup                           " 
set cmdheight=2                             " command window height 
set updatetime=300                          " better ux with coc

" Tabs size
set expandtab
set shiftwidth=2
set tabstop=2

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" File browser
let g:netrw_banner=0
let g:netrw_liststyle=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_winsize=25
let g:netrw_keepdir=0
let g:netrw_localcopydircmd='cp -r'
let NERDTreeShowHidden=1

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
  "For Neovim >0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
    set termguicolors
endif

" NORMAL MODE REMAPS
nnoremap <C-y> <C-y>k
nnoremap <C-e> <C-e>j
nnoremap <Up>        <C-W>k
nnoremap <Down>      <C-W>j
nnoremap <Left>      <C-W>h
nnoremap <Right>     <C-W>l
nnoremap <Tab> :NERDTreeToggle<CR>
nnoremap <S-Tab> :NERDTreeFind<CR>
nnoremap <F6> :sp<CR>:terminal<CR>
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>rn <Plug>(coc-rename)
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
nmap <C-P> :Files<CR>

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Visual mode remappings
vmap <leader>f  <Plug>(coc-format-selected)

" INSERT MODE REMAPS
inoremap <S-Tab> <C-d>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" TERMINAL MODE REMAPS
tnoremap <Esc> <C-\><C-n>

filetype plugin indent on
syntax on
colorscheme dracula 
