"Vim plug
call plug#begin('~/.vim/pluggs')

Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'psf/black', { 'branch': 'stable' }
"Plug 'xuhdev/vim-latex-live-preview'
"Plug 'https://tpope.io/vim/surround.git'

call plug#end()



" No mouse stuff
"set mouse=
" mouse setting for gvim
set mousemodel=popup

" Sets how many lines of history VIM has to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread

" syntax enable
set encoding=utf8
set nocompatible

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4

set ai "Auto indent
set si "Smart indent
" set wrap "Wrap lines
set nowrap

" Always show the status line
set laststatus=2

set wildmenu
set wildmode=longest,list,full

" show line numbers
set number

" Show tabs when using :set list
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

" Easy switching between buffers
:nnoremap <F5> :buffers<CR>:buffer<Space>

" status line from: http://stackoverflow.com/questions/5375240/a-more-useful-statusline-in-vim
set statusline=
set statusline+=%7*\[%n]                                  "buffernr
set statusline+=%1*\ %<%F\                                "File+path
set statusline+=%2*\ %y\                                  "FileType
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..) 
set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "Spellanguage & Highlight on?
set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
set statusline+=%9*\ col:%03c\                            "Colnr
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot

function! HighlightSearch()
  if &hls
    return 'H'
  else
    return ''
  endif
endfunction

hi User1 ctermfg=white  ctermbg=4
hi User2 ctermfg=white  ctermbg=4
hi User3 ctermfg=white  ctermbg=4
hi User4 ctermfg=white  ctermbg=4
hi User5 ctermfg=white  ctermbg=4
hi User7 ctermfg=white  ctermbg=4
hi User8 ctermfg=white  ctermbg=4
hi User9 ctermfg=white  ctermbg=4
hi User0 ctermfg=white  ctermbg=4


map <F7> :if exists("g:syntax_on") <Bar>
    \ syntax off <Bar>
    \ else <Bar>
    \ syntax enable <Bar>
    \ endif <CR>

"Improve encryption
"http://invert.svbtle.com/using-vim-as-a-password-manager

set cm=blowfish2

" Learn vimscript the hard way
" abbreviations:
"   :iabbrev adn and
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>
:inoremap jk <esc>
:nnoremap <leader>dt :read !date -R<cr>


function! EditText()
    " Locale for spelling
    if &spell
        setlocal nospell
    else
        setlocal spell spelllang=en_ca
    endif
    set lbr!
    set tw=70
    set wrap
endfunction

:nnoremap <F8> :call EditText()<CR> 

" https://vim.fandom.com/wiki/Insert_current_date_or_time
" F5 to insert date
" nnoremap <F5> "=strftime("%c")<CR>P
" inoremap <F5> <C-R>=strftime("%c")<CR>


