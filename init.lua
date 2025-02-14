vim.g.mapleader = " "
_G.is_android = vim.fn.getenv("ANDROID_ROOT") ~= vim.NIL
require("config.lazy")
require("config.common")
require("config.mappings")
require("config.checkupdates")
