set nocompatible

" -- Affichage
set number                " Affiche le numero des lignes
set ruler                 " Affiche la position actuelle du curseur
set wrap                  " Affiche les lignes trop longues sur plusieurs
                          " lignes

set scrolloff=3           " Affiche un minimum de 3 lignes autour du curseur
                          " (pour le scroll)

" -- Recherche
set ignorecase            " Ignore la casse lors d'une recherche
set smartcase             " Si une recherche contient une majuscule,
                          " re-active la sensibilite a la casse
set incsearch             " Surligne les resultats de recherche pendant la
                          " saisie
set hlsearch              " Surligne les resultats de recherche

set visualbell

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
set noerrorbells          " Empeche Vim de beeper
set belloff=all
" Active le comportement 'habituel' de la touche retour en arriere
set backspace=indent,eol,start

" Cache les fichiers lors de l'ouverture d'autres fichiers
set hidden
syntax enable

filetype on
filetype plugin on
filetype indent on

" Desactiver les touches directionnelles
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

"Installation automatig de vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endi

" Plug 'Rigellute/rigel'
call plug#begin('~/.vim/plugged')
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'luochen1990/rainbow'
Plug 'airblade/vim-gitgutter'
call plug#end()

let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
colorscheme challenger_deep
map , :Files<CR>
map <C-o> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
set noshowmode
set termguicolors

syntax match nonascii "[^\x00-\x7F]"
highlight nonascii guibg=Red ctermbg=2
hi! Normal ctermbg=NONE guibg=NONE
highlight LineNr ctermfg=NONE ctermbg=NONE guibg=NONE guifg=NONE

"set cc=80
set list listchars=tab:»·,trail:·

autocmd Filetype make setlocal noexpandtab
autocmd Filetype c setlocal tabstop=4 shiftwidth=4 softtabstop=0 noexpandtab
