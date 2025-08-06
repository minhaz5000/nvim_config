-- VimTex Plugin for LaTeX
return {
  'lervag/vimtex',
  lazy = false,
  init = function()
    vim.g.vimtex_compiler_latexmk = {
      options = {
        '-shell-escape',
        '-verbose',
        '-file-line-error',
        '-synctex=1',
        '-interaction=nonstopmode',
      },
    }
    vim.g.vimtex_compiler_latexmk_engines = {
      ['_'] = '-xelatex',
    }

    -- Enable automatic compilation on save and related behaviors
    vim.g.vimtex_autocompile = 1
    vim.g.vimtex_compiler_latexmk_callback = 1
    vim.g.vimtex_compiler_latexmk_continuous = 1
    vim.g.vimtex_compiler_latexmk_on_insert_leave = 1

    vim.g.vimtex_indent_enabled = 0
    -- Uncomment if you want to disable default mappings
    -- vim.g.vimtex_mappings_enabled = 0
    vim.g.vimtex_imaps_enabled = 0

    vim.g.vimtex_syntax_conceal_disable = 0
    vim.opt.conceallevel = 2
    -- vim.opt.concealcursor = 'nc'

    vim.g.vimtex_fold_enabled = 1
    vim.g.texconceal = 'abdmg'
    vim.g.vimtex_delim_stopline = 50

    vim.g.vimtex_delim_toggle_mod_list = {
      { '\\left', '\\right' },
      { '\\big', '\\big' },
    }

    vim.g.vimtex_quickfix_mode = 0
    vim.g.vimtex_quickfix_open_on_warning = 0
    vim.g.vimtex_quickfix_ignore_filters = {
      'LaTeX hooks Warning',
      'Underfull \\hbox',
      'Overfull \\hbox',
      'LaTeX Warning: .+ float specifier changed to',
      'Package siunitx Warning: Detected the "physics" package:',
      'Package hyperref Warning: Token not allowed in a PDF string',
      'Fatal error occurred, no output PDF file produced!',
    }

    vim.g.vimtex_view_method = 'sioyek'
    -- vim.g.vimtex_view_method = 'zathura_simple'
    -- vim.g.vimtex_view_general_viewer = 'okular'
    -- vim.g.vimtex_view_general_options = '--unique file:@pdf\\#src:@line@tex'
  end,
}
