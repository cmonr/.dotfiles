"Set Transparency in VIM
silent !transset-df -a 0.9 &>/dev/null

"Turn all tabs to spaces
set expandtab

"Insert # of spaces in replacement of tab
set tabstop=2

"Enable smartindent
set smartindent
set autoindent

"Set tab space
set shiftwidth=2

"Show line numbers
set number

"Set status line info
"set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%|/%L\ (%p%%)]

"Enable indent folding
"set foldenable
"set fdm=indent

"Use 256 colors
"set t_Co=256

"Define colorscheme
color wombat256

"VIM instead of VI
set nocompatible

"Turn on syntax highlighting
syntax on

"Highlight search terms
set hlsearch

"Clear last search term by pressing <esc>
noremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

"Easier Tab Navigation
set showtabline=2
noremap <C-tab> :tabnext <CR>
noremap <C-S-tab> :tabprevious <CR>

"Immediately start showing search results
set incsearch

"Enable filetype detection
filetype indent on

"Show matching ()[]...
set showmatch

"Will save a file as root if needed
cmap w!! %!sudo tee > /dev/null %

"Allow mouse scrollwheel to scroll
set mouse=a

"Enable external clipboard
set clipboard=unnamed

"Paste from System Clipboard (!!!)
fun! <SID>PasteFromSystem()
  set paste
  call feedkeys("i",'t')
  call feedkeys("\<S-MiddleMouse>",'t')
  set nopaste
endfun

"nnoremap <MiddleMouse> :call <SID>PasteFromSystem() <CR>

"Autoremove whitespace
fun! <SID>StripTrailingWhiteSpaces()
  let pos = getpos(".")
  %s/\s\+$//e
  call setpos(".", pos)
endfun

autocmd BufWritePre *.[^conky]* :call <SID>StripTrailingWhiteSpaces()
