"/**
"+------------------------------------------------------------------------------
"* Linux VIM WEB开发配置文件 
"+------------------------------------------------------------------------------
"* 
"* @package 
"* @version $_SWANBR_VERSION_$
"* @copyright $_SWANBR_COPYRIGHT_$
"* @author $_SWANBR_AUTHOR_$ 
"+------------------------------------------------------------------------------
"*/

" 设置leader为,
let mapleader=","
let g:mapleader=","

" 关闭 vi 兼容模式
set nocompatible

" 自动语法高亮
syntax enable
"背景颜色
set background=dark
" 设定配色方案
"colorscheme darkblue
colorscheme ron

" 检测文件类型
filetype on
" 检测文件类型插件
filetype plugin on
" 不设定在插入状态无法用退格键和 Delete 键删除回车符
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
" 显示行号
set number
" 上下可视行数
set scrolloff=1
" 设定 tab 长度为 4
set tabstop=4
" 设置按BackSpace的时候可以一次删除掉4个空格
set softtabstop=4
" 设定 << 和 >> 命令移动时的宽度为 4
set shiftwidth=4
set smarttab
set history=1024
" 不突出显示当前行
set nocursorline
" 覆盖文件时不备份
set nobackup
" 自动切换当前目录为当前文件所在的目录
set autochdir
" 搜索时忽略大小写，但在有一个或以上大写字母时仍大小写敏感
set ignorecase
set smartcase
" 搜索到文件两端时不重新搜索
set nowrapscan
" 实时搜索
set incsearch
" 搜索时高亮显示被找到的文本
set hlsearch
" 关闭错误声音
set noerrorbells
set novisualbell
set t_vb=

" 不自动换行
"set nowrap
"How many tenths of a second to blink
set mat=2
" 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set hidden
" 智能自动缩进
set smartindent
" 设定命令行的行数为 1
set cmdheight=1
" 显示状态栏 (默认值为 1, 无法显示状态栏)
set laststatus=2
"显示括号配对情况
set showmatch

" 解决自动换行格式下, 如高度在折行之后超过窗口高度结果这一行看不到的问题
set display=lastline

" 设置在状态行显示的信息
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %c:%l/%L%)

" 显示Tab符
"set list
"set listchars=tab:\|\ ,trail:.,extends:>,precedes:<
"启动时不显示 捐赠提示
set shortmess=atl

"blank      空白
"buffers    缓冲区
"curdir     当前目录
"folds      折叠
"help       帮助
"options    选项
"tabpages   选项卡
"winsize    窗口大小
"slash      转换文件路径中的\为/以使session文件兼容unix
"unix       设置session文件中的换行模式为unix
set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,slash,unix,resize


" Alt-W切换自动换行
noremap <a-w> :exe &wrap==1 ? 'set nowrap' : 'set wrap'<cr>

" 选中状态下 Ctrl+c 复制
vnoremap <c-c> "+y

" Shift + Delete 插入系统剪切板中的内容
noremap <S-Del> "+p
inoremap <S-Del> <esc>"+pa
vnoremap <S-Del> d"+P

"设置代码折叠方式为 手工  indent
"set foldmethod=indent
"设置代码块折叠后显示的行数
set foldexpr=1

if has("gui_running")
    set guioptions-=m " 隐藏菜单栏
    set guioptions-=T " 隐藏工具栏
    set guioptions-=L " 隐藏左侧滚动条
    set guioptions-=r " 隐藏右侧滚动条
    set guioptions-=b " 隐藏底部滚动条
    set showtabline=0 " 隐藏Tab栏
endif

" 删除所有行未尾空格
nnoremap <f12> :%s/[ \t\r]\+$//g<cr>

" 窗口切换
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k

" Buffers/Tab操作快捷方式!
"nnoremap <s-h> :bprevious<cr>
"nnoremap <s-l> :bnext<cr>
"nnoremap <s-j> :tabnext<cr>
"nnoremap <s-k> :tabprev<cr>

" 插入模式下上下左右移动光标
inoremap <c-h> <left>
inoremap <c-l> <right>
inoremap <c-j> <c-o>gj
inoremap <c-k> <c-o>gk

"一些不错的映射转换语法（如果在一个文件中混合了不同语言时有用）
nnoremap <leader>1 :set filetype=xhtml<cr>
nnoremap <leader>2 :set filetype=css<cr>
nnoremap <leader>3 :set filetype=javascript<cr>
nnoremap <leader>4 :set filetype=php<cr>

" {{{ 编辑vim配置文件
if has("unix")
    set fileformats=unix,dos,mac
    nmap <leader>e :tabnew $HOME/.vimrc<cr>
    let $VIMFILES = $HOME."/.vim"
else
    set fileformats=dos,unix,mac
    nmap <leader>e :tabnew $VIM/_vimrc<cr>
    let $VIMFILES = $VIM."/vimfiles"
endif
" }}}

