" -------------
" Vim の基本設定
" -------------
" 行番号
set number

" シンタックス
if has("syntax")
	"syntax on
    syntax enable
endif

" インクメント
set nrformats+=unsigned

" netrw の設置
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_preview=1
let g:netrw_winsize=25
let g:netrw_chgwin=1
let g:netrw_wiw=25
let g:netrw_timefmt="%Y/%m/%d(%a) %H:%M:%S"

" 画面分割した際に下に画面を出す
set splitbelow

" カレント行をハイライト
set cursorline

" タイトル
set title

" 検索時に大文字、小文字を無視する
set ignorecase

" 検索キーワードが小文字のみなら大文字、小文字を区別しない
set smartcase

" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch

" 文字列置換をインタラクティブに表示
set inccommand=split

" 検索時に最後まで行ったら最初に戻る
set wrapscan

" 検索語をハイライト表示
set hlsearch

" 文脈によって解釈が異なる全角文字の幅を、2に固定
set ambiwidth=double

" タブ幅をスペース4つ分にする
set tabstop=4

" vim が自動生成（読み込み時）に使用するタブ幅を4つ分とする
set shiftwidth=4

" タブ入力を複数空白に置き換える
set expandtab

" 空白文字の可視化
set list

" 可視化した空白文字の表示形式
set listchars=tab:>-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

" 全角スペースを表示
" :hi コマンドで設定状態を確認することができる。
"augroup highlightIdegraphicSpace
"  autocmd!
"  " スペース、タブの色をグレーに変更
"  autocmd Colorscheme * highlight NonText guifg=#444b71
"  autocmd VimEnter,Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=#444b71
"  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
"augroup END

" Font の設定
"set guifont=HackGen35Nerd-Regular:h18

" 改行時などに、自動でインデントを設定してくれる
set smartindent

" 0で始まる数値を、8進数として扱わないようにする
"set nrformats-=octal

" ファイル名の補完の可視化
set wildmenu

" ファイル名を常に表示
set laststatus=2

" クリップボードの共有
set clipboard&
set clipboard^=unnamedplus

" バックアップファイルを作成しない
set nobackup

" terminal emulator 設定
set sh=fish

" terminal emulator でノーマルモードに移行するキーマップ
tnoremap <silent> <ESC> <C-\><C-n>
tnoremap <silent> <C-j><C-j> <C-\><C-n>

" terminal 起動コマンド
function! TerminalOpen()
    sv|terminal
    resize 15
endfunction
command! TerminalOpen :call TerminalOpen()

" terminal 起動用ショートカット
nnoremap <C-t> :TerminalOpen<CR>i

" ビープ音とビジュアルベルを無効にする
set noerrorbells
set novisualbell
set vb t_vb=

" keymap の再設定
let mapleader = "\<Space>"

"全角スペースを表示
":hi コマンドで設定状態を確認することができる。
augroup highlightIdegraphicSpace
  autocmd!
  "autocmd Colorscheme * highlight NonText guifg=#FF8b87
  autocmd Colorscheme * highlight NonText guifg=#405b7a
  autocmd VimEnter,Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkRed guibg=#FF8b87
  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END

if has("autocmd")
    "ファイルタイプの検索を有効にする
    filetype plugin on
    "ファイルタイプに合わせたインデントを利用
    filetype indent on

    autocmd FileType html        setlocal sw=2 sts=2 ts=2 et
    autocmd FileType htmldjango  setlocal sw=2 sts=2 ts=2 et
    autocmd FileType js          setlocal sw=2 sts=2 ts=2 et
    autocmd FileType zsh         setlocal sw=4 sts=4 ts=4 et
    autocmd FileType python      setlocal sw=4 sts=4 ts=4 et
    autocmd FileType json        setlocal sw=4 sts=4 ts=4 et
    autocmd FileType css         setlocal sw=2 sts=2 ts=2 et
    autocmd FileType scss        setlocal sw=2 sts=2 ts=2 et
    autocmd FileType sass        setlocal sw=2 sts=2 ts=2 et
    autocmd FileType javascript  setlocal sw=2 sts=2 ts=2 et
    autocmd FileType vue         setlocal sw=2 sts=2 ts=2 et
