return {
  "RRethy/vim-illuminate",
  event = 'LspAttach',
  config = function ()
    require('illuminate').configure {}
  end
}
