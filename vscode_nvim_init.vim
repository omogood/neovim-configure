let mapleader ="\<Space>"   "keymap をスペースキーに割り当て

" terminal emulator でノーマルモードに移行するキーマップ
tnoremap <silent> <ESC> <C-\><C-n>

"カーソル下の単語を選択
nnoremap <silent><leader>d viw

"ファイルの保存
nnoremap <silent><leader>w :w<CR>
"ウィンドウを閉じる
nnoremap <silent><leader>q :q<CR>

nnoremap ; :
nnoremap : ;


nnoremap <C-n> *

"カーソル下の単語を選択
nnoremap <silent><leader>d viw
nnoremap <silent><leader>' vi'
nnoremap <silent><leader>" vi"
nnoremap <silent><leader>( vi(
nnoremap <silent><leader>) vi)
nnoremap <silent><leader>[ vi]
nnoremap <silent><leader>] vi]
nnoremap <silent><leader>< vi<
nnoremap <silent><leader>> vi>