endif

autocmd BufNewFile,BufRead *.log  set filetype=cs
autocmd BufNewFile,BufRead *.env  set filetype=cs
autocmd BufNewFile,BufRead env.*  set filetype=cs

" vim-grep を ripgrep に変更
if executable('rg')
    set grepprg=rg\ --vimgrep
    set grepformat=%f:%l:%c:%m
endif

" auto quickfix
"au QuickfixCmdPost make,grep,grepadd,vimbrep,copen

" **********************
" キーマッピング
" **********************
" 特定のキーに行頭および行末の回り込み移動を許可する設定
" b  [Backspace]    ノーマルモード	ビジュアルモード
" s  [Space]        ノーマルモード	ビジュアルモード
" <  [←]           ノーマルモード	ビジュアルモード
" >  [→]           ノーマルモード	ビジュアルモード
" [  [←]           挿入モード      置換モード
" ]  [→]           挿入モード      置換モード
" ~                 ノーマルモード
set whichwrap=b,s,[,],<,>,~

" 文章の改行表示を無効化（有効：wrap）
set nowrap

set t_Co=256

" TrueColor 対応
set termguicolors


if &compatible
	set nocompatible
endif

nnoremap ; :
nnoremap : ;

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" 単語選択
nnoremap <leader>d viw
nnoremap <leader>" vi"
nnoremap <leader>' vi'
nnoremap <leader>( vi(
nnoremap <leader>) vi)
nnoremap <leader>[ vi[
nnoremap <leader>] vi]

" ハイライトの非表示
nnoremap <silent><ESC><ESC> :noh<CR>

" ウィンドウのサイズを変更する
nnoremap <S-Up> <C-w>+
nnoremap <S-Down> <C-w>-
nnoremap <S-Left> <C-w><
nnoremap <S-Right> <C-w>>>

" ウィンドウスクロール
nnoremap <C-j> <C-e>
nnoremap <C-k> <C-y>


" ****************************************
"             Telescope の設定
" ****************************************
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fs <cmd>Telescope grep_string<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fm <cmd>Telescope marks<cr>
nnoremap <leader>fj <cmd>Telescope jumplist<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" "nnoremap <C-p> :FZF<CR>
" nnoremap <C-p> :Files<CR>
" nnoremap <leader>f :Lines<CR>
" nnoremap <leader>g :Rg<Space>
" "nnoremap <leader>rg :Rg<CR>
" nnoremap <leader>b :Buffers<CR>
" nnoremap <leader>m :Marks<CR>
" nnoremap <leader>h :History<CR>

" 新しいウィンドウを開く
nnoremap <leader>n :tabnew<CR>

" ファイル内検索（再割り当て）
nnoremap <C-n> *

" --- vim-plug を使ったパッケージ管理
call plug#begin('~/.config/nvim/plugged')
" git
Plug 'airblade/vim-gitgutter'

" nvim-treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" fzf
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/remote', 'do': ':UpdateRemotePlugins' }

" vim-airline ステータスバーなどの見た目系
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Color Scheme
Plug 'cocopon/iceberg.vim'
Plug 'EdenEast/nightfox.nvim'
Plug 'shaunsingh/solarized.nvim'
Plug 'overcache/NeoSolarized'

" Emmet
Plug 'mattn/emmet-vim'

" coc-nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }
Plug 'yaegassy/coc-volar', {'do': 'yarn install --frozen-lockfile'}

"vim-gitgutter
Plug 'airblade/vim-gitgutter'

" nvim-treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" vista (Symbol Tree Viewer)
Plug 'liuchengxu/vista.vim'

" EasyMotion
Plug 'easymotion/vim-easymotion'

" VimSession
Plug 'skanehira/vsession'

" filer
Plug 'obaland/vfiler.vim'
Plug 'obaland/vfiler-column-devicons'

"Rust
Plug 'rust-lang/rust.vim'

" Elixir
Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}
Plug 'elixir-editors/vim-elixir'
call plug#end()

" Color Scheme の設定
set background=light
"set background=dark
colorscheme iceberg

