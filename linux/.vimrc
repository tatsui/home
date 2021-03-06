" install NeoBundle
if !isdirectory(expand('~/.vim/bundle'))
	!mkdir -p ~/.vim/bundle
	!git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
	source ~/.vimrc
	NeoBundleInstall
	q
endif
if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
	call neobundle#begin(expand('~/.vim/bundle/'))
	NeoBundleFetch 'Shougo/neobundle.vim'
	call neobundle#end()
endif

" Neobundle.vim
"
call neobundle#begin(expand('~/.vim/bundle/'))
" essential
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neobundle'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Sixeight/unite-grep'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'ujihisa/vimshell-ssh'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'kana/vim-smartchr'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'mattn/gist-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'othree/eregex.vim'
NeoBundle 'vim-scripts/LogViewer'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'gregsexton/gitv'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'vim-scripts/YankRing.vim'
NeoBundle 'vim-scripts/sudo.vim'
NeoBundle 'mattn/sonictemplate-vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'thinca/vim-ref'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'rbtnn/rabbit-ui.vim'
"speed up
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 't9md/vim-quickhl'
NeoBundle 'jceb/vim-hier'

"Language
NeoBundle 'vim-scripts/Pydiction'
NeoBundle 'Shougo/neocomplcache-rsense.vim'


call neobundle#end()

" init
let OsType = system('uname')

" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
	set conceallevel=2 concealcursor=i
endif
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets, ~/.vim/bundle/my-misc.vim/snippets'
" <TAB>: completion.                                         
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"   
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>" 


" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 10
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
au BufNewFile,BufRead *.log set filetype=messages
au BufNewFile,BufRead *.tex set filetype=latex
au BufNewFile,BufRead *.conf set filetype=txt
au BufNewFile,BufRead *.txt set filetype=txt
au BufNewFile,BufRead Makefile set filetype=make
let g:neocomplcache_dictionary_filetype_lists = {
	\ 'default' : '',
	\ 'c' : $HOME.'/.vim/bundle/my-misc.vim/dict/c.dict',
	\ 'cpp' : $HOME.'/.vim/bundle/my-misc.vim/dict/cpp.dict',
	\ 'php' : $HOME.'/.vim/bundle/my-misc.vim/dict/php.dict',
	\ 'txt' : $HOME.'/.vim/bundle/my-misc.vim/dict/en.dict',
	\ 'latex' : $HOME.'/.vim/bundle/my-misc.vim/dict/tex.dict',
	\ 'lua' : $HOME.'/.vim/bundle/my-misc.vim/dict/lua.dict',
	\ 'java' : $HOME.'/.vim/bundle/my-misc.vim/dict/java.dict',
	\ 'javascript' : $HOME.'/.vim/bundle/my-misc.vim/dict/javascript.dict',
	\ 'html' : $HOME.'/.vim/bundle/my-misc.vim/dict/javascript.dict',
	\ 'scheme' : $HOME.'/.vim/bundle/my-misc.vim/dict/scheme.dict',
	\ 'ocaml' : $HOME.'/.vim/bundle/my-misc.vim/dict/ocaml.dict',
	\ 'scala' : $HOME.'/.vim/bundle/my-misc.vim/dict/scala.dict',
	\ 'perl' : $HOME.'/.vim/bundle/my-misc.vim/dict/perl.dict',
	\ 'vimshell' : $HOME.'/.vimshell_hist'
	\ }

" 頻度による並び替え
let g:NeoComplCache_AlphabeticalOrder=1
if !exists('g:neocomplcache_keyword_patterns')
	let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
 "return neocomplcache#smart_close_popup() . "\<CR>"
 " For no inserting <CR> key.
	return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
	let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" Enable omni completion.
au FileType css setlocal omnifunc=csscomplete#CompleteCSS
au FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
au FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
au FileType python setlocal omnifunc=pythoncomplete#Complete
au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Filetype
au FileType java call FileTypeJava()
au FileType python call FileTypePython()
au FileType javascript call FileTypeJavaScript()
au FileType git :setlocal foldlevel=99

" ctags
let tail = &filetype
let g:tagbar_ctags_bin = 'ctags'
set tags+=tags;./**/tags

"Filetype function
function FileTypeJavaScript()
	" DOMとMozilla関連とES6のメソッドを補完
	let g:jscomplete_use = ['dom', 'moz', 'es6th']
endfunction
function FileTypeJava()
	setl omnifunc=javaapi#complete
	if has("balloon_eval") && has("balloon_multiline") 
		setl bexpr=javaapi#balloon()
		setl ballooneval
	endif
	let g:javaapi#delay_dirs = [
		\ 'java-api-javax',
		\ 'java-api-org',
		\ 'java-api-sun',
		\ 'java-api-servlet2.3',
		\ 'java-api-android',
		\ ]
	"setl tags+=~/.vim/tags/android
endfunction
function FileTypePython()
	let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'
	let g:pydiction_menu_height = 20
endfunction


" キーマップ
" Fn
inoremap <F1> <ESC>
nnoremap <F2> :VimFiler -simple -split -winwidth=20 -toggle -no-quit<Cr>
nnoremap <F3> :tabe<Cr>
nnoremap <F4> :tabc<Cr>
silent! nmap <unique> <F5> <Plug>(quickrun)
noremap <F6> :!make clean;make run<CR>
noremap <F7> :TagbarToggle<CR>
noremap <F8> :YRGetElem<cr>
noremap <F12> :sp<cr><c-w><c-w>:VimShell<cr>
" Space

