"" https://stackoverflow.com/questions/1676632/whats-a-quick-way-to-comment-uncomment-lines-in-vim
colorscheme elflord
colorscheme default
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
 Bundle 'gmarik/Vundle.vim'

 Bundle "mattn/emmet-vim"

 Bundle "pangloss/vim-javascript"

 Bundle 'Lokaltog/vim-easymotion'
 Bundle 'kien/ctrlp.vim'
 "Bundle 'altercation/vim-colors-solarized' 
 "Bundle 'yearofmoo/Vim-Darkmate'
 "Bundle 'Lokaltog/vim-distinguished'
 "Bundle 'nanotech/jellybeans.vim'
 "Bundle 'kchmck/vim-coffee-script'

 Bundle 'sorin-ionescu/vim-htmlvalidator'
 Bundle 'Shougo/vimproc'
 Bundle 'tpope/vim-commentary'

 Bundle 'tpope/vim-fugitive'

 Bundle 'MarcWeber/vim-addon-mw-utils'
 "Bundle 'honza/vim-snippets'
 "Bundle 'tpope/vim-rails'
 "Plugin 'benmills/vimux'

"Bundle "suan/vim-instant-markdown"
 Bundle "elixir-lang/vim-elixir"
"""Bundle "lambdatoast/elm.vim"
 Bundle "elmcast/elm-vim"
 Bundle 'scrooloose/syntastic'
 Bundle "tpope/vim-dispatch"
 " Erlang Plugins
 Bundle 'vim-erlang/erlang-motions.vim'
 Bundle 'vim-erlang/vim-dialyzer'
 Bundle 'vim-erlang/vim-erlang-compiler'
 Bundle 'vim-erlang/vim-erlang-omnicomplete'
 Bundle 'vim-erlang/vim-erlang-runtime'
 Bundle 'vim-erlang/vim-erlang-skeletons'
 Bundle 'vim-erlang/vim-erlang-tags'

 " Haskel Plugins http://www.stephendiehl.com/posts/vim_2016.html
 Bundle 'eagletmt/ghcmod-vim'
 Bundle 'eagletmt/neco-ghc'
 Bundle 'tomtom/tlib_vim'
 Bundle 'garbas/vim-snipmate'
 Bundle 'scrooloose/nerdtree'
 Bundle 'scrooloose/nerdcommenter'
 Bundle 'godlygeek/tabular'
 Bundle 'Shougo/neocomplete'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax on
" To ignore plugin indent changes, instead use:
filetype plugin on " This used to be commented out

" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set tabstop=2
set nu
set shiftwidth=2
set smarttab
set expandtab
set autoindent
set softtabstop=2
set background=dark
set ruler
set hlsearch
hi identifier ctermfg=magenta
set nu
set colorcolumn=81
set listchars=tab:>~,nbsp:~,trail:.
set list


let g:molokai_original = 1
let g:solarized_termcolors=256

" Neovim terminal bindings
":tnoremap <Esc> <C-\><C-n>
":tnoremap <A-h> <C-\><C-n><C-w>h
":tnoremap <A-j> <C-\><C-n><C-w>j
":tnoremap <A-k> <C-\><C-n><C-w>k
":tnoremap <A-l> <C-\><C-n><C-w>l
":nnoremap <A-h> <C-w>h
":nnoremap <A-j> <C-w>j
":nnoremap <A-k> <C-w>k
":nnoremap <A-l> <C-w>l

" Key bindings for vim window management
" Move around windows with <Alt+(hjkl)>
" noremap ˙ <C-w>h
" noremap ∆ <C-w>j
" noremap ˚ <C-w>k
" noremap ¬ <C-w>l

" Crates a new window with <Alt+Space>
" noremap    <C-w>n

" Quits a window with <Alt x>
" noremap ≈ <C-w>q

" Moves a window  with <Alt+Shift+(hjkl)>
" noremap Ó <C-w><S-h>
" noremap Ô <C-w><S-j>
" noremap  <C-w><S-k>
" noremap Ò <C-w><S-l>

" Equalize the window spacing with <Alt+\>
" noremap « <C-w>=

" Move a window over left with <Alt+.>
" noremap ≥ <C-w>>
" Move a window over right with <Alt+,>
" noremap ≤ <C-w><

" Display the filepath
set statusline+=%f
set laststatus=2

 function! VimuxSlime()
  call VimuxSendText(@v)
  call VimuxSendKeys("Enter")
 endfunction

 " If text is selected, save it in the v buffer and send that buffer it to tmux
 vmap <LocalLeader>vs "vy :call VimuxSlime()<CR>

 " Select current paragraph and send it to tmux
 nmap <LocalLeader>vs vip<LocalLeader>vs<CR>

 " Prompt for a command to run map
 map <Leader>vp :VimuxPromptCommand<CR>

au FileType erlang setl sw=4 sts=5 et
au FileType python setl sw=4 sts=5 et
let g:python_host_prog = '/usr/local/bin/python'
set backspace=2 " make backspace work like most other apps
" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
"


" == syntastic ==

map <Leader>s :SyntasticToggleMode<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" == ghc-mod ==

map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>

" == supertab ==

let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

if has("gui_running")
  imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
  if has("unix")
    inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
  endif
endif

" == neco-ghc ==

let g:haskellmode_completion_ghc = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" == nerd-tree ==

map <Leader>n :NERDTreeToggle<CR>

" == tabular ==

let g:haskell_tabular = 1

vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>
vmap a, :Tabularize /<-<CR>
vmap al :Tabularize /[\[\\|,]<CR>

" == ctrl-p ==

map <silent> <Leader>t :CtrlP()<CR>
noremap <leader>b<space> :CtrlPBuffer<cr>
let g:ctrlp_custom_ignore = '\v[\/]dist$'
