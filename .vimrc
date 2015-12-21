
" エンコード指定
scriptencoding utf-8

" インデント系
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" オートインデント
set autoindent

" (Win)パス区切りをスラッシュに
set shellslash

" 余裕をもってスクロール
set scrolloff=5

" delete key 有効
set backspace=indent,eol,start

" 行末から行頭まで移動可能に
set whichwrap+=h,l,<,>,[,],b,s

" swapファイルを作成しないように設定
set noswapfile

" 行を表示
set number

" 編集中のファイル名を表示
set title

" カーソル行の強調
set cursorline

" 検索文字列をハイライトする
set hlsearch

" .cpp .hpp .h .sln .csproj での折り返し無効
autocmd BufRead,BufNewFile *.cpp    set nowrap
autocmd BufRead,BufNewFile *.hpp    set nowrap
autocmd BufRead,BufNewFile *.h      set nowrap
autocmd BufRead,BufNewFile *.sln    set nowrap
autocmd BufRead,BufNewFile *.csproj set nowrap

" NeoBundleを有効にする
if has('vim_starting')
  if &compatible
    set nocompatible
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" NeoBundleを更新させる
NeoBundleFetch 'Shougo/neobundle.vim'

" 補完
NeoBundle 'Valloric/YouCompleteMe', {
        \ 'build' : {
        \ 'mac' : './install.sh --clang-completer',
        \ 'unix' : './install.sh --clang-completer',
        \ }
        \ }

" 補完ファイルの設定
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" 変更されたら読み込む
let g:ycm_confirm_extra_conf = 0

" Tree
NeoBundle 'scrooloose/nerdtree'

" syntastic
NeoBundle 'scrooloose/syntastic'

" Wandbox
NeoBundle 'rhysd/wandbox-vim'

call neobundle#end()

" カラースキーマ
colorscheme desert
syntax enable

" 色設定
hi Comment ctermfg=248