" tokyonight
"let g:tokyonight_style = 'night'
" gruvbox
let g:gruvbox_contrast_dark = 'medium'
" everforest
" This configuration option should be placed before `colorscheme everforest`.
" Available values: 'hard', 'medium'(default), 'soft'
let g:everforest_background = 'hard'
" For better performance
let g:everforest_better_performance = 1

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

function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}

" ****************************************
"             coc.nvim の設定
" ****************************************
" coc-git
" lightline
let g:lightline = {
  \ 'active': {
  \   'left': [
  \     [ 'mode', 'paste' ],
  \     [ 'ctrlpmark', 'git', 'diagnostic', 'cocstatus', 'filename', 'method' ]
  \   ],
  \   'right':[
  \     [ 'filetype', 'fileencoding', 'lineinfo', 'percent' ],
  \     [ 'blame' ]
  \   ],
  \ },
  \ 'component_function': {
  \   'blame': 'LightlineGitBlame',
  \ }
\ }

function! LightlineGitBlame() abort
  let blame = get(b:, 'coc_git_blame', '')
  " return blame
  return winwidth(0) > 120 ? blame : ''
endfunction

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
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
}
EOF


" ****************************************
"           easymotion の設定
" ****************************************
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
"nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap <leader><leader>s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)


" ****************************************
"             VimSession
" ****************************************
"   save the session.
"   :SaveSession
"
"   load the session.
"   :LoadSession
"
"   delete session.
"   :DeleteSession"
"
" default is ~/.vim/sessions.
let g:vsession_path = '~/.config/nvim/sessions'

" default is 1
let g:vsession_save_last_on_leave = 0

" allowed values are 'quickpick' or 'fzf' or 'popup' or 'input'.
let g:vsession_ui = 'fzf'


" ****************************************
"             AirLine
" ****************************************
"let g:airline_theme='solarized'
let g:airline_theme = 'iceberg'
" タブの切り替え（中身は buffer）
nmap <leader>[ <Plug>AirlineSelectPrevTab
nmap <leader>] <Plug>AirlineSelectNextTab
set t_Co=256 " この設定がないと色が正しく表示されない場合がある
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1 " タブラインを表示
let g:airline#extensions#tabline#buffer_idx_mode = 1 " タブ番号表示
let g:airline_powerline_fonts = 1

" ****************************************
"             VFiler
" ****************************************
function! s:start_exprolorer() abort
" エクスプローラースタイルで起動する
" ※起動時に指定したオプションはデフォルトオプションよりも優先されて起動する
lua <<EOF

local configs = {
  options = {
    auto_cd = true,
    auto_resize = true,
    keep = true,
    name = 'exp',
    layout = 'left',
    width = 36,
    columns = 'indent,devicons,name,git',
    git = {
      enabled = true,
      untracked = true,
      ignored = true,
    },
  },
}

-- 現在開いているファイルのディレクトリを取得する
local path = vim.fn.bufname(vim.fn.bufnr())
if vim.fn.isdirectory(path) ~= 1 then
  path = vim.fn.getcwd()
end
path = vim.fn.fnamemodify(path, ':p:h')

-- Lua 関数による起動
require'vfiler'.start(path, configs)

-- vfiler configuration (Explorer style)
require'vfiler/config'.setup {
  options = {
    columns = 'indent,devicons,name',
    auto_cd = true,
    auto_resize = true,
    keep = true,
    layout = 'left',
    width = 30,
  },
}

-- Start vfiler
require'vfiler'.start()

EOF
endfunction

" エクスプローラースタイルで起動 (関数による起動)
noremap <silent><Leader>e :call <SID>start_exprolorer()<CR>

" フローティングスタイルで起動 (VFiler コマンドからオプション指定で起動)
" ※フローティングスタイルの指定以外は、デフォルトオプション値で起動する
"noremap <silent><Leader>l <Cmd>VFiler -layout=floating<CR>

" ****************************************
"             Vista の設定
" ****************************************
nnoremap <leader>v :Vista<CR>

" ****************************************
"             その他の設定
" ****************************************
"Lexplore
nnoremap <silent><leader>l :Lexplore!<CR>
"
