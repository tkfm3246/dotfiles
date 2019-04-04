set ignorecase
set hlsearch
set number
syntax on
set tabstop=4
set t_Co=256
set background=dark
colorscheme molokai

" insert mode
imap <C-p> <Up>
imap <C-n> <Down>
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-a> <C-o>:call <SID>home()<CR>
imap <C-e> <End>
imap <C-d> <Del>
imap <C-h> <BS>
imap <C-k> <C-r>=<SID>kill()<CR>

function! s:home()
  let start_column = col('.')
  normal! ^
  if col('.') == start_column
    normal! 0
  endif
  return ''
endfunction

function! s:kill()
  let [text_before, text_after] = s:split_line()
  if len(text_after) == 0
    normal! J
  else
    call setline(line('.'), text_before)
  endif
  return ''
endfunction

function! s:split_line()
  let line_text = getline(line('.'))
  let text_after  = line_text[col('.')-1 :]
  let text_before = (col('.') > 1) ? line_text[: col('.')-2] : ''
  return [text_before, text_after]
endfunction

autocmd BufRead,BufNewFile *.py setfiletype python
autocmd FileType python setlocal completeopt-=preview

" Status line
let g:lightline = {}
let g:lightline.colorscheme = 'molokai'
set laststatus=2

"dein
if &compatible
  set nocompatible               " Be iMproved
endif

let s:dein_dir = expand('~/.config/nvim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
        call dein#begin(s:dein_dir)
        let s:toml_dir = expand('~/.config/nvim/dein/userconfig')

        " 起動時に読み込むプラグイン
        call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})

        " 遅延読み込みしたいプラグイン
        call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})

        call dein#end()
        call dein#save_state()
endif

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
