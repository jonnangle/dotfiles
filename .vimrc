set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'rodjek/vim-puppet'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'jgdavey/tslime.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-fugitive'
Plugin 'klen/python-mode'
Plugin 'ClockworkNet/vim-vcl'

call vundle#end()            " required
filetype plugin indent on    " required
syntax on

augroup vimrcEx
  autocmd!
  autocmd FileType text,markdown,present setlocal ts=4 sw=4 et si tw=80
  autocmd FileType sh,go,perl,awk,python,dockerfile setlocal ts=4 sw=4 et si
  autocmd FileType javascript setlocal ts=4 sw=4 si
  autocmd FileType ruby,cucumber,yaml,vim setlocal ts=2 sw=2 et si
augroup END

set hidden

let g:pymode_rope_autoimport = 0

set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" No more esc!
inoremap jk <esc>
inoremap kj <esc>

" Mappings
let mapleader = ";"
nmap <Leader>, :bp<CR>
nmap <Leader>. :bn<CR>
nmap <Leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

map <Leader>\ :cnext<CR>
map <Leader>' :cprevious<CR>

" lazy .vimrc edits
nnoremap <Leader>ev :vsplit $MYVIMRC<cr>
nnoremap <Leader>sv :source $MYVIMRC<cr>

"" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

"" fugitive
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gs :Gstatus<CR>

"  " Map <C-L> (redraw screen) to also turn off search highlighting until the
"  " next search
nnoremap <C-L> :nohl<CR><C-L>

" NERDTree
map <C-n> :NERDTreeToggle<CR>

"" rspec
let g:rspec_command = 'call Send_to_Tmux("bundle exec rspec {spec}\n")'
au FileType ruby nmap <Leader>t :call RunCurrentSpecFile()<CR>
au FileType ruby nmap <Leader>s :call RunNearestSpec()<CR>
au FileType ruby nmap <Leader>l :call RunLastSpec()<CR>
au FileType ruby nmap <Leader>a :call RunAllSpecs()<CR>

"" pymode
let g:pymode_utils_whitespaces = 0
set foldlevelstart=10

"" go
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage-toggle)
