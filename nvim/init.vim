" Plugins
call plug#begin(stdpath('data') . '/plugged')
    Plug 'morhetz/gruvbox'
    Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' } 
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'


   " Plug 'neoclide/coc.nvim', {'branch': 'release'}


    Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

"    Plug 'roxma/nvim-completion-manager'
    Plug 'sheerun/vim-polyglot'
    "Plug 'jiangmiao/auto-pairs'
    Plug 'dense-analysis/ale'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

    "Airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'enricobacis/vim-airline-clock'

    Plug 'OmniSharp/omnisharp-vim'

    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/async.vim'

    Plug 'kien/ctrlp.vim'
    Plug 'epmatsw/ag.vim'

    Plug 'diepm/vim-rest-console'

    if has('win32')
      Plug 'ionide/Ionide-vim', { 'do':  'powershell -ExecutionPolicy Unrestricted .\install.ps1'}
    else
      Plug 'ionide/Ionide-vim', { 'do':  'make fsautocomplete'}
    endif

    Plug 'easymotion/vim-easymotion'
    Plug 'simeji/winresizer'
    Plug 't9md/vim-choosewin'
    Plug 'liuchengxu/vista.vim'
    Plug 'mhinz/vim-startify'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'dhruvasagar/vim-table-mode'
    Plug 'junegunn/vim-easy-align'
    Plug 'Asheq/close-buffers.vim'


    Plug 'junegunn/limelight.vim' | Plug 'junegunn/goyo.vim'

    Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'
    Plug 'iamcco/mathjax-support-for-mkdp'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
    Plug 'vimwiki/vimwiki'
    Plug 'bkad/CamelCaseMotion'
    "Plug 'roman/golden-ratio'
    Plug 'beauwilliams/focus.nvim'
    Plug 'MattesGroeger/vim-bookmarks'
    Plug 'mattn/calendar-vim'


    Plug 'mihaifm/bufstop'
call plug#end()

"----------------------------------------------------------
"Buffstop
"----------------------------------------------------------
nnoremap <F10> :BufstopFast<cr>
nnoremap <C-F10> :BufstopPreview<cr>


"----------------------------------------------------------
"Theme
"-----------------------------------------------------------
let g:gruvbox_contrast_dark = 'hard'                                                                  
colorscheme gruvbox                                                                                   
highlight Normal ctermbg=NONE                                                                         
highlight CursorLine ctermbg=234
let g:table_mode_corner='|'


"----------------------------------------------------------
"Airline
"---------------------------------------------------------
let g:airline_theme='term'
let g:airline#extensions#clock#auto = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1


let g:airline#extensions#tabline#show_close_button = 0 " remove 'X' at the end of the tabline                                            
let g:airline_section_b = '%{getcwd()}' " in section B of the status line display the CWD                                     
let g:airline#extensions#tabline#tab_min_count = 2     " minimum of 2 tabs needed to display the tabline                                                        
let g:airline#extensions#tabline#show_tabs = 0 
let g:airline#extensions#tabline#show_buffers = 1      " dont show buffers in the tabline  

"-----------------------------------------------------------
" Goyo & Limelight
"-----------------------------------------------------------
augroup limelight_pencil
  autocmd!
  autocmd ColorScheme * let g:limelight_conceal_ctermfg =  (&bg == 'dark') ? 52 : 240
  autocmd ColorScheme gruvbox highlight Normal ctermbg=NONE
  autocmd ColorScheme gruvbox highlight CursorLine ctermbg=234
augroup END
let g:goyo_width=120
command -bang Focus Goyo<bang> | Limelight<bang>

let s:_toggle_focus_enabled=0
function! s:toggle_focus()
    if s:_toggle_focus_enabled
        execute(":Focus!")
        let s:_toggle_focus_enabled = 0
    else 
        execute(":Focus")
        let s:_toggle_focus_enabled = 1
    endif
endfunction

nnoremap <c-w>f :call <SID>toggle_focus()<cr>

"-----------------------------------------------------------
" Markdown
"-----------------------------------------------------------
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_fenced_languages = ['csharp=cs']
"set syntax conceal on
set conceallevel=2


"-----------------------------------------------------------
" VIM WIKI
"-----------------------------------------------------------
set nocompatible
filetype plugin on
syntax on

"let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown'}]
let g:vimwiki_ext2syntax = {  '.wiki': 'default'}
command! Diary VimwikiDiaryIndex
let g:vimwiki_table_mappings = 0
highlight VimwikiBold ctermfg=40
augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
    autocmd FileType vimwiki nmap <silent> <buffer> <C-x> <Plug>VimwikiToggleListItem

   "autocmd FileType vimwiki inoremap <expr> <buffer> <C-Right> vimwiki#tbl#kbd_tab()
   "autocmd FileType vimwiki inoremap <expr> <buffer> <C-Left> vimwiki#tbl#kbd_shift_tab()
