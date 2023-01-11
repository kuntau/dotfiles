-- ▄▀█ █░█ ▀█▀ █▀█ █▀▀ █▀▄▀█ █▀▄ █▀
-- █▀█ █▄█ ░█░ █▄█ █▄▄ █░▀░█ █▄▀ ▄█

local autocmd = require('utils').autocmd

-- Restore cursor position https://github.com/vim/vim/blob/18f4740f043b353abe47b7a00131317052457686/runtime/defaults.vim#L100-L112
autocmd('nvimStartup', [[BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit' | exe "normal! g`\"" | endif ]], true)
autocmd('focus_gain', [[FocusGained * silent! noautocmd checktime]], true) -- Check if file changed outside vim & re-read file
autocmd('focus_lost', [[FocusLost * silent! noautocmd up]], true) -- Save when lose focus
autocmd('yank', [[TextYankPost * silent! lua vim.highlight.on_yank()]], true) -- Highlight on yank
autocmd('term', [[TermOpen term://* startinsert! | setl nonu nornu signcolumn=no]], true) -- Start terminal in insert mode
autocmd('remember_folds', {
  [[BufWinLeave *.* mkview]],
  [[BufWinEnter *.* silent! loadview]],
}, true)

-- autocmd('nvim_configs', [[BufWritePost *nvim/**.lua :source <afile>]], true) -- Re-source configs on save!

-- Show listchars in insert mode only only ft with extensions
autocmd('i_list', { [[InsertEnter *.* setl list | IndentBlanklineEnable]],
  [[InsertEnter *.* lua vim.diagnostic.hide()]] }, true)
autocmd('n_list', { [[InsertLeave *.* setl nolist | IndentBlanklineDisable]],
  [[InsertLeave *.* lua vim.diagnostic.show()]] }, true)

-- auto close nvimtree/neogit if it's the last window
vim.api.nvim_create_autocmd('BufEnter', {
  nested = true,
  callback = function()
    local buf_to_check = { 'NvimTree_', 'NeogitStatus', 'NeogitCommitMessage', 'Outline' }
    if #vim.api.nvim_list_wins() == 1
        and (
        vim.api.nvim_buf_get_name(0):match('NvimTree_') ~= nil
            or vim.api.nvim_buf_get_name(0):match('NeogitStatus') ~= nil
        )
    then
      vim.cmd('quit')
    end
  end,
})

-- █▀▀ █ █░░ █▀▀ ▀█▀ █▄█ █▀█ █▀▀
-- █▀░ █ █▄▄ ██▄ ░█░ ░█░ █▀▀ ██▄

autocmd('ft_qfx', [[FileType help,qf,startuptime,checkhealth,lspinfo lua require('utils').quick_close_pane()]], true) -- Add `q` to quickly close this filetypes
autocmd('ft_lua', [[FileType lua let b:surround_70 = "function () \r end"]], true) -- add inline function surround in lua
autocmd('ft_git', [[FileType gitcommit,NeogitCommitMessage setl nocindent spell ft=gitcommit]], true) -- Disable `cindent` for `gitcommit`

autocmd('ft_nfo', {
  'BufReadPre,FileReadPre *.nfo set ft=nfo',
  'FileType nfo setl fileencodings=cp437,utf-8 nonu nornu',
  'FileType nfo highlight clear ExtraWhitespace',
}, true)

autocmd('ft_mdx', [[FileType markdown setl spell]], true)

-- PHP Configurations
autocmd('ft_php', [[FileType php,blade setl shiftwidth=4 tabstop=4 softtabstop=4 expandtab]], true)

-- Python configurations
autocmd('ft_python', {
  [[FileType python setl foldmethod=indent shiftwidth=4 expandtab tabstop=4 softtabstop=4]],
  [[FileType python setl colorcolumn=120]],
  [[FileType python map <buffer> <F4> <cmd>Format<cr>]],
}, true)

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
