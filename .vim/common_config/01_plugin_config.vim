" Plugins are managed by Vim-plug. Once VIM is open run :PlugInstall to
" install plugins.
 call plug#begin(expand('~/.vim/bundle'))

" Plugins requiring no additional configuration or keymaps
  Plug "michaeljsmith/vim-indent-object"
  Plug "oscarh/vimerl"
  Plug "pangloss/vim-javascript"
  Plug "tomtom/tcomment_vim"
  Plug "tpope/vim-endwise"
  Plug "tpope/vim-fugitive"
  Plug "tpope/vim-haml"
  Plug "tpope/vim-rake"
  Plug "tpope/vim-repeat"
  Plug "vim-ruby/vim-ruby"
  Plug "vim-scripts/L9"
  Plug "vim-scripts/matchit.zip"
  Plug "vim-scripts/ruby-matchit"
  Plug "tpope/vim-abolish"
  Plug "leafgarland/typescript-vim"

 " Vim airline configs
  Plug 'bling/vim-airline'
  let g:airline_powerline_fonts = 1
  let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ }

" Easy motion config
  Plug "Lokaltog/vim-easymotion"

"Supertab code completion"
  Plug "ervandew/supertab"
  let g:SuperTabContextDefaultCompletionType = "<c-n>"


" Dash Searching"
  Plug "rizzatti/funcoo.vim"
  Plug "rizzatti/dash.vim"
    nmap <Leader>qs <Plug>DashSearch
    nmap <Leader>qa <Plug>DashGlobalSearch


" CtrlP
  Plug "kien/ctrlp.vim"
    nnoremap <Leader>b :<C-U>CtrlPBuffer<CR>
    nnoremap <Leader>t :<C-U>CtrlP<CR>
    nnoremap <Leader>T :<C-U>CtrlPTag<CR>

    " respect the .gitignore
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']

" Go
  Plug "jnwhiteh/vim-golang"
    au BufNewFile,BufRead *.go set filetype=go

" Slim
  Plug "slim-template/vim-slim"
    au BufNewFile,BufRead *.slim set filetype=slim

" Less
  Plug "groenewege/vim-less"
    au BufNewFile,BufRead *.less set filetype=less

