source ~/.vim/map.vim
source ~/.vim/search_plug.vim
source ~/.vim/sets.vim

"-Plugins----------------------------------------
call plug#begin('~/vim/plugged')
Plug 'gruvbox-community/gruvbox'
call plug#end()

colorscheme gruvbox
" neovimlsp, telescope, treesitter, undotree
"------------------------------------------------

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

"augroup GR_1
"    autocmd!
"    autocmd BufWritePre * :call TrimWhitespace()
"augroup END


"-Some-basic-coloring----------------------------
hi Search cterm=NONE ctermfg=yellow ctermbg=red

command Load source ~/.vimrc.highlights


syn keyword logError ERROR
syn match logDate /^\d\{4}-\d\{2}-\d\{2}/ nextgroup=logTime skipwhite
syn match logTime /\d\{2}:\d\{2}:\d\{2},\d\{3}/
syn match xxx /arbuz/
hi link logError Error
hi def logDate guibg=yellow guifg=blue
hi def logTime guibg=green guifg=white
hi def xxx guibg=yellow guifg=blue

