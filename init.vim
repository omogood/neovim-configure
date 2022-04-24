" -------------------------------------
"  Setting
" -------------------------------------
set number                  "行番号を表示
syntax on                   "シンタックスハイライト有効
filetype plugin indent on   "ファイルタイプに基づいたインデントを有効化
set autoindent              "新しい行を始める時にに自動でインデント
set expandtab               "タブをスペースに変換
set tabstop=4               "タブをスペース4文字とカウント
set shiftwidth=4            "自動インデントに使われるスペースの数
set backspace=2             "多くのターミナルでバックスペースの挙動を修正
set splitbelow              "画面分割した際の画面を下に出す
set ruler                   "カーソルの位置表示
set cursorline              "カレント行をハイライト
set title                   "タイトルを表示
set ignorecase              "検索時の大文字と小文字を区別しない
set incsearch               "検索文字列入力時に順次対象文字列にヒットさせる
set inccommand=split        "文字列置換をインタラクティブに表示
set hlsearch                "検索語をハイライト表示
set ambiwidth=double        "文脈によって解釈が異なる全角文字の幅を、2に固定
set list                    "空白文字の可視化
set listchars=tab:>-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%      "可視化した空白文字の表示形式
set nrformats-=octal        "0で始まる数値を、8進数として扱わないようにする
set wildmenu                "ファイル名補完の可視化
set laststatus=2            "ファイル名を常に表示
set clipboard=unnamedplus   "クリップボードの共有
set nobackup                "バックアップファイルを作成しない
let mapleader ="\<Space>"   "keymap をスペースキーに割り当て
set t_Co=256

" ハイライトの非表示
nnoremap <silent><ESC><ESC> :noh<CR>
" terminal emulator でノーマルモードに移行するキーマップ
tnoremap <silent> <ESC> <C-\><C-n>
set sh=zsh                  "terminal emulator を zsh に設定
"set sh=fish                  "terminal emulator を fish に設定
" terminal 起動コマンド
function! TerminalOpen()
    sv|terminal
    resize 15
endfunction
command! TerminalOpen :call TerminalOpen()

" ビープ音とビジュアルベルを無効にする
set noerrorbells
set novisualbell
set vb t_vb=

"全角スペースを表示
":hi コマンドで設定状態を確認することができる。
augroup highlightIdegraphicSpace
  autocmd!
  "autocmd Colorscheme * highlight NonText guifg=#FF8b87
  autocmd Colorscheme * highlight NonText guifg=#405b7a
  autocmd VimEnter,Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkRed guibg=#FF8b87
  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END


"netrw の設置
let g:netrw_liststyle=3
let g:netrw_preview=1
let g:netrw_winsize=25
let g:netrw_chgwin=1
let g:netrw_wiw=25

"ウィンドウのサイズを変更する
nnoremap <S-Up> <C-w>+
nnoremap <S-Down> <C-w>-
nnoremap <S-Left> <C-w><
nnoremap <S-Right> <C-w>>
"ウィンドウを上にスクロール
" nnoremap <C-k> <C-y>
"ウィンドウを下にスクロール
" nnoremap <C-j> <C-e>
"ウィンドウを左にスクロール
nnoremap <C-h> zh
"ウィンドウを右にスクロール
nnoremap <C-l> zl
"ファイルの保存
nnoremap <silent><leader>w :w<CR>
"ウィンドウを閉じる
nnoremap <silent><leader>q :q<CR>
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

nnoremap ; :
nnoremap : ;

nnoremap <C-n> *

"quickfix: 編集許可と折り返し表示無効
function! OpenModifiableQF()
    copen
    set modifiable
    set nowrap
endfunction
autocmd QuickfixCmdPost vimgrep call OpenModifiableQF()
autocmd QuickfixCmdPost grep call OpenModifiableQF()

"Quickfix リスト: 次に移動
nnoremap <silent><A-n> :cn<CR>
"Quickfix リスト: 前に移動
nnoremap <silent><A-N> :cN<CR>

"TrueColor 対応
set termguicolors

" -------------------------------------
" vim-plug を使ったパッケージ管理
" -------------------------------------
call plug#begin('~/.config/nvim/plugged')
"GitHub Copilot
Plug 'github/copilot.vim'

"fzf
Plug '/opt/homebrew/opt/fzf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/remote', 'do': ':UpdateRemotePlugins' }

"vim-gitgutter
Plug 'airblade/vim-gitgutter'

"カラースキーム
Plug 'arcticicestudio/nord-vim'
Plug 'cocopon/iceberg.vim'
Plug 'morhetz/gruvbox'
Plug 'overcache/NeoSolarized'
Plug 'ulwlu/elly.vim'
Plug 'joshdick/onedark.vim'
Plug 'rigellute/rigel'
Plug 'sainnhe/gruvbox-material'
Plug 'shaunsingh/solarized.nvim'
Plug 'EdenEast/nightfox.nvim'
Plug 'sainnhe/everforest'

