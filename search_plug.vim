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

fun! FindAll()
	let default = expand('<cword>')
    cal inputsave()
    let p = input('(Current File Search) - Enter pattern: <default: ' . default . '> ')
    cal inputrestore()
	if p == ""
		let p = default
	endif
	exe 'vimgrep /'.p.'/ % |copen'
endfun

fun! FindInAllFolders()
    cal inputsave()
    let p = input('(Selective File Search) - Enter pattern: ')
    let f = input('(Selective File Search) - (%,all,cpp) - File to search: ')
    cal inputrestore()
    if f == 'cpp'
        exe 'vimgrep /'.p.'/ **/*.cpp **/*.hpp |copen'
    elseif f == 'all'
        exe 'vimgrep /'.p.'/ **/* |copen'
    else
		exe 'vimgrep /'.p.'/ % |copen'
    endif
endfun

"fun! FindAndOpenFile()
"   try | exe 'bdelete! (search)' | catch | | endtry
"   write
"   let filename = @%
"   let linenr = line(".")
"   cal inputsave()
"   let p = input('(New Window Search) - Enter pattern: ')
"   cal inputrestore()
"   exe '%!grep -i "'.p.'"'
"   exe 'file (search)'
"   exe 'split '.filename.''
"   exe ''.linenr.''
"   exe 'resize' . (winheight(0) * 3/2)
"endfun
