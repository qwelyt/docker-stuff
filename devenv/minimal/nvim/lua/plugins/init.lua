local present, packer = pcall(require, "plugins.packerInit")

if not present then
   return false
end

local use = packer.use

return packer.startup(function()

   -- this is arranged on the basis of when a plugin starts

   use {
      "wbthomason/packer.nvim",
      event = "VimEnter",
   }
end)
