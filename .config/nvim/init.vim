call plug#begin()
Plug 'numToStr/Comment.nvim'
Plug 'godlygeek/tabular'
Plug 'janko/vim-test'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'mbbill/undotree'
" Plug 'simnalamburt/vim-mundo'
Plug 'psliwka/vim-smoothie'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'sainnhe/sonokai'
Plug 'liuchengxu/vista.vim'
Plug 'hoob3rt/lualine.nvim'
Plug 'ap/vim-buftabline'
"Plug 'nacro90/numb.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'sheerun/vim-polyglot'
call plug#end()

" filetype plugin indent on

set termguicolors
let g:sonokai_style = 'shusia'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 0
colorscheme sonokai

lua << EOF
-- require('numb').setup()
require('Comment').setup()
require('lualine').setup{
  options = {
    theme = 'gruvbox',
    section_separators = {'', ''},
    component_separators = {'', ''},
    icons_enabled = true,
  },
  sections = {
    lualine_a = { {'mode', upper = false} },
    lualine_b = { {'branch', icon = ''} },
    lualine_c = { {'filename', file_status = true, path = 1} },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location'  },
  },
  inactive_sections = {
    lualine_a = {  },
    lualine_b = {  },
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {  },
    lualine_z = {   }
  },
  extensions = { 'fzf' }
}
require('nvim-treesitter.configs').setup{
  ensure_installed = "maintained",
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true
  },
  indent = {
    enable = false,
    -- disable = { "typescript" }
  }
}
require('telescope').setup{
  defaults = {
    file_ignore_patterns = {
      "assets/*",
      "node_modules/*",
      "lib/*",
      "xcf/*",
      "package-lock.json"
    }
  },
  pickers = {
    live_grep = {
      file_ignore_patterns = {
        "assets/*",
        "node_modules/*",
        "lib/*",
        "xcf/*",
        "package-lock.json"
      }
    }
  }
}
EOF

" syntax on
set hidden
"set formatoptions=jcroql
set formatoptions=jcql
set undofile
set undolevels=2000
set nohlsearch
set timeoutlen=1000
set ttimeoutlen=0
set tabstop=2
set shiftwidth=2
" set tabstop=4
" set shiftwidth=4
set expandtab
set smarttab
set ignorecase
set smartcase
set mouse=n
set number
set relativenumber
" set autoindent
set showmatch
set iskeyword+=- " TODO: put this in a ftdetect/css.vim or something
set indentkeys+=0. " TODO: put this in ftdetect for JS/TS
set inccommand=nosplit

let g:vim_markdown_folding_disabled = 1
let python_highlight_all = 1
let NERDTreeQuitOnOpen = 1
" let g:mundo_preview_bottom = 1

" This next part lets me use K to get coc to show info on the expression under
" the cursor, unless we're in a vim file or a help page, where K will search
" for the expression in vim help pages.
set keywordprg=:call\ CocActionAsync('doHover')
augroup VimHelp
  autocmd!
  autocmd Filetype vim,help setlocal keywordprg=:help
augroup END

" tom's custom mapping
let mapleader=" "
inoremap jj <Esc>
inoremap jk <Esc>
inoremap <F1> <Esc>

nnoremap <Leader>mm :set mouse=<CR>
nnoremap <Leader>mn :set mouse=n<CR>

nnoremap <Leader>u :UndotreeToggle<CR>

" Symbol renaming.
" nmap <Leader>rn <Plug>(coc-rename)

" Use <C-l> for trigger snippet expand.
" imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
" vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder.
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder.
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
" imap <C-j> <Plug>(coc-snippets-expand-jump)

" nnoremap <Leader>a :Ag<CR>
"
" " Find files using Telescope command-line sugar.
" nnoremap <C-p> <cmd>Telescope find_files<CR>
" nnoremap <Leader>ff <cmd>Telescope find_files<CR>
" nnoremap <Leader>fg <cmd>Telescope live_grep<CR>
" nnoremap <Leader>fb <cmd>Telescope buffers<CR>
" nnoremap <Leader>fh <cmd>Telescope help_tags<CR>

" Using lua functions
nnoremap <Leader>ff <cmd>lua require('telescope.builtin').find_files()<CR>
nnoremap <Leader>fg <cmd>lua require('telescope.builtin').live_grep()<CR>
nnoremap <Leader>fb <cmd>lua require('telescope.builtin').buffers()<CR>
" nnoremap <Leader>fh <cmd>lua require('telescope.builtin').help_tags()<CR>
nnoremap <Leader>fh <cmd>lua require('telescope.builtin').find_files({ hidden=true })<CR>
" TODO: figure out how to toggle ignoring files in .gitignore

nnoremap <Leader>cr :CocRestart<CR>

nnoremap <Leader>mn :TestNearest<CR>
nnoremap <Leader>mf :TestFile<CR>
nnoremap <Leader>ms :TestSuite<CR>
nnoremap <Leader>ml :TestLast<CR>
nnoremap <Leader>mg :TestVisit<CR>

nnoremap <Leader>n :set relativenumber!<CR>

nnoremap <Leader>ve :e ~/.config/nvim/init.vim<CR>
nnoremap <Leader>vz :e ~/.zshrc<CR>
nnoremap <Leader>vi :e ~/.config/i3/config<CR>
nnoremap <Leader>vh :e ~/.zsh_history<CR>
nnoremap <Leader>vs :source ~/.config/nvim/init.vim<CR>

nnoremap <Leader>t :NERDTreeToggle<CR>
nnoremap <Leader>o :Vista!!<CR>
nnoremap <Leader>hl :set hlsearch!<CR>
nnoremap <Leader>w : set wrap!<CR>