augroup end

"---------------------------------------------------------
"Ultisnips
"---------------------------------------------------------
let g:UltiSnipsSnippetStorageDirectoryForUltiSnipsEdit = '/data/.config/nvim/ultisnips'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
vmap <F12> :call UltiSnips#SaveLastVisualSelection()<CR>gvs
imap <F12> <C-R>=UltiSnips#ExpandSnippet()<CR>


"---------------------------------------------------------
"Startify
"---------------------------------------------------------
" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]
let g:startify_change_to_dir=0


"-----------------------------------------------------
"NERDTTree
"-----------------------------------------------------
noremap <C-M-n> :NERDTreeFocus<cr>
noremap <M-n> :NERDTreeFind<cr>
nnoremap <C-n> :NERDTreeToggle<CR>

"------------------------------------------------------
"Focus // Janelas em foco com tamanho maior
"------------------------------------------------------
lua << EOF
    local focus = require('focus')
    focus.width=180
    focus.enabled = false
EOF

if has('win23')
    nnoremap <M-e> :ToggleFocus<cr>
    augroup focus_custom
        autocmd!
        autocmd VimEnter * if has('win32') call DisableFocus() else call FocusDisable() endif

    augroup END
else
    nnoremap <M-e> :FocusToggle<cr>
endif

"--------------------------------

" configuracoes de ambiente
set number
set relativenumber
set ignorecase
set smartcase
set tabstop=2
set shiftwidth=2
set expandtab
set mouse=a
set hidden
set inccommand=split

" set shell=C:/PROGRA~1/PowerShell/7/pwsh.exe
" set shell=powershell.exe
" set shellcmdflag=-NoProfile\ -NoLogo\ -NonInteractive\ -Command 
" set shellquote=\"
" set shellxquote= 
" set shellpipe=|
" set shellredir=>                                                                                    
let g:init_file = stdpath('config') . '/init.vim'
let $PATH = "C:\\Program Files\\Git\\usr\\bin;" . $PATH
"----------------------------------------------------------------
" Mappings pessoais globais
"----------------------------------------------------------------
let mapleader = "\<Space>"
nnoremap tv :vsplit term://C:/PROGRA~1/PowerShell/7/pwsh.exe\ -nologo<cr>
nnoremap ts :split term://C:/PROGRA~1/PowerShell/7/pwsh.exe\ -nologo<cr>
nmap <silent> gf :exec "silent !start " . fnameescape (expand("<cfile>"))<cr>

" {{{ Mappings
nnoremap <C-w>t :tabnew %<cr>
nnoremap <leader>vb :ls<cr>:vertical sb<space>
nnoremap <S-Tab> <C-w>w
nnoremap <Leader>ev :execute 'tabnew' g:init_file <cr>
nnoremap <Leader>lv :execute 'source' g:init_file <cr>
nnoremap - ^
nnoremap = $
nnoremap <M-o> <C-]>
"nnoremap <enter> <C-]>
nmap <Leader>; A;<esc>
nmap <esc><esc> :nohl<cr>
nmap <C-Del> A<Del><Esc>ld/[ ]*<cr>i<Space><esc> :nohl<cr>
nnoremap ]c :cnext<cr>
nnoremap [c :cprev<cr>
nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>
nnoremap ]t :tabnext<cr>
nnoremap [t :tabprev<cr>
"nnoremap <Tab>b :Buffers<cr>
"nnoremap <Tab>w :Windows<cr>
"nnoremap <Tab>t :Tabs<cr>
nnoremap <M-\> :Vista finder<cr>
nnoremap <Leader>v :Vista show<cr>
nnoremap <Leader>V :Vista!!<cr>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <silent> <C-q> :Bdelete menu<CR>
tnoremap <esc> <C-\><C-n>
let g:camelcasemotion_key = '<leader>'
"Especificos de plugins
"
" Easy Align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


"
""VIM visual multi
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<M-d>'           " replace C-n
let g:VM_maps['Find Subword Under'] = '<M-d>'           " replace visual C-n

nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
"
"
"command! -bang -nargs=? -complete=dir Files \call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview','bat --color=always --style=header,grid --line-range :300 {}']}, <bang>0)
"
let g:winresizer_vert_resize=3
nmap  <Leader><Tab>  <Plug>(choosewin)
let g:choosewin_overlay_enable = 1

" easymotion
map \ <Plug>(easymotion-prefix)
" map  / <Plug>(easymotion-sn)
" omap / <Plug>(easymotion-tn)
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)
"
" }}}