"vim-airline ステータスバーなどの見た目系
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Tree-Sitter <Parser-Generator tool>
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

"Emmet
Plug 'mattn/emmet-vim'

"coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"TagBar
Plug 'majutsushi/tagbar'

"nvim-lspconfig neovim embedet LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

" dependencies
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
" telescope
Plug 'nvim-telescope/telescope.nvim'

" EasyMotion
Plug 'easymotion/vim-easymotion'

"Rust
Plug 'rust-lang/rust.vim'

" Elixir
Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}
Plug 'elixir-editors/vim-elixir'

" JavaScript
Plug 'pangloss/vim-javascript'

"Initialize plugin system
call plug#end()

" ****************************************
"           カラースキーム
" ****************************************
colorscheme nightfox
"let g:gruvbox_material_background = 'medium'
set background=dark

" ****************************************
"          vim-airline の設定
" ****************************************
" vim-airline のオプション
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
" vim-airline のテーマを設定
"let g:airline_theme='nightfox'

" ****************************************
"           fzf-preview の設定
" ****************************************

let g:fzf_preview_filelist_command = 'rg --files --hidden --follow --no-messages -g \!"* *"' " Installed ripgrep
let g:fzf_preview_command = 'bat --color=always --plain {-1}' " Installed bat

nmap <Leader>f [fzf-p]
xmap <Leader>f [fzf-p]

nnoremap <silent> [fzf-p];     :<c-u>CocCommand fzf-preview.DirectoryFiles<CR>
nnoremap <silent> [fzf-p]p     :<C-u>CocCommand fzf-preview.FromResources project_mru git<CR>
nnoremap <silent> [fzf-p]gs    :<C-u>CocCommand fzf-preview.GitStatus<CR>
nnoremap <silent> [fzf-p]ga    :<C-u>CocCommand fzf-preview.GitActions<CR>
nnoremap <silent> [fzf-p]b     :<C-u>CocCommand fzf-preview.Buffers<CR>
nnoremap <silent> [fzf-p]B     :<C-u>CocCommand fzf-preview.AllBuffers<CR>
nnoremap <silent> [fzf-p]o     :<C-u>CocCommand fzf-preview.FromResources buffer project_mru<CR>
nnoremap <silent> [fzf-p]<C-o> :<C-u>CocCommand fzf-preview.Jumps<CR>
nnoremap <silent> [fzf-p]g;    :<C-u>CocCommand fzf-preview.Changes<CR>
nnoremap <silent> [fzf-p]/     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
nnoremap <silent> [fzf-p]*     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
nnoremap          [fzf-p]gr    :<C-u>CocCommand fzf-preview.ProjectGrep<Space>
xnoremap          [fzf-p]gr    "sy:CocCommand   fzf-preview.ProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
nnoremap <silent> [fzf-p]t     :<C-u>CocCommand fzf-preview.BufferTags<CR>
nnoremap <silent> [fzf-p]q     :<C-u>CocCommand fzf-preview.QuickFix<CR>
nnoremap <silent> [fzf-p]l     :<C-u>CocCommand fzf-preview.LocationList<CR>

" ****************************************
"             ripgrep(Rg) の設定
" ****************************************
" ripgrepで検索中、?を押すとプレビュー:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

nnoremap <leader>g :Rg<Space>

" ****************************************
"             gitgutter の設定
" ****************************************
set updatetime=100
nmap <c-j> <Plug>(GitGutterNextHunk)
nmap <c-k> <Plug>(GitGutterPrevHunk)
let g:gitgutter_override_sign_column_highlight = 0

" ****************************************
"             coc.nvim の設定
" ****************************************
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


" ****************************************
"           nvim-treesitter の設定
" ****************************************
" Tree Sitter is `BUGGY`
" (2022/02/05) setting to be disabled.

lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "all",

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    -- disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

" ****************************************
"           ファイル別の設定
"           以下用語
"               sw=softtabstop
"               sts=shiftwidth
"               ts=tabstop
"               et=expandtab
" ****************************************
augroup Init
    autocmd!
    autocmd FileType html setlocal sw=2 sts=2 ts=2 et
    autocmd FileType css setlocal sw=2 sts=2 ts=2 et
    autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
    autocmd FileType elixir setlocal sw=2 sts=2 ts=2 et
    autocmd FileType haskell setlocal sw=2 sts=2 ts=2 et
augroup END


" ****************************************
"             cTags の設定
" ****************************************
set tags=~./tags,./../tags,./*/tags


" ****************************************
" EasyMotion
" ****************************************
let g:EasyMotion_smartcase = 1
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" ****************************************
"             その他の設定
" ****************************************
"Lexplore
nnoremap <silent><leader>l :Lexplore!<CR>
"ctags
set tags=./tags,tags;
nnoremap <silent><C-]> g<C-]>
"フォントの設定
"set macligatures
set guifont=HackNerdFontCompleteM-Regular:h12

