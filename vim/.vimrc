set et
set smarttab
set smartindent
set lbr
set fo+=mB
set sm
set selection=inclusive
set wildmenu
set mousemodel=popup
set t_Co=256
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 显示相关  
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set shortmess=atI   " 启动的时候不显示那个援助乌干达儿童的提示  
set go=             " 不要图形按钮  
set guifont=Courier_New:h40:cANSI   " 设置字体  
set showcmd         " 输入的命令显示出来，看的清楚些  
set scrolloff=10     " 光标移动到buffer的顶部和底部时保持3行距离  
set foldenable      " 允许折叠  
set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限  
set autoindent
set cindent
" Tab键的宽度
set tabstop=2
" 统一缩进为4
set shiftwidth=2
set tabstop=2
au FileType python setl sw=2 sts=2 et
" 不要用空格代替制表符
set expandtab
" 在行和段开始处使用制表符
set smarttab
" 显示行号
set number
" 历史记录数
set history=1000
"搜索逐字符高亮
set hlsearch
set incsearch
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
" 总是显示状态行
set cmdheight=2
" 侦测文件类型
filetype on
" 载入文件类型插件
filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on
" 保存全局变量
set viminfo+=!
"将tab替换为空格
nmap tt :%s/\t/    /g<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""新文件标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh' 
        call setline(1,"\#!/bin/bash") 
        call append(line("."), "cd \"$(dirname \"$0\")\"") 
    elseif &filetype == 'python'
        call setline(1,"#-*- coding: utf-8 -*-")
        call append(line("."),"#File: ".expand("%"))
        call append(line(".")+1, "")

    else 
        call setline(1, "/*************************************************************************") 
        call append(line("."), "    > File Name: ".expand("%")) 
        call append(line(".")+1, "    > Author:") 
        call append(line(".")+2, "    > Mail: ") 
        call append(line(".")+3, "    > Created Time: ".strftime("%c")) 
        call append(line(".")+4, "    > Usage: ")
        call append(line(".")+5, " ************************************************************************/") 
        call append(line(".")+6, "")
    endif
    if expand("%:e") == 'cpp'
        call append(line(".")+7, "#include<iostream>")
        call append(line(".")+8, "using namespace std;")
        call append(line(".")+9, "")
    endif
    if &filetype == 'c'
        call append(line(".")+7, "#include<stdio.h>")
        call append(line(".")+8, "")
    endif
    if expand("%:e") == 'h'
        call append(line(".")+7, "#ifndef _".toupper(expand("%:r"))."_H")
        call append(line(".")+8, "#define _".toupper(expand("%:r"))."_H")
        call append(line(".")+9, "#endif")
    endif
    "新建文件后，自动定位到文件末尾
endfunc 
autocmd BufNewFile * normal G


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"键盘命令
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=

"自动保存
set autowrite
set magic                   " 设置魔术
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
" 不要使用vi的键盘模式，而是vim自己的
set nocompatible
" 去掉输入错误的提示声音
set noeb
" 在处理未保存或只读文件的时候，弹出确认
set confirm
"禁止生成临时文件
set nobackup
set noswapfile
"搜索忽略大小写
set ignorecase




set linespace=0
" 增强模式中的命令行自动完成操作
set wildmenu
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l
set selection=exclusive
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3
" 为C程序提供自动缩进
filetype plugin indent on 

set iskeyword+=.
set termencoding=utf8
set encoding=utf8
set fileencodings=utf8,ucs-bom,utf8,cp936,gb2312,gb18030
"set rtp+=/Users/baidu/.vim/bundle/vundle/
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" My Bundles here:
Bundle 'altercation/vim-colors-solarized'
Bundle 'Auto-Pairs'
Bundle 'ctrlp.vim'
Bundle 'Yggdroot/indentLine'
Bundle "vim-airline/vim-airline"
Bundle "vim-airline/vim-airline-themes"
"Bundle 'kevinw/pyflakes-vim'
Bundle 'Konfekt/FastFold'
Bundle 'bundle/vundle'
Bundle 'Valloric/YouCompleteMe'

filetype plugin indent on     " required!
let NERDTreeIgnore=['\.pyc']
"配色
"set background=dark
let g:solarized_termcolors=256
set background=light
"colorscheme solarized
colorscheme Tomorrow
"colorscheme molokai

if &bg == "dark" "根据你的背景色风格来设置不同的书签颜色
  highlight SignColor ctermfg=white ctermbg=blue guifg=wheat guibg=peru
 else             "主要就是修改guibg的值来设置书签的颜色
   highlight SignColor ctermbg=white ctermfg=blue guibg=grey guifg=RoyalBlue3
  endif
"vim-airline 配置
set laststatus=2

let g:airline_section_c = airline#section#create(['%{getcwd()}/', '%{@%}'])
let g:airline_section_x = 'yobobobo'
let g:airline_section_y = '恐惧比利剑更伤人'
"let g:airline_section_y = 'it is time to say goodbye，my old friend.'
let g:jedi#use_tabs_not_buffers = 1
let g:airline#extensions#whitespace#enabled = 0

"补全
autocmd FileType python setlocal completeopt-=preview

let g:acp_enableAtStartup = 0

" Define keyword.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
let g:pymode_lint_checkers = ['pyflakes']



nmap <Space> i_<Esc>r

"pycheck
let g:pyflakes_use_quickfix = 0 
set guifont=Source\ Code\ Pro\ for\ Powerline:h14
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'luna'
"let g:airline_theme="wombat"
let g:airline_theme="light"
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '❯'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '❮'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
" disable preview window when autocomplete
set completeopt-=preview
"let g:loaded_youcompleteme = 1 
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
"let g:ycm_always_populate_location_list = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_filepath_completion_use_working_dir = 1
let g:ycm_disable_for_files_larger_than_kb = 10000
let g:ycm_min_num_of_chars_for_completion=3
" press \jd will go to definition of functions
nnoremap <leader>jd :YcmCompleter GoTo<CR>
" not recompile the source, so GotoImprecise is faster than GoTo
nnoremap <leader>ji :YcmCompleter GoToImprecise<CR>
" <C-Space> force trigger of popup completion
nmap <Space> i_<Esc>r
set shortmess+=c

"pycheck
let g:pyflakes_use_quickfix = 0
set undofile