if has('win32')
    let g:python3_host_prog="C:/Python37/python.exe"
endif

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
" let $FZF_DEFAULT_COMMAND = 'ag -g ""'


let g:ctrlp_working_path_mode = '0'
set wildignore+=*\\.git\\*,*\\.hg\\*,*\\.svn\\*,*\\bin\\*,*\\obj\\*  " Windows ('noshellslash')

   " OMNISHARP
let g:ale_linters = {
\ 'cs': ['OmniSharp']
\}


vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

let g:OmniSharp_selector_ui = 'ctrlp'

set completeopt=menuone,noinsert,noselect,preview
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 0
let g:asyncomplete_force_refresh_on_context_changed = 1

let g:OmniSharp_server_stdio = 1
let g:OmniSharp_highlight_types = 2
let g:OmniSharp_popup = 1
"let g:OmniSharp_popup_mappings.close = '<Esc>'

" if using ultisnips, set g:OmniSharp_want_snippet to 1
let g:OmniSharp_want_snippet = 1

augroup omnisharp_commands
  autocmd!

  " Show type information automatically when the cursor stops moving.
  " Note that the type is echoed to the Vim command line, and will overwrite
  " any other messages in this space including e.g. ALE linting messages.
  autocmd CursorHold *.cs OmniSharpTypeLookup

  autocmd FileType cs command! OR OmniSharpRestartAllServers

  " The following commands are contextual, based on the cursor position.
  autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
  autocmd FileType cs nmap <silent> <buffer> gu <Plug>(omnisharp_find_usages)
  autocmd FileType cs nmap <silent> <buffer> gi <Plug>(omnisharp_find_implementations)
  autocmd FileType cs nmap <silent> <buffer> pd <Plug>(omnisharp_preview_definition)
  autocmd FileType cs nmap <silent> <buffer> pi <Plug>(omnisharp_preview_implementations)
  "autocmd FileType cs nmap <silent> <buffer> <C-t> <Plug>(omnisharp_type_lookup)
  autocmd FileType cs nmap <silent> <buffer> <C-t> <Plug>(omnisharp_find_type)
  autocmd FileType cs nmap <silent> <buffer> <C-s> <Plug>(omnisharp_find_symbol)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ru <Plug>(omnisharp_fix_usings)
  autocmd FileType cs nmap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
  autocmd FileType cs nmap <silent> <buffer> <F2> <Plug>(omnisharp_rename)

  " Navigate up and down by method/property/field
  autocmd FileType cs nmap <silent> <buffer> [[ <Plug>(omnisharp_navigate_up)
  autocmd FileType cs nmap <silent> <buffer> ]] <Plug>(omnisharp_navigate_down)
  " Find all code errors/warnings for the current solution and populate the quickfix window
  autocmd FileType cs nmap <silent> <buffer> <Leader>cc <Plug>(omnisharp_global_code_check)

  autocmd FileType cs nmap <silent> <buffer> <Leader>d <Plug>(omnisharp_documentation)
  " Contextual code actions (uses fzf, vim-clap, CtrlP or unite.vim selector when available)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ca <Plug>(omnisharp_code_actions)
  " Repeat the last code action performed (does not use a selector)
  autocmd FileType cs nmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)
  autocmd FileType cs xmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)

  autocmd FileType cs nmap <silent> <buffer> == <Plug>(omnisharp_code_format)


  autocmd FileType cs nmap <silent> <buffer> <Leader>osre <Plug>(omnisharp_restart_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ua <Plug>(omnisharp_run_tests_in_file)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ur <Plug>(omnisharp_run_test)
  "autocmd FileType cs nmap <silent> <buffer> <Leader>osst <Plug>(omnisharp_start_server)
  "autocmd FileType cs nmap <silent> <buffer> <Leader>ossp <Plug>(omnisharp_stop_server)
augroup END

" Enable snippet completion, using the ultisnips plugin
let g:OmniSharp_want_snippet=1
let g:OmniSharp_diagnostic_showid=1

let g:OmniSharp_diagnostic_exclude_paths = [
\ 'obj\\',
\ '[Tt]emp\\',
\ '\.nuget\\',
\ '\<AssemblyInfo\.cs\>'
\]

 
" rest
let g:vrc_curl_opts = {
  \ '--connect-timeout' : 10,
  \ '--suppress-connect-headers': '',
  \ '-L': '',
  \ '-i': '',
  \ '--max-time': 60,
  \ '--ipv4': '',
  \ '-s': '',
  \ '-k': '',
\}


let g:indent_guides_guide_size=1


nmap ]m <Plug>BookmarkNext
nmap [m <Plug>BookmarkPrev


