let mapleader = " "
nmap <leader>h :bprev<CR>
nmap <leader>l :bnext<CR>

nnoremap <leader><leader> :m -2<CR>
nnoremap <leader>f <CMD>Telescope find_files hidden=true<CR>
nnoremap <leader>fg <CMD>Telescope live_grep<CR>
nnoremap <leader>b <CMD>Telescope buffers<CR>

nnoremap <C-t> <CMD>NERDTreeToggle<CR>

" Fast Function Creation
noremap <silent> <S-m> :call CreateModules()<CR>

" Fast Code Comment - //
noremap <silent> <C-_> :call FastCodeComment()<CR>

" Reload vimrc file
nnoremap <F5> <CMD>so ~/.vimrc<CR>

"Toggle higlight
nnoremap <silent> <C-h> :set hls!<CR>

" Disable arrow movement
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>

inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

noremap <A-a> <CMD>call Clangfile()<CR>
inoremap <A-a> <Esc><CMD>call Clangfile()<CR>

"Terminal like commands
noremap <C-a> <Esc>^
noremap <C-e> <Esc>$
inoremap <C-a> <Esc>I
inoremap <C-e> <Esc>A
vnoremap <C-e> <Esc>v$
vnoremap <C-a> <Esc>v^

"Quickfix window opening/browsing
noremap <silent> <C-j> <CMD>cnext<CR>
noremap <silent> <C-k> <CMD>cprev<CR>
noremap <silent> <C-b> <CMD>colder<CR>
noremap <silent> <C-n> <CMD>cnewer<CR>

"Search Plug
noremap <silent> <C-f> <CMD>call FindAll()<CR>
noremap <silent> <C-q> :QFix<CR>
noremap <silent> <C-f>f <CMD>call FindInAllFolders()<CR>

"auto clang format
function! Clangfile()
	silent :w
	silent !clang-format --style=Microsoft --dump-config > .clang-format
	silent !clang-format -style=file -i %
	silent :e! "reload the buffer
	silent !rm -rf .clang-format
endfunction

"Auto Trim Whitespaces
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup GR_1
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

"Auto completion when eneters vim
autocmd BufEnter * lua require'completion'.on_attach()
