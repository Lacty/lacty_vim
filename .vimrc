
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

" C++の設定
function! s:cpp()
  " インクルードパスなどを指定
  setlocal path+=/usr/include,/usr/local/include,/usr/lib/c++14,/usr/include/c++/4.9.2,/usr/include/c++/4.9

  " 括弧を構成する設定に<>を追加
  setlocal matchpairs+=<:>
endfunction

augroup vimrc-cpp
  autocmd!
  " filetype=cppが設定されてた場合に関数を呼ぶ
  autocmd FileType cpp call s:cpp()
augroup END

" 標準ライブラリへのパスを指定
let $CPP_STDLIB = "/usr/include/c++/4.9.2"

augroup vimrc-set_filetype_cpp
  autocmd!
  " CPP_STDLIBより下の階層のファイルが開かれて
  " filetypeが設定されていなかったらcppとする
  autocmd BufReadPost $CPP_STDLIB/* if empty(&filetype)|set
filetype=cpp|endif
augroup END


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

" Neo補完
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neocomplete.vim'

" スニペット
NeoBundle "Shougo/neosnippet"
NeoBundle "Shougo/neosnippet-snippets"

" Trees
NeoBundle 'scrooloose/nerdtree'

" syntastic
NeoBundle 'scrooloose/syntastic'

" Wandbox
NeoBundle 'rhysd/wandbox-vim'

call neobundle#end()

let g:neocomplete#enable_at_startup = 1
let g:neocomplcache_enable_auto_select = 1

imap <C-s> <Plug>(neosnippet_expand_or_jump)
smap <C-s> <Plug>(neosnippet_expand_or_jump)


" カラースキーマ
colorscheme desert
syntax enable

" 色設定
hi Comment ctermfg=248
