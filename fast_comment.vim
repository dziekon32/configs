func FastCodeComment()
	let line = getline('.')
	let filetype = &filetype
	if &filetype =~ '\(\<cpp\>\|\<c\>\|\<h\>\|\<hpp\>\)'
		if line =~ "^[ ]*\/\/"
			exe 's/^[ ]*\/\/\(.*\)/\1/'
		else
			exe 's/\(.*\)/\/\/\1/'
		endif
	elseif &filetype =~ '\(\<sh\>\|\<python\>\|\<cmake\>\)'
		if line =~ "^[ ]*\#"
			exe 's/^[ ]*\#\(.*\)/\1/'
		else
			exe 's/\(.*\)/#\1/'
		endif
	elseif &filetype =~ '\(\<vim\>\)'
		if line =~ "^[ ]*\""
			exe 's/^[ ]*\"\(.*\)/\1/'
		else
			exe 's/\(.*\)/"\1/'
		endif
	endif
endfun

