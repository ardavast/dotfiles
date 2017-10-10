set nocompatible

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-eunuch'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'jgdavey/tslime.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'SirVer/ultisnips'
call vundle#end()
filetype plugin indent on

syntax on

let powerlinecmd=substitute(system("which powerline"), '\n\+$', '', '')
if !empty(glob(powerlinecmd))
    python3 from powerline.vim import setup as powerline_setup
    python3 powerline_setup()
    python3 del powerline_setup
endif
set laststatus=2
set t_Co=256

let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1
