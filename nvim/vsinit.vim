set number
set relativenumber
set ignorecase
set smartcase
let mapleader = "\<Space>"
nnoremap - ^
nnoremap + $
nnoremap <Tab> :bnext<cr>
nnoremap <M-o> <C-]>


nnoremap <Leader>ev :e c:/data/.config/nvim/vsinit.vim<cr>
nnoremap <Leader>lv :source c:/data/.config/nvim/vsinit.vim<cr>
nnoremap <Leader>ko :vsc VsVim.Options<cr>
nnoremap <Leader>kk :vsc Tools.CustomizeKeyboard<cr>

nmap <C-p> :vsc Edit.GotoAll<cr>
nmap <C-w>e :vsc View.ErrorList<cr>
nmap gd :vsc ReSharper.ReSharper_GotoDeclaration<cr>
nmap gu :vsc ReSharper.ReSharper_GotoUsage<cr>

nmap <Leader>E :vsc ReSharper.ReSharper_GotoPrevErrorInSolution<cr>
nmap <Leader>e :vsc ReSharper.ReSharper_GotoNextErrorInSolution<cr>

nnoremap <Leader>qa :vsc File.CloseAllButThis<cr>
nmap <C-Del> A<Del><Esc>ld/[ ]*<cr>i<Space><esc>

nnoremap <Leader>ua :vsc ReSharper.ReSharper_UnitTestRunSolution<cr>
nnoremap <Leader>ud :vsc ReSharper.ReSharper_UnitTestDebugContext<cr>
nnoremap <Leader>ur :vsc ReSharper.ReSharper_UnitTestRunFromContext<cr>
nnoremap <Leader>uu :vsc ReSharper.ReSharper_UnitTestSessionRepeatPreviousRun<cr>


  "autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
  "autocmd FileType cs nmap <silent> <buffer> gu <Plug>(omnisharp_find_usages)
  "autocmd FileType cs nmap <silent> <buffer> gi <Plug>(omnisharp_find_implementations)
  "autocmd FileType cs nmap <silent> <buffer> pd <Plug>(omnisharp_preview_definition)
  "autocmd FileType cs nmap <silent> <buffer> pi <Plug>(omnisharp_preview_implementations)
  "autocmd FileType cs nmap <silent> <buffer> <C-t> <Plug>(omnisharp_find_type)
  "autocmd FileType cs nmap <silent> <buffer> <C-s> <Plug>(omnisharp_find_symbol)
  "autocmd FileType cs nmap <silent> <buffer> <Leader>ru <Plug>(omnisharp_fix_usings)
  "autocmd FileType cs nmap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
  "autocmd FileType cs nmap <silent> <buffer> <F2> <Plug>(omnisharp_rename)

  "" Navigate up and down by method/property/field
  "autocmd FileType cs nmap <silent> <buffer> [[ <Plug>(omnisharp_navigate_up)
  "autocmd FileType cs nmap <silent> <buffer> ]] <Plug>(omnisharp_navigate_down)
  "" Find all code errors/warnings for the current solution and populate the quickfix window
  "autocmd FileType cs nmap <silent> <buffer> <Leader>cc <Plug>(omnisharp_global_code_check)

  "autocmd FileType cs nmap <silent> <buffer> <Leader>osd <Plug>(omnisharp_documentation)
  "" Contextual code actions (uses fzf, vim-clap, CtrlP or unite.vim selector when available)
  "autocmd FileType cs nmap <silent> <buffer> <Leader>ca <Plug>(omnisharp_code_actions)
  "" Repeat the last code action performed (does not use a selector)
  "autocmd FileType cs nmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)
  "autocmd FileType cs xmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)

  "autocmd FileType cs nmap <silent> <buffer> <Leader>== <Plug>(omnisharp_code_format)