" Handlebars, Mustache, and Friends
  Plug "mustache/vim-mustache-handlebars"
  au  BufNewFile,BufRead *.mustache,*.handlebars,*.hbs,*.hogan,*.hulk,*.hjs set filetype=html syntax=mustache | runtime! ftplugin/mustache.vim ftplugin/mustache*.vim ftplugin/mustache/*.vim

" Stylus
  Plug "wavded/vim-stylus"
    au BufNewFile,BufRead *.styl set filetype=stylus

" Coffee script
  Plug "kchmck/vim-coffee-script"
    au BufNewFile,BufRead *.coffee set filetype=coffee

" AG aka The Silver Searcher
  Plug 'rking/ag.vim'
    nmap g/ :Ag!<space>
    nmap g* :Ag! -w <C-R><C-W><space>
    nmap ga :AgAdd!<space>
    nmap gn :cnext<CR>
    nmap gp :cprev<CR>
    nmap gl :cwindow<CR>


" Tagbar for navigation by tags using CTags
  Plug "majutsushi/tagbar"
    let g:tagbar_autofocus = 1
    map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
    map <Leader>. :TagbarToggle<CR>

" Markdown syntax highlighting
  Plug "tpope/vim-markdown"
    augroup mkd
      autocmd BufNewFile,BufRead *.mkd      set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
      autocmd BufNewFile,BufRead *.md       set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
      autocmd BufNewFile,BufRead *.markdown set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
    augroup END

" NERDTree for project drawer
  Plug "scrooloose/nerdtree"
    let NERDTreeHijackNetrw = 0
    nmap <leader>g :NERDTreeToggle<CR>
    nmap <leader>G :NERDTreeFind<CR>


" Tabular for aligning text
  Plug "godlygeek/tabular"
    function! CustomTabularPatterns()
      if exists('g:tabular_loaded')
        AddTabularPattern! symbols         / :/l0
        AddTabularPattern! hash            /^[^>]*\zs=>/
        AddTabularPattern! chunks          / \S\+/l0
        AddTabularPattern! assignment      / = /l0
        AddTabularPattern! comma           /^[^,]*,/l1
        AddTabularPattern! colon           /:\zs /l0
        AddTabularPattern! options_hashes  /:\w\+ =>/
      endif
    endfunction

    autocmd VimEnter * call CustomTabularPatterns()

    " shortcut to align text with Tabular
    map <Leader>a :Tabularize<space>

" ZoomWin to fullscreen a particular buffer without losing others
  Plug "vim-scripts/ZoomWin"
    map <Leader>z :ZoomWin<CR>


" Unimpaired for keymaps for quicky manipulating lines and files
  Plug "tpope/vim-unimpaired"
    " Bubble single lines
    nmap <C-Up> [e
    nmap <C-Down> ]e

    " Bubble multiple lines
    vmap <C-Up> [egv
    vmap <C-Down> ]egv


" Syntastic for catching syntax errors on save
  Plug "scrooloose/syntastic"
    let g:syntastic_enable_signs=1
    let g:syntastic_quiet_messages = {'level': 'warning'}
    " syntastic is too slow for haml and sass
    let g:syntastic_mode_map = { 'mode': 'active',
                               \ 'active_filetypes': [],
                               \ 'passive_filetypes': ['haml','scss','sass','vue'] }


" gundo for awesome undo tree visualization
  Plug "sjl/gundo.vim"
    map <Leader>h :GundoToggle<CR>


" rails.vim, nuff' said
  Plug "tpope/vim-rails"
    map <Leader>oc :Rcontroller<Space>
    map <Leader>ov :Rview<Space>
    map <Leader>om :Rmodel<Space>
    map <Leader>oh :Rhelper<Space>
    map <Leader>oj :Rjavascript<Space>
    map <Leader>os :Rstylesheet<Space>
    map <Leader>oi :Rintegration<Space>


" surround for adding surround 'physics'
  Plug "tpope/vim-surround"
    " # to surround with ruby string interpolation
    let g:surround_35 = "#{\r}"
    " - to surround with no-output erb tag
    let g:surround_45 = "<% \r %>"
    " = to surround with output erb tag
    let g:surround_61 = "<%= \r %>"


" Clojure Highlighting"
  Plug "tpope/vim-fireplace", { 'for': 'clojure' }
  Plug "tpope/vim-classpath", { 'for': 'clojure' }
  Plug "guns/vim-clojure-static", { 'for': 'clojure' }
  Plug "vim-scripts/paredit.vim", { 'for': 'clojure' }
  Plug "amdt/vim-niji", { 'for': 'clojure' }
  autocmd BufNewFile,BufRead *.clj set filetype=clojure
  autocmd BufNewFile,BufRead *.edn set filetype=clojure
  autocmd BufNewFile,BufRead *.cljs set filetype=clojure
  autocmd BufNewFile,BufRead *.cljx set filetype=clojure

  let g:paredit_leader= '\'
  let vimclojure#ParenRainbow  = 1

" Jade Highlighting"
  Plug "digitaltoad/vim-jade", { 'for': 'jade' }
  autocmd BufNewFile,BufRead *.jade set filetype=jade

" Scala Highlighting"
  Plug "derekwyatt/vim-scala", { 'for': 'scala' }
  autocmd BufNewFile,BufRead *.scala set filetype=scala

" Elixir plugin
  Plug "elixir-lang/vim-elixir", { 'for': 'elixir' }
    au BufNewFile,BufRead *.ex set filetype=elixir
    au BufNewFile,BufRead *.exs set filetype=elixir

" Rust!
  Plug 'wting/rust.vim', { 'for': 'rust' }

" Easy async RSpec running
  Plug 'thoughtbot/vim-rspec'
  Plug "tpope/vim-dispatch"
  let g:rspec_command = "Dispatch rspec --format=progress --no-profile {spec}"
  nmap <Leader>rc :wa<CR> :call RunCurrentSpecFile()<CR>
  nmap <Leader>rn :wa<CR> :call RunNearestSpec()<CR>
  nmap <Leader>rl :wa<CR> :call RunLastSpec()<CR>
  nmap <Leader>ra :wa<CR> :call RunAllSpecs()<CR>

" Elm support -- https://elm-lang.org
  Plug "lambdatoast/elm.vim", { 'for': 'elm' }
  " Compilation
  nmap <Leader>em :w<CR> :ElmMakeCurrentFile<CR>
  nmap <Leader>emm :wa<CR> :ElmMakeMain<CR>

  " Evaluation
  nmap <Leader>el :w<CR> :ElmEvalLine<CR>
  vmap <Leader>es :w<CR> :<C-u>ElmEvalSelection<CR>

  " REPL
  nmap <Leader>er :w<CR> :call ElmRepl()<CR>

" React JSX support
  Plug "git://github.com/pangloss/vim-javascript", { 'for': 'jsx' }
  Plug "git://github.com/mxw/vim-jsx.git", { 'for': 'jsx' }
  let g:jsx_ext_required = 0

" Vue Single File Component support
  Plug "posva/vim-vue", { 'for': 'vue' }

 call plug#end() 
