let mapleader ="\<Space>"   "keymap をスペースキーに割り当て

" ハイライトの非表示
nnoremap <silent><ESC><ESC> :noh<CR>
" terminal emulator でノーマルモードに移行するキーマップ
tnoremap <silent> <ESC> <C-\><C-n>

"netrw の設置
let g:netrw_liststyle=3
let g:netrw_preview=1
let g:netrw_winsize=25
let g:netrw_chgwin=1
let g:netrw_wiw=25

"カーソル下の単語を選択
nnoremap <silent><leader>d viw

