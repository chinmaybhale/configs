" disabling autoindent by any other plugin
let g:polyglot_disabled = ['autoindent']

call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kdheepak/tabline.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'sheerun/vim-polyglot'
Plug '907th/vim-auto-save'
Plug 'ludovicchabant/vim-gutentags'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'

call plug#end()

" line number and syntax stuff
set number relativenumber
set noshowmode
syntax on

" indentation specific settings
set shiftwidth=4
set softtabstop=4

" colorscheme specific settings
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
set background=dark
let g:gruvbox_italic=1
set list
let g:gruvbox_invert_indent_guides=1
colorscheme gruvbox

" coc-nvim settings
source ~/.config/nvim/coc-settings.vim
"inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"inoremap <silent><expr> <C-x><C-z> coc#pum#visible() ? coc#pum#stop() : "\<C-x>\<C-z>"
"" remap for complete to use tab and <cr>
"inoremap <silent><expr> <TAB>
"		\ coc#pum#visible() ? coc#pum#next(1):
"		\ <SID>check_back_space() ? "\<Tab>" :
"		\ coc#refresh()
"inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
"inoremap <silent><expr> <c-space> coc#refresh()

hi CocSearch ctermfg=12 guifg=#18A3FF
hi CocMenuSel ctermbg=109 guibg=#13354A
" auto save
let g:auto_save = 1
let g:auto_save_events = ["InsertLeave"]

" Python3 environemt
let g:python3_host_prog="/opt/homebrew/bin/python3"


" lualine statusline
lua << END

--use {
--		'kdheepak/tabline.nvim',
--		config = function()
--				require'tabline'.setup {enable = false}
--		end,
--		requires = {'hoob3rt/lualine.nvim', 'kyazdani42/nvim-web-devicons'}
--}

require'tabline'.setup {
		enable = true,
		options = {
				section_separators = {' ', ' '},
				component_separators = {' ', ' '}
		}
}

require'lualine'.setup {
  options = {
    icons_enabled = false,
    theme = 'gruvbox-material',
    component_separators = { left = ' ', right = ' '},
    section_separators = { left = ' ', right = ' '},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename', 'coc#status', 'b:coc_current_function'},
    lualine_x = {'encoding','fileformat','filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
 tabline = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {require'tabline'.tabline_buffers},
    lualine_x = {require'tabline'.tabline_tabs},
    lualine_y = {},
    lualine_z = {}
  }, 
  extensions = {}
}


-- OR setup with some options
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

END
