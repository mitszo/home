syntax on

" id:tasukuchan
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
autocmd WinEnter * match WhitespaceEOL /\s\+$/

set enc=utf-8
set fencs=utf-8,euc-jp,cp932

filetype on
filetype plugin on
filetype indent on

set ignorecase
set smartcase
set tabstop=2
set expandtab
set shiftwidth=2
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

" QuickBuf: qbuf.vim
let g:qb_hotkey = ";;"

let Grep_Shell_Quote_Char = '"'
let Grep_Skip_Dirs = '.svn'
let Grep_Skip_Files = '*.bak *~'

set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

" Space, Shift+Space でバッファを切り替え
noremap <Space> :bnext<CR>
noremap <S-Space> :bprev<CR>

" processing.vim
let processing_doc_path="/Applications/Processing.app/Contents/Resources/Java/reference/"

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
hi WhitespaceEOL ctermbg=Yellow
match WhitespaceEOL /\s\+$/
