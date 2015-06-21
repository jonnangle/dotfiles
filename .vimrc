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
Plugin 'klen/python-mode'

call vundle#end()            " required
filetype plugin indent on    " required
syntax on

augroup vimrcEx
  autocmd!
  autocmd FileType text,markdown,present setlocal ts=4 sw=4 et si tw=80
  autocmd FileType sh,go,perl,awk,python,dockerfile setlocal ts=4 sw=4 et si
  autocmd FileType ruby,cucumber,yaml,vim setlocal ts=2 sw=2 et si
augroup END

set hidden

" Mappings
let mapleader = ";"
nmap <Leader>, :bp<CR>
nmap <Leader>. :bn<CR>
nmap <Leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

"" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

"  " Map <C-L> (redraw screen) to also turn off search highlighting until the
"  " next search
nnoremap <C-L> :nohl<CR><C-L>

" NERDTree
map <C-n> :NERDTreeToggle<CR>

"" rspec
let g:rspec_command = 'call Send_to_Tmux("bundle exec rspec {spec}\n")'
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