nnoremap <Leader>b :buffers<CR>
nnoremap <Leader>H :tabprev<CR>
nnoremap <Leader>L :tabnext<CR>
nnoremap L :bnext<CR>
nnoremap H :bprev<CR>
nnoremap <Leader>q :bd<CR>
nnoremap <Leader>wq :w<CR> :bd<CR>

nnoremap <Leader>lr :!pdflatex %<CR>

nnoremap <Leader>sb vi}
nnoremap <Leader>sp vi)

" Quickly restart CoC
nnoremap <Leader>cr :CocRestart<CR>

" Scrolling line by line is slow
nnoremap <C-e> 10<C-e>
nnoremap <C-y> 10<C-y>
vnoremap <C-e> 10<C-e>
vnoremap <C-y> 10<C-y>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Search without special symbols
nnoremap <Leader>/ /\V
nnoremap <Leader>? ?\V

nnoremap Q :echo "I don't like ex mode."<CR>

" commands related to nvim terminal
autocmd BufEnter term://* startinsert
" nnoremap <Leader>nt :new<CR>:term<CR>
" tnoremap <C-w> <C-\><C-n>
" tnoremap <C-p> !!<Space>
" tnoremap <C-h> <C-\><C-n><C-w>h
" tnoremap <C-j> <C-\><C-n><C-w>j
" tnoremap <C-k> <C-\><C-n><C-w>k
" tnoremap <C-l> <C-\><C-n><C-w>l

function! ToggleConcealLevel()
    if &conceallevel == 0
        setlocal conceallevel=2
    else
        setlocal conceallevel=0
    endif
endfunction

let g:tsuquyomi_completion_detail = 1

" let g:ycm_server_keep_logfiles = 1
" let g:ycm_server_log_level = 'debug'
"
" Trigger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None<Paste>

let g:ycm_autoclose_preview_window_after_insertion = 1

let g:ctrlp_custom_ignore = '\v[\/](\.git|node_modules|dist|lib|target|public|package-lock.json)$'

" CoC bindings
nnoremap <Leader>d :CocDiagnostics<CR>
nmap g. <Plug>(coc-diagnostic-next)
nmap g, <Plug>(coc-diagnostic-prev)
nmap ge <Plug>(coc-declaration)
nmap gd <Plug>(coc-definition)
nmap gr <Plug>(coc-refactor)
nmap g= <Plug>(coc-format)
nmap g* <Plug>(coc-references)

" Rainbow parens
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

au BufNewFile,BufRead *.boot set filetype=clojure

" "word processor" mode stuff
func! WordProcessor()
  " movement changes
  " map j gj
  " map k gk
  " formatting text
  setlocal formatoptions=1
  "setlocal noexpandtab
  setlocal wrap
  setlocal linebreak
  " spelling and thesaurus
  "setlocal spell spelllang=en_us
  "set thesaurus+=/home/test/.vim/thesaurus/mthesaur.txt
  " complete+=s makes autocompletion search the thesaurus
  "set complete+=s
endfu
com! WP call WordProcessor()
nnoremap <Leader>wp :WP<CR>

let g:vista_default_executive = "coc"

command! -nargs=0 Prettier :CocCommand prettier.formatFile
nnoremap <Leader>p :Prettier<CR>

" Map tab to completion hotkey except when entering whitespace.
" from https://vim.fandom.com/wiki/Smart_mapping_for_tab_completion
" function! Smart_TabComplete()
"   let line = getline('.')                         " current line

"   let substr = strpart(line, -1, col('.')+1)      " from the start of the current
"                                                   " line to one character right
"                                                   " of the cursor
"   let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
"   if (strlen(substr)==0)                          " nothing to match on empty string
"     return "\<tab>"
"   endif
"   let has_period = match(substr, '\.') != -1      " position of period, if any
"   let has_slash = match(substr, '\/') != -1       " position of slash, if any
"   if (!has_period && !has_slash)
"     return "\<C-X>\<C-P>"                         " existing text matching
"   elseif ( has_slash )
"     return "\<C-X>\<C-F>"                         " file matching
"   else
"     return "\<C-X>\<C-O>"                         " plugin matching
"   endif
" endfunction

" inoremap <Tab> <C-r>=Smart_TabComplete()<CR>

command! -nargs=0 FiletypeReact :set filetype=typescriptreact

" from https://jamesdixon.dev/posts/a-minimal-vimrc/
augroup general
    autocmd!
    "keep equal proportions when windows resized
    autocmd VimResized * wincmd =
    "save cursor position in a file
    " autocmd BufReadPost * if line("'\"") > 1 && line("'\"")
    "             \ <= line("$") | exe "normal! g'\"" | endif
augroup END

" mappings for diff mode
if &diff
    map <Leader>1 :diffget LOCAL<CR>
    map <Leader>2 :diffget BASE<CR>
    map <Leader>3 :diffget REMOTE<CR>
endif

let g:coc_disable_transparent_cursor = 1
" let g:coc_enable_locationlist = 0
" autocmd User CocLocationsChange call setloclist(0, g:coc_jump_locations) | lwindow

" https://github.com/coc-extensions/coc-omnisharp/issues/53#issuecomment-800489995
" Toggle duplicate LS sources
function Disable_ls_duplicates()
" :call CocAction('toggleSource', 'cs-1')
:call CocAction('toggleSource', 'cs-2')
:call CocAction('toggleSource', 'cs-3')
:call CocAction('toggleSource', 'cs-4')
endfunction

" Map the function call
nnoremap <Leader>dld :call Disable_ls_duplicates()