" {{{全文搜索选中的文字
vnoremap <silent> <leader>f y/<c-r>=escape(@", "\\/.*$^~[]")<cr><cr>
vnoremap <silent> <leader>F y?<c-r>=escape(@", "\\/.*$^~[]")<cr><cr>
" }}}

" {{{ 折叠配置
set foldenable

" 设置语法折叠
" manual  手工定义折叠
" indent  更多的缩进表示更高级别的折叠
" expr    用表达式来定义折叠
" syntax  用语法高亮来定义折叠
" diff    对没有更改的文本进行折叠
" marker  对文中的标志折叠
set foldmethod=marker

"折叠相关的快捷键
"zR 打开所有的折叠
"za Open/Close (toggle) a folded group of lines.
"zA Open a Closed fold or close and open fold recursively.
"zi 全部 展开/关闭 折叠
"zo 打开 (open) 在光标下的折叠
"zc 关闭 (close) 在光标下的折叠
"zC 循环关闭 (Close) 在光标下的所有折叠
"zM 关闭所有可折叠区域
" 设置折叠区域的宽度

set foldcolumn=2
" 设置折叠层数为
"setlocal foldlevel=1
" 新建的文件，刚打开的文件不折叠
"autocmd! BufNewFile,BufRead * setlocal nofoldenable
" }}}

"{{{设置括号或引号能够自动补全
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
"说明：{在引号中也会换行
":inoremap { {<CR>}<ESC>O
:inoremap { {}<Esc>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i

function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endfunction
"}}}

"{{{设置文件头部描述信息
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.php,*.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()"

"定义函数SetTitle，自动插入文件头 
func SetTitle() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh' 
        call setline(1,"\#################################") 
        call append(line("."), "\# FileName: ".expand("%")) 
        call append(line(".")+1, "\# Author: Faithlee") 
        call append(line(".")+2, "\# Mail: lijiabin098@126.com") 
        call append(line(".")+3, "\# CTime: ".strftime("%c")) 
        call append(line(".")+4, "\###########################") 
        call append(line(".")+5, "\#!/bin/bash") 
        call append(line(".")+6, "") 
        call append(line(".")+7, "")
    endif

	"设置PHP文件头
	if &filetype == 'php'
		call setline(1, "<?php")
        call append(line("."), "/**") 
        call append(line(".")+1, " * @FileName: ".expand("%")) 
		call append(line(".")+2, " * @Desc: ")
        call append(line(".")+3, " * @Author: Faithlee") 
        call append(line(".")+4, " * @Mail: li.jiawei@leftbrain.com.cn") 
        call append(line(".")+5, " * @CTime: ".strftime("%c"))
		call append(line(".")+6, " */")
        call append(line(".")+7, "")
	endif

    if &filetype == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif

    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
        
    "新建文件后，自动定位到文件末尾    
    autocmd BufNewFile * normal G
endfunc 
"}}}

" {{{ 自动注释插件
inoremap <C-\> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-\> :call PhpDocSingle()<CR>
vnoremap <C-\> :call PhpDocRange()<CR>
" }}}

" {{{ plugin - NERD_commenter.vim 注释代码用的，以下映射已写在插件中
map <leader>cc ,c<space>
map <leader>cs ,cs
map <leader>c$ ,c$
map <leader>cu ,cu
" }}}

" {{{ plugin – NERD_tree.vim 以树状方式浏览系统中的文件和目录
" :NERDtree 打开NERD_tree         :NERDtreeClose    关闭NERD_tree
" o 打开关闭文件或者目录         t 在标签页中打开
" T 在后台标签页中打开           ! 执行此文件
" p 到上层目录                   P 到根目录
" K 到第一个节点                 J 到最后一个节点
" u 打开上层目录                 m 显示文件系统菜单（添加、删除、移动操作）
" r 递归刷新当前目录             R 递归刷新当前根目录
" F3 NERDTree 切换
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC>:NERDTreeToggle<CR> 
" }}}

" {{{ plugin - taglist.vim 代码导航

if has("unix")
    let Tlist_Ctags_Cmd = '/usr/bin/ctags'
else
	let Tlist_Ctags_Cmd = '"'.$VIMFILES.'/ctags.exe"'
endif

" 不同时显示多个文件的tag，只显示当前文件的
let Tlist_Show_One_File = 1
" 如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Exit_OnlyWindow = 1
" 在右侧窗口中显示taglist窗口
let Tlist_Use_Right_Window = 0
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Open = 0
let Tlist_Auto_Update = 1
let Tlist_Close_On_Select = 0
let Tlist_Compact_Format = 0
let Tlist_Display_Prototype = 0
let Tlist_Display_Tag_Scope = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_File_Fold_Auto_Close = 0
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Inc_Winwidth = 0
let Tlist_Max_Submenu_Items = 1
let Tlist_Max_Tag_Length = 30
let Tlist_Process_File_Always = 0
let Tlist_Show_Menu = 0
let Tlist_Sort_Type = "order"
let Tlist_Use_Horiz_Window = 0
let Tlist_WinWidth = 31
let tlist_php_settings ='php;c:class;i:interfaces;d:constant;f:function'
nnoremap <Leader>tl :TlistToggle<CR>
let g:ctags_path=$VIMFILES.'/ctags.exe'
let g:ctags_statusline=1
let g:ctags_args=1
" }}}

hi Comment ctermfg=1
hi Comment cterm=NONE

" {{{ cmd
command XC !gcc -o %.o % && ./%.o
command ZC !gcc -o %.o %
command Mk !make %.
" }}}
