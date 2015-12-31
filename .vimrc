
" エンコード指定
scriptencoding utf-8

" オートインデント
set autoindent
set expandtab

" (Win)パス区切りをスラッシュに
set shellslash

" 余裕をもってスクロール
set scrolloff=3

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

" Neo補完
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neoinclude.vim'

" Clang Omini Complete
NeoBundle 'Rip-Rip/clang_complete'

" スニペット
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

" vimproc
NeoBundle 'Shougo/vimproc', {
    \  'build' : {
		  \ 'unix' : 'make -f make_unix.mak'
	  \	}
  \ }

" Shell
NeoBundle 'Shougo/vimshell.vim'

" Trees
NeoBundle 'scrooloose/nerdtree'

" syntastic
NeoBundle 'scrooloose/syntastic'

" Wandbox
NeoBundle 'rhysd/wandbox-vim'

call neobundle#end()


" neocomplete の設定
let g:neocomplete#enable_at_startup = 1


" setting clang opt
let g:clang_use_library = 1
let g:clang_library_path = '/usr/lib/llvm-3.5/lib'
let g:clang_user_options = '-std=c++14'

" setting neocomplete
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_overwrite_completefunc = 1
let g:neocomplete#force_omni_input_patterns.cpp = 
  \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

" disable auto complete in clang
let g:clang_complete_auto = 0
let g:clang_auto_select = 0


" neosnippet の設定
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" SuperTab like snippets
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "<Plug>(neosnippet_expand_or_jump)>"
  \: "\<TAB>"

" for snippet_complete marker
if has('conceal')
  set conceallevel=2 concealcursor=i
endif


" C++の設定
augroup vimrc-cpp
  " 括弧を構成する設定に<>を追加
  setlocal matchpairs+=<:>

  " set include dir
  setlocal path=/usr/local/include
  
  " Tab系
	set expandtab
  set tabstop=2
	set shiftwidth=2
augroup END

let _curfile=expand("%:t")
if _curfile == 'Makefile'
  set noexpandtab
endif

syntax enable
hi Function guifg=red
