"Dustin Li - 20181018

" 檔案編碼:
set encoding=utf-8
set fileencodings=utf-8,cp950
 
" 設定喜好設定:
"set background=dark         " 要在syntax on以前設定好背景色彩, 有colorscheme理應不用設定, 但反正我就是喜歡黑底的scheme沒差

syntax on                   " 語法上色顯示
set nocompatible            " VIM 不使用和 VI 相容的模式 This setting must be first. because it changes other options as a side effect
set ic                      " 設定搜尋忽略大小寫
set ru                      " 顯示右下角狀態列說明, 第幾行第幾個字, 設定statusline時, 無用
set nu                      " 設定行號
set nowrap                  " 關閉自動換行, 建議設為 wrap 時, 搭配set nu使用
set hlsearch                " 搜尋結果highlight顯示
set incsearch               " 加強版搜尋功能, 在輸入search pattern期間就會開始進行搜尋, 
set nobackup                " 設定不自動儲存備份檔
set history=100             " 保留 100 個使用過的指令
set backspace=2             " 在 insert 也可用 backspace
"set backspace=indent,eol,start     " indent=允許使用backspace來刪除縮排, eol表示允許backspace來刪除換行字元, 使其可以退回至上一行, start表示允許使用ctrl+w and ctrl+u快速鍵來刪除獨立詞語和同類字元(縮排, 非縮排字元)
set cursorline              " 顯示現在游標所在的行
"set cursorcolumn           " 顯示現在游標所在的列
set confirm                 " 操作過程有衝突時, 以明確的文字來詢問, 而不是直接阻擋使用者進行該項動作
set showcmd                 " 顯示尚未完成的命令, 如: 2f, 也可顯示選取的行數
set showmode                " 顯示目前操作模式為一般, 插入, 取代還是選取模式

"set mouse=a                 " 滑鼠控制模式

set laststatus=2            " =2, 永遠開啟status line
set statusline=[%F]\ %m%<%r%h%w\ [%{&ff},%{&fileencoding},%Y]%=\    " statusline
set statusline+=\ [Pos=%l,%v,%p%%]\ [Total\ Line=%L]                " statusline

"""cmd"""原有的tab到新的設定使用 :retab
"""cmd"""normal mode下, 此行增加縮排 >>
"""cmd"""normal mode下, 此行減少縮排 <<
"""cmd"""insert mode下, 此行增加縮排 ctrl+shift+t
"""cmd"""insert mode下, 此行減少縮排 ctrl+shift+d
"""cmd"""可以查看tab符號 :set list
"""cmd"""可以查看參數值 :set $arg, ex :set softtabstop
autocmd FileType make setlocal noexpandtab  " 針對 Makefile 需要使用 tab, 而不能自動取代成 space
set shiftwidth=4                            " 程式縮排(>> and <<)所需要的 space 個數
set shiftround                              " 縮排對齊 shiftwidth 的整數倍
set autoindent                              " enter後, 自動啟用autoindent縮排, 自動對齊上一行的縮排
"set smartindent                            " enter後, 自動啟用smartindent縮排, 在上述基礎上, 針對"{", "}", 增加或減少縮排
"set cindent                                " enter後, 自動啟用cindent縮排, 在上述基礎上, 加入簡單的c/c++/java等語法結構判斷
set expandtab                               " 按下tab時, 自動將其替代為 space
set tabstop=4                               " tab 的字元數
set softtabstop=4                           " 按下tab鍵時, 實際占用的字元數
"""ex"""if no expandtab, softtabstop(12) > tabstop(8), enter 1 tab, 1 tab(tabstop) + 4 space, 12 = 8 + 4
"""ex"""                                               enter 2 tab, 3 tab(tabstop), 2*12 = 3*8
"""ex"""if no expandtab, softtabstop(4) < tabstop(8), enter 1 tab, 4 space, 4 = 4
"""ex"""if no expandtab, softtabstop = tabstop, no different
"""ex"""if expandtab, softtabstop(4), enter 1 tab, 4 space
"check by dustin

set pastetoggle=<F11>   " 暫時取消自動縮行, copy多行時可先按F11, 否則因為有打開自動縮排, 資料貼上格式會跑掉
                        " 輸入狀態變成<INSERT PASTE>時, 即可正常copy多行上去
                        " vim register也可解決 不用動用F11

"按tab會自動搜尋檔案內相關字詞來補滿
set completeopt=menu,preview,menuone    ",noinsert - 不是所有版本都support
function InsertTabWrapper(is_shift)
    if pumvisible()
	        return a:is_shift ? "\<C-p>" : "\<C-n>"
	endif
	let col = col('.') - 1
	if !col || getline('.')[col - 1] !~ '\k\|<\|/'
		return "\<tab>"
	elseif exists('&omnifunc') && &omnifunc == ''
		return a:is_shift ? "\<C-p>" : "\<C-n>"
	else
		return "\<C-x>\<C-o>"
	endif
endfunction
inoremap <tab> <C-r>=InsertTabWrapper(0)<CR>

"""cmd""":colorscheme 按tab會顯示所有已放在 $VIMRUNTIME/colors/中的colorscheme
"""cmd""":so $VIMRUNTIME/syntax/hitest.vim 把各highlight group與目前的顏色顯示出來
"""cmd""":runtime syntax/colortest.vim 顯示顏色以供挑選

"""download colorscheme
"colorscheme candy
"colorscheme distinguished
"colorscheme grb256
"colorscheme ir_black
colorscheme jellybeans
"colorscheme vividchalk

"""default colorscheme
"colorscheme torte
"colorscheme desert

set t_Co=256

"hi comment         ctermfg=lightmagenta                                             " highlight樣式調整, 應寫於colorscheme之後
"hi Search          cterm=reverse ctermbg=none ctermfg=none guibg=NONE guifg=none    " highlight樣式調整, 應寫於colorscheme之後
"hi CursorLine      cterm=reverse ctermbg=none ctermfg=none guibg=NONE guifg=none    " highlight樣式調整, 應寫於colorscheme之後
"hi CursorColumn    cterm=reverse ctermbg=none ctermfg=none guibg=NONE guifg=none    " highlight樣式調整, 應寫於colorscheme之後
"hi Normal          cterm=reverse ctermbg=none ctermfg=none guibg=NONE guifg=none    " highlight樣式調整, 應寫於colorscheme之後
"hi Search          cterm=reverse ctermbg=none ctermfg=none guibg=NONE guifg=none    " highlight樣式調整, 應寫於colorscheme之後

"""cmd"""顯示目前所有的環境參數設定 :set all
"""cmd"""顯示與系統預設值不同的設定參數 :set

au BufNewFile,BufRead *.cu set ft=cpp   "au=autocmd

"set shell=ksh      "避免vimdiffs之类的cmd仍然重新load shell

"for gvim
if has("win32")
	set guifont=Lucida_Console:h12
else
	set guifont=monospace\ 16
endif
set columns=210
set lines=24
