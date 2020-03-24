"Dustin Li - 20181018
"Dustin Li - 20200321



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
set incsearch               " 加強版搜尋功能, 在輸入search pattern期間就會開始進行搜尋
set nobackup                " 設定不自動儲存備份檔
set history=100             " 保留 100 個使用過的指令
set backspace=2             " 在 insert 也可用 backspace
"set backspace=indent,eol,start     " indent=允許使用backspace來刪除縮排, eol表示允許backspace來刪除換行字元, 使其可以退回至上一行, start表示允許使用ctrl+w and ctrl+u快速鍵來刪除獨立詞語和同類字元(縮排, 非縮排字元)
set cursorline              " 顯示現在游標所在的行
"set cursorcolumn           " 顯示現在游標所在的列
set confirm                 " 操作過程有衝突時, 以明確的文字來詢問, 而不是直接阻擋使用者進行該項動作
set showcmd                 " 顯示尚未完成的命令, 如: 2f, 也可顯示選取的行數
set showmode                " 顯示目前操作模式為一般, 插入, 取代還是選取模式
"set foldmethod=indent       " 縮排折疊 zm:折疊, zr解開折疊
set gcr=a:blinkon0          " 游標不閃爍
"set mouse=a                 " 滑鼠控制模式
set autoread                " auto read when file is changed from outside

set laststatus=2            " =2, 永遠開啟status line
set statusline=[%F]\ %m%<%r%h%w\ [%{&ff},%{&fileencoding},%Y]%=\    " statusline
set statusline+=\ [Pos=%l,%v,%p%%]\ [Total\ Line=%L]                " statusline



" tab:
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



" colorscheme:
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



" highlight 多餘的空白與TAB, 應寫於colorscheme之後:
hi RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t\|\t/



"""cmd"""顯示目前所有的環境參數設定 :set all
"""cmd"""顯示與系統預設值不同的設定參數 :set



au BufNewFile,BufRead *.cu set ft=cpp                   "au=autocmd
au BufNewFile,BufRead *.sv set filetype=systemverilog   "au=autocmd

" auto reload vimrc when editing it
autocmd bufwritepost .vimrc source $MYVIMRC
autocmd bufwritepost vimrc source $MYVIMRC


" hotkey:
" \vimrc 新tab開啟~/.vimrc
map <leader>vimrc :tabe ~/.vimrc

" :cd. change working directory to that of the current file
cmap cd. lcd %:p:h

"set wrap時移動
nmap k gk
nmap j gj

" 分割視窗中移動
nmap <C-L> <C-W>l
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k

" buffer change mapping
nmap <F6> :bp<CR> " buffer 前移
nmap <F7> :bd<CR> " 刪除當下buffer
nmap <F8> :bn<CR> " buffer 後移
" nmap gb :bn<CR>
" nmap gB :bp<CR>

set pastetoggle=<F9>    " 暫時取消自動縮行, copy多行時可先按F9, 否則因為有打開自動縮排, 資料貼上格式會跑掉
                        " 輸入狀態變成<INSERT PASTE>時, 即可正常copy多行上去
                        " vim register也可解決 不用動用F11

" no highlight
map <F11> : nohls<CR>

" verilog auto instance
map <F12> :s/^\s*[^m ][^\/\`=]*\s\(\w\+\)[^\/,]*/\t.\1(\1)/<CR>:'<,'>s/module\s\+\(\w\+_\(\w\+\)\_.\{-}[^#\/`]\+\)($/\1u_\2 (<CR>:nohls<CR>

" sting reversed
vnoremap ;rv c<C-O>:set revins<CR><C-R>"<Esc>:set norevins<CR>



" plugin:
"plugin autoload - https://github.com/tpope/vim-pathogen.git
execute pathogen#infect()

" Signature - https://github.com/kshenoy/vim-signature.git
map <F1> :SignatureToggleSigns<CR>

" NerdTree - https://github.com/preservim/nerdtree.git
map <F5> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif



" returns true iff is NERDTree open/active
function! s:isNTOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" calls NERDTreeFind iff NERDTree is active, current window contains a modifiable file, and we're not in vimdiff
function! s:syncTree()
  if &modifiable && s:isNTOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

autocmd WinEnter * call s:syncTree()



" Easy Align - https://github.com/junegunn/vim-easy-align.git
vmap <Enter> <Plug>(EasyAlign)

" CtrlP - https://github.com/kien/ctrlp.vim.git
let g:ctrlp_clear_cache_on_exit = 0 " 離開 vim 後不要清 cache
let g:ctrlp_max_files = 1000000 " 加大 cache 索引的檔案數, 否則會漏找檔案
let g:ctrlp_user_command = 'find %s -type f' " MACOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" airline - https://github.com/vim-airline/vim-airline.git
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show =  1

" airline theme - https://github.com/vim-airline/vim-airline-themes.git
"let g:airline_theme='deus'
let g:airline_theme='bubblegum'

" grep - https://github.com/yegappan/grep.git
nnoremap <silent> <F3> :Grep<CR>



"set shell=ksh      "避免vimdiffs之类的cmd仍然重新load shell



"for gvim
if has("win32")
    set guifont=Lucida_Console:h12  " Win32
elseif has("gui_macvim")
    set guifont=Monaco:h14          " MACOS
else
    set guifont=monospace\ 16       " Linux
endif
set columns=160
set lines=50

