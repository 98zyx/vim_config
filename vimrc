set number " 展示行号
set hlsearch "高亮搜索结果
set background=dark " 背景黑色
syntax enable

" 设置leader键为空格 
let mapleader = ' '
" 在insert模式下用空格+w保存
" inoremap <leader>w <Esc>:w<cr>


" 用<space>+h/j/k/l切换窗口
noremap <leader>h <C-w>h
noremap <leader>j <C-w>j
noremap <leader>k <C-w>k
noremap <leader>l <C-w>l
"打开新窗口
nnoremap <leader>vs :vs<CR><C-W>w
" 保存退出
nnoremap <leader>q :wq<CR>
" 保存
nnoremap <leader>w :w<cr>
" 保存+更新配置+安装插件
nnoremap <leader>sp :w<CR>:source<Space>~/.vimrc<CR>:PlugInstall<CR>


" nerdtree配置
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
nnoremap <leader>n :NERDTreeToggle<CR>
"查找当前文件的路径
nnoremap <leader>nf :NERDTreeFind<CR> 


" vim-plug插件管理配置
call plug#begin()
Plug 'mhinz/vim-startify' "启动页插件
Plug 'preservim/nerdtree' "目录管理
Plug 'vim-airline/vim-airline' "状态栏插件
Plug 'vim-airline/vim-airline-themes'
Plug 'yggdroot/indentLine' "缩进线插件
Plug 'w0ng/vim-hybrid' " 配色主题
Plug 'kien/ctrlp.vim' "模糊搜索文件
Plug 'easymotion/vim-easymotion' " 文件内快速定位
Plug 'tpope/vim-surround' " 操作成对
Plug 'rking/ag.vim' " 模糊搜索
Plug 'preservim/tagbar' "分析源码
" Use release branch (recommended)
Plug 'neoclide/coc.nvim', {'branch': 'release'} " C代码补全
call plug#end()

colorscheme hybrid " 使用hybrid配色主题, 放在plug后面

" ctrlp插件配置, <c-p>可以查找文件
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" easymotion插件配置, ss快速查找两个字符
nmap ss <Plug>(easymotion-s2)

" 代码补全
" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
" 记得设置CocConfig中suggest.noselect: true
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" 定义跳转与返回
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nnoremap <leader>] :vs<CR><C-]>
" nnoremap <leader>o <C-o>
let g:coc_disable_startup_warning = 1


" 分析源码
nnoremap <leader>t :TagbarToggle<CR>

