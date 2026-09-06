return {
  'nvim-orgmode/orgmode',
  event = 'VeryLazy',
  ft = { 'org' },
  config = function()
    -- Setup orgmode
    require('orgmode').setup({
      org_agenda_files = '~/dox/orgfiles/**/*',
      org_default_notes_file = '~/dox/orgfiles/refile.org',
      })
    

    -- Experimental LSP support
    vim.lsp.enable('org')--
  end,
}
