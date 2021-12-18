-- Filetype specific configs
vim.cmd 'autocmd init_lua FileType help,qf,startuptime,checkhealth lua require("utils").quickClosePane()' -- 1st choice
