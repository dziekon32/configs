"-Fast-Search------------------------------------
command -bang -nargs=? QFix call QFixToggle(<bang>0)
fun! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
    unlet g:qfix_win
  else
    copen 10
    let g:qfix_win = bufnr("$")
  endif
endfun
noremap <silent> <C-q> :QFix<CR>

fun! FindAll()
    cal inputsave()
    let p = input('(Quickfix Window Search) - Enter pattern: ')
    cal inputrestore()
    cal inputsave()
    let f = input('(Quickfix Window Search) - (Default % - this file) - File to search: ')
    cal inputrestore()
    if f != ''
        exe 'vimgrep /'.p.'/ '.f.' |copen'
    else
        exe 'vimgrep /'.p.'/ % |copen'
    endif
endfun
noremap <silent> <C-f> :call FindAll()<CR>

fun! FindAndOpenFile()
   try | exe 'bdelete! (search)' | catch | | endtry
   write
   let filename = @%
   let linenr = line(".")
   cal inputsave()
   let p = input('(New Window Search) - Enter pattern: ')
   cal inputrestore()
   exe '%!grep -i "'.p.'"'
   exe 'file (search)'
   exe 'split '.filename.''
   exe ''.linenr.''
   exe 'resize' . (winheight(0) * 3/2)
endfun
noremap <silent> <C-f>f :call FindAndOpenFile()<CR>

