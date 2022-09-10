vim.g.mapleader=" "
require('base')
require('highlights')
require('maps')
require('macos')
require('plugins')

local has = function(x)
  return vim.fn.has(x) == 1
end
