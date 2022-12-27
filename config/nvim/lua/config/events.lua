-- Autocmd events configs

local autocmd = require('utils').autocmd

-- Restore cursor position https://github.com/vim/vim/blob/18f4740f043b353abe47b7a00131317052457686/runtime/defaults.vim#L100-L112
autocmd('nvimStartup', [[BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit' | exe "normal! g`\"" | endif ]], true)

autocmd('focus_lost', [[FocusLost * silent! noautocmd up]], true) -- Save when lose focus
autocmd('focus_gain', [[FocusGained * silent! noautocmd checktime]], true) -- Check if file changed outside vim & re-read file
autocmd('yank', [[TextYankPost * silent! lua vim.highlight.on_yank()]], true) -- Highlight on yank
autocmd('term', [[TermOpen * startinsert! | setlocal nonu nornu signcolumn=no ft=terminal ]], true) -- Start terminal in insert mode

-- Re-source configs on save!
autocmd('nvim_configs', [[BufWritePost *nvim/**.lua :source <afile>]], true)

-- Show listchars on insert mode
autocmd('i_list', { [[InsertEnter * setl list | IndentBlanklineEnable]],
  [[InsertEnter * lua vim.diagnostic.hide()]] }, true)
autocmd('n_list', { [[InsertLeave * setl nolist | IndentBlanklineDisable]],
  [[InsertLeave * lua vim.diagnostic.show()]] }, true)

--[[ Filetypes autocmds ]]--

autocmd('ft_qfx', [[FileType help,qf,startuptime,checkhealth,lspinfo lua require('utils').quickClosePane()]], true) -- Add `q` to quickly close this filetypes
autocmd('ft_lua', [[FileType lua let b:surround_70 = "function () \r end"]], true) -- add inline function surround in lua
autocmd('ft_git', [[FileType gitcommit,NeogitCommitMessage setl nocindent spell]], true) -- Disable `cindent` for `gitcommit`

autocmd('ft_nfo', {
  'BufReadPre,FileReadPre *.nfo set ft=nfo',
  'FileType nfo setl fileencodings=cp437,utf-8 nonu nornu',
  'FileType nfo highlight clear ExtraWhitespace',
}, true)

autocmd('ft_mdx', [[FileType markdown setlocal spell]], true)

-- PHP Configurations
autocmd('ft_php', [[FileType php,blade setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab]], true)

-- auto close nvimtree/neogit if it's the last window
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and (vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil or vim.api.nvim_buf_get_name(0):match("NeogitStatus") ~= nil) then
      vim.cmd "quit"
    end
  end
})

--[[ TODO: Deal with this later

" Get rid of trailing whitespace highlighting in mutt.
autocmd FileType mail highlight clear ExtraWhitespace
autocmd FileType mail setlocal listchars=

" Reformat XML files
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"

" Crontab auto-commands
autocmd FileType crontab setlocal backupcopy=yes

" Ruby Configurations
autocmd filetype ruby setlocal noexpandtab shiftwidth=2 tabstop=2

" HTML configurations
" autocmd FileType html setlocal shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab
autocmd FileType html,markdown set omnifunc=htmlcomplete#CompleteTags
au BufNewFile,BufReadPost *.html setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" CSS configurations
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
au BufNewFile,BufReadPost *.css setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" Javascript configurations
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType javascript setlocal omnifunc=tern#Complete
" autocmd FileType javascript setlocal colorcolumn=80
au BufNewFile,BufReadPost *.js setlocal shiftwidth=2 expandtab
" autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

" Coffeescript configurations
" autocmd FileType coffeescript setlocal colorcolumn=100
au BufNewFile,BufReadPost *.coffee setlocal foldmethod=indent shiftwidth=2 expandtab

" Python configurations
autocmd FileType python setlocal foldmethod=indent shiftwidth=4 expandtab tabstop=4 softtabstop=4
" autocmd FileType python setlocal colorcolumn=80
" autocmd FileType python map <buffer> <F4> :call Flake8()<CR>
" autocmd FileType python autocmd BufWritePre * :%s/\s\+$//e
" autocmd FileType python set omnifunc=pythoncomplete#Complete

" JSONc config
autocmd FileType json syntax match Comment +\/\/.\+$+

--]]
