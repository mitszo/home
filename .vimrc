syntax on
set nocompatible " be iMproved
filetype off

" setup Vundle.
" $ git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
"
" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'mattn/zencoding-vim'
" vim-scripts repos
Bundle 'QuickBuf'
Bundle 'grep.vim'
Bundle 'surround.vim'
Bundle 'The-NERD-Commenter'

let mapleader = ','

set enc=utf-8
set fencs=utf-8,euc-jp,cp932

filetype on
filetype plugin on
filetype indent on

set ignorecase
set smartcase
set tabstop=4
set expandtab
set shiftwidth=4
set autoindent
set backspace=2
set wrapscan
set showmatch
set incsearch
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM
" 日本語整形スクリプト(by. 西岡拓洋さん)用の設定
let format_allow_over_tw = 1	" ぶら下り可能幅
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif
set hidden
set nonumber
set ruler
set smartindent
set listchars=tab:>-,extends:<,trail:-,eol:<
set wrap
set laststatus=2
set cmdheight=2
set showcmd
set title
set noswapfile
set nobackup

set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

" colorscheme
syntax enable
hi Comment ctermfg=Red cterm=NONE
hi LineNr ctermfg=Cyan cterm=NONE
hi StatusLine cterm=bold,reverse ctermfg=Black ctermbg=Green cterm=NONE
hi StatusLineNC cterm=reverse ctermfg=White ctermbg=Black
hi VertSplit ctermfg=Black ctermbg=Green
hi Directory ctermfg=Cyan cterm=underline
hi Folded ctermfg=Magenta ctermbg=Black guifg=Magenta guibg=Black cterm=NONE gui=NONE
hi Search ctermfg=White ctermbg=Blue guifg=White guibg=Blue cterm=underline gui=underline
hi Pmenu ctermfg=White ctermbg=Magenta
hi PmenuSel cterm=bold,underline ctermfg=White ctermbg=Red

" id:tasukuchan
highlight WhitespaceEOL ctermbg=Yellow guibg=Yellow
match WhitespaceEOL /\s\+$/
autocmd WinEnter * match WhitespaceEOL /\s\+$/

" QuickBuf: qbuf.vim
let g:qb_hotkey = ";;"

let Grep_Shell_Quote_Char = '"'
let Grep_Skip_Dirs = '.svn .git .hg'
let Grep_Skip_Files = '*.bak *~'

" zen-coding
let g:user_zen_expandabbr_key = '<c-x>,'

function! s:Exec()
    exe "!" . &ft . " %"
:endfunction
command! Exec call <SID>Exec()
map <silent> <C-P> :call <SID>Exec()<CR>

noremap <Space> :bnext<CR>
noremap <S-Space> :bprev<CR>
