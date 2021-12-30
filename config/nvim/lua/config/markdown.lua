-- mkdx configs

vim.g.mkdx = {
  settings = {
    enter = {
      enable = 1,
      shift = 1
    },
    fold = { enable = 1 },
    highlight = { enable = 1 },
    links = {
      fragment = { complete = 1 },
      external = { enable = 1 }
    },
    map = {
      enable = 1,
      prefix = '<localleader>'
      },
    gf_on_steroid = 1
  }
}
