syntax on
filetype plugin indent on

se incsearch
se nobackup
se nowritebackup
se noswapfile
se autoindent
se clipboard=unnamed
se nu
se ru
se bs=indent,eol,start
se encoding=utf-8
se t_Co=256
se modelines=5

se wildignore+=*/tmp/*,*.so,*.swp,*.zip

au FileType bash,sh,zsh,javascript,ruby,eruby,html,vue,javascript.jsx,javascriptreact,typescript,typescriptreact,json,yaml,less,css setl sw=2 ts=2 sts=2 et
au FileType go,make setl noet sw=8 ts=8 sts=8
au FileType python setl et sw=4 ts=4 sts=4
au BufNewFile,BufRead *.wxml set filetype=html
au BufNewFile,BufRead *.wxss set filetype=css

" colors

hi Search      term=NONE cterm=NONE ctermfg=0 ctermbg=cyan
hi Visual      term=NONE cterm=NONE ctermfg=0 ctermbg=230
hi TabLine     term=NONE cterm=NONE ctermfg=0 ctermbg=230
hi TabLineSel  term=bold cterm=bold gui=bold
hi TabLineFill term=bold cterm=bold ctermfg=0 ctermbg=230
hi Comment     ctermfg=gray

" keys
inoremap <C-c> <Esc>

nnoremap <C-j> <C-f>
nnoremap <C-k> <C-b>
nnoremap <C-b> <NOP>
nnoremap <silent> <C-p> :call fzf#run(fzf#wrap(fzf#vim#with_preview({ 'source': 'git ls-files --exclude-standard --cached --others', 'sink': 'tabedit' })))<CR>
nnoremap <silent> <C-f> :Rg<CR>
nnoremap <C-\> :se paste! paste?<CR>
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <Space> :se hls! hls?<CR>
nnoremap \| :rightbelow vnew<CR>
nnoremap \\ :rightbelow new<CR>
" nnoremap <CR> <C-e>M
" nnoremap <BS> <C-y>M

nnoremap K :silent exe '!open dash://'.expand("<cword>")<CR>:redraw!<CR>
" nnoremap K :silent exe '!open -na Google\ Chrome --args "--app=https://devdocs.io/\#q='.expand("<cword>").'"'<CR>:redraw!<CR>

nnoremap <silent> Q :if(len(filter(range(1,bufnr('$')),'buflisted(v:val)'))==1)
                  \ <CR>:q<CR>else<CR>:bd<CR>endif<CR>

inoremap <Left>  <NOP>
inoremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
nnoremap <Left>  <NOP>
nnoremap <Right> <NOP>
nnoremap <Up>    <NOP>
nnoremap <Down>  <NOP>

vnoremap < <gv
vnoremap > >gv

" aliases

command WQ wq
command Wq wq
command W w
command Q q

let g:fzf_layout = { 'window': '-tabnew' }

" EasyAlign

vmap <Enter> <Plug>(EasyAlign)

" Airline

let g:airline_powerline_fonts = 1
let g:gitgutter_signs = 0
function! AirlineInit()
	let g:airline_section_a = airline#section#create(['mode',' ','branch'])
	let g:airline_section_b = airline#section#create_left(['ffenc','hunks','%f'])
	let g:airline_section_c = airline#section#create(['filetype'])
	let g:airline_section_x = airline#section#create(['%P'])
	let g:airline_section_y = airline#section#create(['%B'])
	let g:airline_section_z = airline#section#create_right(['%l','%c'])
endfunction
autocmd User AirlineAfterInit call AirlineInit()

" vim-go

let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_variable_declarations = 1
let g:go_doc_keywordprg_enabled = 0
let g:go_fmt_fail_silently = 1

" vim-visual-multi

fun! VM_Start()
	nmap <buffer> <C-C> <Esc>
	imap <buffer> <C-C> <Esc>
endfun

fun! VM_Exit()
	nunmap <buffer> <C-C>
	iunmap <buffer> <C-C>
endfun

" rust.vim

let g:rustfmt_autosave = 1

" theme

let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default': {
  \       'transparent_background': 1
  \     }
  \   }
  \ }

set background=dark
colorscheme PaperColor
