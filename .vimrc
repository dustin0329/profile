"Guan-Ru Li

" 檔案編碼:
set encoding=utf-8
set fileencodings=utf-8,cp950
 
" 設定喜好設定:
set nocompatible      " VIM 不使用和 VI 相容的模式 This most be first. because it changes other options as a side effect
set ic                " 設定搜尋忽略大小寫
set ru                " 第幾行第幾個字
set nu                " 設定行號
set hlsearch          " 設定是否將搜尋的字串反白的設定值 
set nobackup          " 設定不自動儲存備份檔
set ruler             " 顯示右下角狀態列說明
syntax on             " 設定語法上色
set tabstop=4         " tab 的字元數
set history=100       " 保留 100 個使用過的指令
set backspace=2       " 在 insert 也可用 backspace
"set backspace=indent,eol,start
set cursorline        " 顯示現在游標所在的行
"set cursorcolumn      " 顯示現在游標所在的列
set incsearch         " 在關鍵字還沒完全輸入完畢前就顯示結果
set confirm           " 操作過程有衝突時，以明確的文字來詢問

set laststatus=2
set statusline=[%F]\ %m%<%r%h%w\ [%{&ff},%{&fileencoding},%Y]%=\ 
set statusline+=\ [Pos=%l,%v,%p%%]\ [Total\ Line=%L]
set expandtab			" 用space 代替 tab
set shiftwidth=4      " 如果你使用用空白鍵取代tab鍵
set shiftround        "
set softtabstop=4     " 這樣backspace時 才會一次刪4格空白鍵

"set showcmd		" display incomplete commands
set autoindent        " 自動縮排
set smartindent       " 設定 smartindent
set pastetoggle=<F11> " 暫時取消自動縮行, copy多行時可先按F11, 否則因為有打開自動縮排, 資料貼上格式會跑掉
                      " 輸入狀態變成<INSERT PASTE>時, 即可正常copy多行上去
                      
set completeopt=menu,preview,menuone "按tab會自動搜尋檔案內相關字詞來補滿

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



"colorscheme candy
"colorscheme distinguished
"colorscheme grb256
"colorscheme ir_black
colorscheme jellybeans
"colorscheme vividchalk

"colorscheme torte
"colorscheme desert

"set background=dark
set t_Co=256


"set ic               "搜尋不分大小寫
"set all              "顯示目前所有的環境參數設定
"set                  "顯示與系統預設值不同的設定參數

au BufNewFile,BufRead *.cu set ft=cpp