" <Space>m でカーソル下の単語、もしくは選択した範囲のハイライトを行う
" 再度 <Space>m を行うとカーソル下のハイライトを解除する
" これは複数の単語のハイライトを行う事もできる
" <Space>M で全てのハイライトを解除する
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)


" Leader \
nnoremap <silent><Leader>w3 :<C-u>W3mTab google<CR>
nnoremap <silent><Leader>tag :!ctags -R<CR>
nnoremap <silent><Leader>json :%!python -m json.tool<CR>
nnoremap <silent><Leader>tw :<CR>:<C-u>tabnew <Bar> TweetVimUserStream<CR>
nnoremap <silent><Leader>sh :<C-u>tabnew <Bar> VimShell<CR>
nnoremap <silent> pp "0p<CR>
vnoremap <silent> pp "0p<CR>
vnoremap <silent> grep y:vimgrep /<C-R>"/j **/*<CR>:cw<CR>
vnoremap <silent> log y:%v/^.*<C-R>".*$/d<CR>
vnoremap <silent> nlog y:%g/^.*<C-R>".*$/d<CR>
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle



" plugin settings
"
" sonictemplate
let g:sonictemplate_vim_template_dir = [
  \ '~/.vim/bundle/sonictemplate-vim/template',
  \ '~/.vim/bundle/my-misc.vim/templates'
  \]

" open-browser.vim
nmap <silent><Leader>opb <Plug>(openbrowser-open)

" easymotion
" ホームポジションに近いキーを使う
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
let g:EasyMotion_leader_key=";"
let g:EasyMotion_grouping=1 " ストローク選択を優先する
" カラー設定変更
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade ctermbg=none ctermfg=blue

" vimshell
let g:vimshell_prompt_expr = 'getcwd()." $ "'
let g:vimshell_prompt_pattern = '^\f\+ $ '

" YankRing.vim
let g:yankring_history_dir = '~/.vim/'

" QuickRun.vim
let g:quickrun_config = {
			\ "_" : { 'outputter/buffer/split': ':botright 5sp',},}

let g:quickrun_config['markdown'] = {
      \   'outputter': 'browser'
      \ }
let g:quickrun_config.json = {
      \ 'command'   : 'jq',
      \ 'exec'      : "%c '.' %s"
      \ }
" vimfiler
let g:vimfiler_safe_mode_by_default = 0
au! FileType vimfiler call s:my_vimfiler_settings()
function! s:my_vimfiler_settings()
	nnoremap <buffer><expr><Cr> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
	nnoremap <buffer>s :call vimfiler#mappings#do_action('my_split')<Cr>
	nnoremap <buffer>v :call vimfiler#mappings#do_action('my_vsplit')<Cr>
endfunction

" lightline.vim
let g:lightline = {
	\ 'colorscheme': 'landscape',
	\ 'mode_map': {'c': 'NORMAL'},
	\ 'active': {
	\ 'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
	\ },
	\ 'component_function': {
	\ 'modified': 'MyModified',
	\ 'readonly': 'MyReadonly',
	\ 'fugitive': 'MyFugitive',
	\ 'filename': 'MyFilename',
	\ 'fileformat': 'MyFileformat',
	\ 'filetype': 'MyFiletype',
	\ 'fileencoding': 'MyFileencoding',
	\ 'mode': 'MyMode'
	\ }
	\ }
function! MyModified()
	return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction
function! MyReadonly()
	return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction
function! MyFilename()
	return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
		\ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
		\ &ft == 'unite' ? unite#get_status_string() :
		\ &ft == 'vimshell' ? vimshell#get_status_string() :
		\ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
		\ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction
function! MyFugitive()
	try
		if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
			return fugitive#head()
		endif
	catch
	endtry
	return ''
endfunction
function! MyFileformat()
	return winwidth(0) > 70 ? &fileformat : ''
endfunction
function! MyFiletype()
	return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction
function! MyFileencoding()
	return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction
function! MyMode()
	return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" 環境設定
set autoindent
set smartindent
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,sjis
set ff=unix "改行をUNIX形式に
set noswapfile "スワップファイルを作らない
set nocompatible "viとの互換モードをOFF
set number "行番号を表示する
set mouse=a "マウスで選択できるようにする
set ttymouse=xterm2
set autoindent "オートインデントする
set incsearch "インクリメンタルサーチ
set showmatch "対応する括弧のハイライト表示する
set showmode "モード表示する
set title "編集中のファイル名を表示する
set ruler "ルーラーの表示する
set tabstop=4 "タブ文字数を4にする
set modifiable
set write
set list
set listchars=tab:»\ ,eol:↩ "改行とtabの表示
set shiftwidth=4
set title
set laststatus=2
set showcmd
set display=lastline
set clipboard=unnamedplus,unnamed,autoselect
set nobackup
set nocursorline
set noexpandtab
set hlsearch
retab 4
au InsertEnter,InsertLeave * set cursorline!
filetype plugin indent on 
syntax on
"バイナリ編集モード（vim -b での起動、もしくは *.bin ファイルを開くと発動します）
augroup BinaryXXD
	autocmd!
	autocmd BufReadPre  *.bin let &binary =1
	autocmd BufReadPost * if &bin | Vinarise
	autocmd BufWritePre * if &bin | Vinarise | endif
	autocmd BufWritePost * if &bin | Vinarise 
augroup END
