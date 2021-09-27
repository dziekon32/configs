source ~/.vim/search_plug.vim

"-map--------------------------------------------
let mapleader = " "

"-Map-terminal-like-start-end-line---------------
noremap <C-a> ^
noremap <C-e> $
inoremap <C-a> <ESC>^i
inoremap <C-e> <ESC>$i

"-Demap-Arrows-----------------------------------
noremap <Right> <Nop>
noremap <Left> <Nop>
noremap <Down> <Nop>
noremap <Up> <Nop>

"-Move-between-buffors---------------------------
nnoremap <leader>h :bprev<CR>
nnoremap <leader>l :bnext<CR>
" <CR> means enter after command


noremap <silent> <C-j> :cnext<CR>
noremap <silent> <C-k> :cprev<CR>
noremap <silent> <C-b> :colder<CR>
noremap <silent> <C-n> :cnewer<CR>

