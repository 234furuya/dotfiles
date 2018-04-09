" vi互換ではなくVimのデフォルト設定にする
" set nocompatible

" 一旦ファイルタイプを無効化
" filetype off

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
 set runtimepath+=/home/vagrant/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/vagrant/.cache/dein')
  call dein#begin('/home/vagrant/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/vagrant/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  call dein#add('fukajun/nerdtree')
  call dein#add('Shougo/neocomplcache')
  call dein#add('scrooloose/syntastic')

  call dein#add('kchmck/vim-coffee-script')

  " Required:
  call dein#end()
  call dein#save_state()
  endif

  " Required:
  filetype plugin indent on
  syntax enable

  " If you want to install not installed plugins on startup.
  if dein#check_install()
    call dein#install()
  endif
"End dein Scripts-------------------------

set t_Co=256

" 環境設定系
" シンタックスハイライト
syntax enable

colorscheme desert

" エンコード
set encoding=utf8
" ファイルエンコード
set fileencoding=utf-8
" スクロールする時に下が見えるようにする
set scrolloff=5
" .swapファイルを作らない
set noswapfile
" バックアップファイルを作らない
set nowritebackup
" バックアップをしない
set nobackup
" バックスペースで各種消せるようにする
set backspace=indent,eol,start

" OSのクリップボードを使う
set clipboard+=unnamed
set clipboard=unnamed
" 不可視文字を表示
set list
" 行番号を表示
set number
" 右下に表示される行・列の番号を表示する
set ruler
" 移動コマンドを使ったとき、行頭に移動しない
set nostartofline
" 対応括弧に<と>のペアを追加
set matchpairs& matchpairs+=<:>
" 対応括弧をハイライト表示する
set showmatch
" ウィンドウの幅より長い行は折り返され、次の行に続けて表示される
set wrap
" 入力されているテキストの最大幅を無効にする
set textwidth=0
" 不可視文字を表示
set listchars=tab:>-,trail:-,extends:>,precedes:<,nbsp:%
" インデントをshiftwidthの倍数に丸める
set shiftround
" 補完の際の大文字小文字の区別しない
set infercase
" 文字がない場所にもカーソルを移動できるようにする
set virtualedit=all
" 変更中のファイルでも、保存しないで他のファイルを表示
" set hidden
" 新しく開く代わりにすでに開いてあるバッファを開く
set switchbuf=useopen
" 小文字の検索でも大文字も見つかるようにする
set ignorecase
" ただし大文字も含めた検索の場合はその通りに検索する
set smartcase
" インクリメンタルサーチを行う
set incsearch
" 検索結果をハイライト表示
:set hlsearch
" コマンド、検索パターンを10000個まで履歴に残す
set history=10000
" マウスモード有効
" set mouse=a
" xtermとscreen対応
set ttymouse=xterm2
" ステータスラインを常に表示
set laststatus=2
" コマンドを画面最下部に表示する
set showcmd
"" ステータスラインに文字コードと改行文字を表示する
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" 入力モード中に素早くJJと入力した場合はESCとみなす
inoremap jj <Esc>

" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk
" vを二回で行末まで選択
vnoremap v $h
" TABにて対応ペアにジャンプ
nnoremap &lt;Tab&gt; %
vnoremap &lt;Tab&gt; %
" NERDTreeをショートカット起動
nmap <silent> <C-e>      :NERDTreeToggle<CR>
vmap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
omap <silent> <C-e>      :NERDTreeToggle<CR>
imap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
cmap <silent> <C-e> <C-u>:NERDTreeToggle<CR>

" 入力モード中に素早くqqと押すとシングルクォーテーション
inoremap qq '
" 入力モード中に素早くwqと押すとダブルクォーテーション
inoremap wq "

" Ruby用設定
" :makeでRuby構文チェック
au FileType ruby setlocal makeprg=ruby\ -c\ %
au FileType ruby setlocal errorformat=%m\ in\ %f\ on\ line\ %l

" Scala用設定
" ファイルタイプの追加
augroup filetypedetect
autocmd! BufNewFile,BufRead *.scala setfiletype scala
autocmd! BufNewFile,BufRead *.sbt setfiletype scala
augroup END
autocmd BufWritePost *.php silent make | if len(getqflist()) != 1 | copen | else | cclose | endif

" CoffeeScript用設定
" vimにcoffeeファイルタイプを認識させる
au BufRead,BufNewFile,BufReadPre *.coffee set filetype=coffee
" インデントを設定
autocmd FileType coffee setlocal sw=2 sts=2 ts=2 et

" JQueryシンタックス
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

set expandtab "タブ入力を複数の空白入力に置き換える
set tabstop=2 "画面上でタブ文字が占める幅
set shiftwidth=2 "自動インデントでずれる幅
set softtabstop=2 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent "改行時に前の行のインデントを継続する
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set paste "ペースト時の改行を抑止

" 文末の余計な空白を保存時に取り除く
" autocmd BufWritePre * :%s/\s\+$//ge

" necomplache(自動補完ツール)の設定
" 起動時に自動で起動
let g:neocomplcache_enable_at_startup = 1
" 大文字小文字の区別を無視
let g:neocomplcache_enable_smart_case = 1
" スネークケース補完有効化
let g:neocomplcache_enable_underbar_completion = 1

