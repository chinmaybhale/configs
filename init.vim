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
Plug 'dhananjaylatkar/cscope_maps.nvim'
Plug 'folke/which-key.nvim' 

call plug#end()

" line number and syntax stuff
set number relativenumber
set noshowmode
syntax on

" indentation specific settings
set noexpandtab
set tabstop=4
set shiftwidth=0
set softtabstop=0
set smarttab

" colorscheme specific setting
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
set background=dark
let g:gruvbox_italic=1
set list
let g:gruvbox_invert_indent_guides=1
colorscheme gruvbox

" coc-nvim settings
source ~/.config/nvim/coc-settings.vim

hi CocSearch ctermfg=12 guifg=#18A3FF
hi CocMenuSel ctermbg=109 guibg=#13354A

" auto save
set noswapfile
"set nobackup
"set nowritebackup
let g:auto_save = 1
let g:auto_save_events = ["InsertLeave"]

" Python3 environemt
let g:python3_host_prog="/opt/homebrew/bin/python3"


" set global clipboard
"set clipboard=unnamedplus

" lualine statusline
lua << END

require("cscope_maps")

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


vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

require"nvim-tree".setup{
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
}

END
