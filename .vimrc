"------------プラグイン関係-------------------------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" 導入したいプラグインを以下に列挙
" Plugin '[Github Author]/[Github repo]' の形式で記入
Plugin 'vim-jp/vim-cpp'
Plugin 'thinca/vim-quickrun'

call vundle#end()
filetype plugin indent on

"　その他のカスタム設定を以下に書く

"--------------QuickRunの設定-----------------------
" g:quickrun_config の初期化
if !exists("g:quickrun_config")
    let g:quickrun_config={}
endif

let g:quickrun_config.cpp = {
\   'command': 'g++',
\   'cmdopt': '-std=c++14 -Wall',
\   'hook/time/enable' : 1
\ }

"--------------操作系-------------------------------
" バックスペースを有効にする
set backspace=indent,eol,start

" マウス操作を有効にする
set mouse=a

" スクロールの余裕を確保する
set scrolloff=3

" カーソル移動を表示行単位で行う
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Yを行末までのヤンクにする
nnoremap Y y$

" 行末の一文字先までカーソルを移動できるようにする
set virtualedit=onemore

" インサートモードでjjと入力した時はescとみなす
inoremap jj <Esc>

" クリップボードを使えるようにする
set clipboard+=unnamed

"--------------タブ系-----------------------------------
" タブ、インデントの設定
set expandtab     " タブの代わりに空白を使う
set tabstop=4     " タブの幅
set shiftwidth=4  " 自動インデントでずれる幅
set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅（デフォルトでは無効: 0）
set autoindent    " 改行時に前の行のインデントを継続する
set smartindent   " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する

"--------------検索系----------------------------------
" 検索機能
set ignorecase " 大文字小文字を無視
set smartcase  " ignorecaseと合わせることで，小文字入力の時のみ大文字小文字を無視
set incsearch  " インクリメンタルサーチ
set hlsearch   " 検索結果をハイライト
nnoremap <silent> <ESC><ESC> :nohlsearch<CR> " ESCキー連打でハイライトを消す

" Escのディレイを解消
if !has('gui_running')
    set timeout timeoutlen=1000 ttimeoutlen=50
endif

"--------------編集系-----------------------------------
" 保存時に行末の余計な空白を削除する
autocmd BufWritePre * :%s/\s\+$//ge

" インサートモードに入るときに自動でコメントアウトされないようにする
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" コマンドラインの補完
set wildmode=list:longest

" 置換の際のgオプションをデフォルトで有効化する
set gdefault

"--------------見た目系----------------------------------
" 行番号を表示
set number

" 現在の行と列を強調表示
set cursorline
set cursorcolumn

" iTerm2やtmuxでもインサートモード時のカーソルの形状を変化させる
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" シンタックスハイライトの有効化
syntax enable




