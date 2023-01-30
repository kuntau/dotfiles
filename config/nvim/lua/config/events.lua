-- ▄▀█ █░█ ▀█▀ █▀█ █▀▀ █▀▄▀█ █▀▄ █▀
-- █▀█ █▄█ ░█░ █▄█ █▄▄ █░▀░█ █▄▀ ▄█

local autocmd = require('utils').autocmd

-- Restore cursor position https://github.com/vim/vim/blob/18f4740f043b353abe47b7a00131317052457686/runtime/defaults.vim#L100-L112
autocmd('nvim_start', { 'BufReadPost', nil, [[if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit' | exe "normal! g`\"" | endif ]] }, 'Restore cursor position')
autocmd('focus_gain', { 'FocusGained', nil, 'silent! noautocmd checktime' }, 'Reload file if changed outside of vim')
autocmd('focus_lost', { 'FocusLost', nil, 'silent! noautocmd up' }, 'Save on focus lost')
autocmd('remember_folds', {
  { 'BufWinLeave', '*.*', 'mkview' },
  { 'BufWinEnter', '*.*', 'silent! loadview' },
})

-- autocmd('set_terminal', { 'TermOpen', 'term://*', 'startinsert! | setl nonu nornu scl=no ft=terminal' }, 'Setting terminal buffer') -- NOTE: set by `BufTerm` for now
-- autocmd('nvim_configs', { 'BufWritePost', '*nvim/**.lua', ':source <afile>' }) -- Re-source configs on save! NOTE: not compatible with Lazy

-- Show listchars in insert mode only only ft with extensions
autocmd('insert_enter', {
  { 'InsertEnter', '*.*', function()
    vim.cmd('setl list nornu | IndentBlanklineEnable')
    vim.diagnostic.hide()
  end },
  { 'InsertLeave', '*.*', function()
    vim.cmd('setl nolist rnu | IndentBlanklineDisable')
    vim.diagnostic.show()
  end }
})

-- auto close nvimtree/neogit if it's the last window
autocmd('autoclose_last_window', { 'BufEnter', nil, function(res)
  local buf_to_check = { 'NvimTree_', 'NeogitStatus', 'NeogitCommitMessage', 'OUTLINE', 'aerial' }
  if #vim.api.nvim_list_wins() == 1 then
    for _, buf_name in ipairs(buf_to_check) do
      if res.match:match(buf_name) ~= nil then
        vim.cmd('quit')
      end
    end
  end
end, { nested = true }
})

-- █▀▀ █ █░░ █▀▀ ▀█▀ █▄█ █▀█ █▀▀
-- █▀░ █ █▄▄ ██▄ ░█░ ░█░ █▀▀ ██▄

autocmd('ft_nfo', { { 'BufReadPre', 'FileReadPre' }, '*.nfo', 'setl ft=nfo' })
autocmd('ft_settings', {
  { 'FileType', { 'help', 'qf', 'startuptime', 'checkhealth', 'lspinfo' }, function() require('utils').quick_close_pane() end },
  { 'FileType', 'nfo', {
    'setl fileencodings=cp437,utf-8 nonu nornu',
    'hi clear ExtraWhitespace',
  } },
  { 'FileType', 'python', {
    'setl foldmethod=indent shiftwidth=4 tabstop=4 softtabstop=4 expandtab',
    'setl colorcolumn=120',
  } },
  { 'FileType', { 'php', 'blade' }, 'setl shiftwidth=4 tabstop=4 softtabstop=4 expandtab' },
  { 'FileType', { 'gitcommit', 'NeogitCommitMessage' }, 'setl nocindent spell ft=gitcommit' },
  { 'FileType', { 'FTerm', 'BufTerm' }, 'setl nonu nornu scl=no' },
  { 'FileType', 'markdown', 'setl spell' },
})

autocmd('class_conceal', {
  { 'BufEnter', 'BufWritePost', 'TextChanged', 'InsertLeave' },
  { '*.html', '*.vue' },
  function(args)
    require('utils.conceal').html_class(args.buf)
  end,
})

-- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation
-- vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
--   group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
--   callback = function()
--     vim.opt.foldmethod     = 'expr'
--     vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
--   end
-- })

--[[ TODO: Deal with this later

" Get rid of trailing whitespace highlighting in mutt.
autocmd FileType mail highlight clear ExtraWhitespace
autocmd FileType mail setl listchars=

" Reformat XML files
autocmd FileType xml setl omnifunc=xmlcomplete#CompleteTags
au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"

" Crontab auto-commands
autocmd FileType crontab setl backupcopy=yes

" Ruby Configurations
autocmd filetype ruby setl noexpandtab shiftwidth=2 tabstop=2

" HTML configurations
" autocmd FileType html setl shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab
autocmd FileType html,markdown set omnifunc=htmlcomplete#CompleteTags
au BufNewFile,BufReadPost *.html setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" CSS configurations
autocmd FileType css setl omnifunc=csscomplete#CompleteCSS
au BufNewFile,BufReadPost *.css setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" Javascript configurations
autocmd FileType javascript setl omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType javascript setl omnifunc=tern#Complete
" autocmd FileType javascript setl colorcolumn=80
au BufNewFile,BufReadPost *.js setl shiftwidth=2 expandtab
" autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

" Coffeescript configurations
" autocmd FileType coffeescript setl colorcolumn=100
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent shiftwidth=2 expandtab

" JSONc config
autocmd FileType json syntax match Comment +\/\/.\+$+

--]]
