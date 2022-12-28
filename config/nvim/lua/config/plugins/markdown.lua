-- mkdx configs

local config = function()

  vim.g.mkdx = {
    settings = {
      enter = {
        enable = 1,
        o = 1,
        shift = 0,
        shifto = 1,
        malformed = 1,
      },
      fold = { enable = 1 },
      highlight = { enable = 1 },
      links = {
        conceal = 1,
        external = { enable = 1 },
        fragment = { complete = 1 },
      },
      map = {
        enable = 1,
        prefix = '<localleader>'
      },
      gf_on_steroid = 1
    }
  }
end

return {
  'SidOfc/mkdx',
  ft = 'markdown',
  config = config,
}
