execute pathogen#infect()

syntax on
filetype plugin indent on

se incsearch
se nobackup
se nowritebackup
se noswapfile
se autoindent
se clipboard=unnamed
se rnu nu
se ru
se bs=indent,eol,start
se encoding=utf-8
se t_Co=256

au FileType javascript,css,less,html,yaml,json,sh,ruby se et sw=2 ts=2 sts=2
au FileType python se et sw=4 ts=4 sts=4

au BufRead,BufNewFile */nginx/**.conf set ft=nginx

" colors

hi Search      term=NONE cterm=NONE ctermfg=0 ctermbg=cyan
hi Visual      term=NONE cterm=NONE ctermfg=0 ctermbg=230
hi TabLine     term=NONE cterm=NONE ctermfg=0 ctermbg=230
hi TabLineSel  term=bold cterm=bold gui=bold
hi TabLineFill term=bold cterm=bold ctermfg=0 ctermbg=230
hi Comment     ctermfg=gray

" keys
inoremap <C-c> <Esc>

nnoremap <C-k> <C-b>
nnoremap <C-b> <NOP>
nnoremap <C-\> :se paste! paste?<CR>
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <Space> :se hls! hls?<CR>
nnoremap \| :rightbelow vnew<CR>
nnoremap \\ :rightbelow new<CR>
nnoremap <CR> <C-e>M
nnoremap <BS> <C-y>M

nnoremap <C-_> :tabnew<Space>\|<Space>Ag!<Space>
nnoremap K :silent exe '!open dash://'.expand("<cword>")<CR>:redraw!<CR>
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
command RC e ~/.vimrc
command BD 1,100bd

" EasyAlign

vmap <Enter> <Plug>(EasyAlign)

" Airline

set laststatus=2
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
autocmd VimEnter * call AirlineInit()

" indentLine

let g:indentLine_color_term = 242
let g:indentLine_fileTypeExclude = ['json']
let g:indentLine_char = '⋮'

" ycm

let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
set completeopt-=preview
let g:ycm_semantic_triggers =  {
    \ 'c' : ['->', '.'],
    \ 'objc' : ['->', '.'],
    \ 'ocaml' : ['.', '#'],
    \ 'cpp,objcpp' : ['->', '.', '::'],
    \ 'perl' : ['->'],
    \ 'php' : ['->', '::'],
    \ 'cs,java,javascript,d,python,perl6,scala,vb,elixir,go' : ['.'],
    \ 'vim' : ['re![_a-zA-Z]+[_\w]*\.'],
    \ 'ruby' : ['.', '::'],
    \ 'lua' : ['.', ':'],
    \ 'erlang' : [':'],
    \ }
let g:ycm_semantic_triggers['less,css'] = ['re!^\s*', 're![;:]\s*']
let g:ycm_semantic_triggers['html'] = ['<', 're!<.*\s']

" Ctrl-P

let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](node_modules|bower_components|dist)|(\.(git|hg|svn))$',
    \ 'file': '\v\.(exe|so|dll|gif|jpg|png|ico|jpeg)$',
    \ }

" Ag

let g:agprg = 'ag --ignore "*.min.*" --nocolor --nogroup --column'
let g:ag_lhandler = 'topleft lopen'
let g:ag_qhandler = 'topleft copen'
" hide ag stdout
set shellpipe=>
" let &shellpipe="&>"

" vim-go

let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_fmt_fail_silently = 1
let g:go_doc_keywordprg_enabled = 0

au FileType go nnoremap <C-i> :exe 'silent! GoImports'<CR>:exe 'silent! GoImport '.expand("<cword>")<CR>zz

" multiple cursors

let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<C-c>'
nnoremap <C-c> :call multiple_cursors#quit()<CR>

" comment

let g:tcommentMapLeader1=''
let g:tcommentMapLeader2=''
