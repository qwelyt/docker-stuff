local present, packer = pcall(require, "packer")

if not present then
    local installer = require("plugins.packerInstaller")
    installer.installPacker()
    packer = require("packer")
end

return packer.startup(function()
    use {
        "wbthomason/packer.nvim",
    }
    use {
        "nvim-treesitter/nvim-treesitter",
         event = "BufRead",
    }
    use {
        "neovim/nvim-lspconfig",
        config = require("plugins.config.lspconfig")
    }
end)
