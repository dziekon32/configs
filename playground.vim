func CreateEmptyFunc()
	if &filetype =~ '\(\<cpp\>\|\<c\>\|\<h\>\|\<hpp\>\)'
		cal inputsave()
		let funtype = input('Pass function type: ')
		let funname = input('Pass function name: ')
		cal inputrestore()
		let funheader = funtype . ' ' . funname . '()'
		put _
		cal setline('.', funheader)
		put _
		cal setline('.', '{')
		if funtype != 'void'
			put _
			cal setline('.', '    return (' . funtype . '){};')
		endif
		put _
		cal setline('.', '}')
	elseif &filetype =~ '\(\<vim\>\)'
		cal inputsave()
		let funname = input('Pass function name: ')
		cal inputrestore()
		put _
		cal setline('.', 'func ' . funname . '()')
		exe 's/^\(func\)\s*\(.\)/\1 \u\2/'
		put _
		cal setline('.', 'endfun')
	endif
endfun

func CreateEmptyClass()
	cal inputsave()
	let classname = input("Pass class name: ")
	cal inputrestore()
	let classheader = 'class ' . classname
	let ctrheader = classname . '();'
	put _
	cal setline('.', classheader)
	put _
	cal setline('.', '{')
	put _
	cal setline('.', '  public:')
	put _
	cal setline('.', '    ' . ctrheader)
	put _
	cal setline('.', '')
	put _
	cal setline('.', '  private:')
	put _
	cal setline('.', '')
	put _
	cal setline('.', '};')
endfun

func CreateModules()
	cal inputsave()
	let option = input('Pass option (1-function, 2-class): ')
	cal inputrestore()
	if option == 1
		cal CreateEmptyFunc()
	elseif option == 2
		cal CreateEmptyClass()
	endif
endfun
