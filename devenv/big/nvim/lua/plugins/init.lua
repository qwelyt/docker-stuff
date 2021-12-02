local present, packer = pcall(require, "plugins.packerInit")


if not present then
    return false
end

local use = packer.use

return packer.startup(function()
    local plugin_status = require("core.utils").loadConfig().plugin_status

    use {
       "wbthomason/packer.nvim",
--       event = "VimEnter",
    }

    use {
       "nvim-lua/plenary.nvim",
    }
    

    use {
       "NvChad/nvim-base16.lua",
       after = "packer.nvim",
       config = function()
          require("colors").init()
       end,
    }
    
    use {
       "kyazdani42/nvim-web-devicons",
       after = "nvim-base16.lua",
       config = function()
          require "plugins.configs.icons"
       end,
    }
    
    use {
       "nvim-treesitter/nvim-treesitter",
       event = "BufRead",
       config = function()
          require "plugins.configs.treesitter"
       end,
    }

      -- git stuff
    use {
        "lewis6991/gitsigns.nvim",
        disable = not plugin_status.gitsigns,
        opt = true,
        config = function()
           require "plugins.configs.gitsigns"
        end,
        setup = function()
           require("core.utils").packer_lazy_load "gitsigns.nvim"
        end,
    }

     -- lsp stuff
    use {
        "kabouzeid/nvim-lspinstall",
        opt = true,
        after = "nvim-treesitter",
        --setup = function()
        --    require("core.utils").packer_lazy_load "nvim-lspinstall"
        --    -- reload the current file so lsp actually starts for it
        --    vim.defer_fn(function()
        --       vim.cmd "silent! e %"
        --    end, 0)
        -- end,
    }

    use {
        "neovim/nvim-lspconfig",
        after = "nvim-lspinstall",
        config = function()
            require "plugins.configs.lspconfig"
        end,
    }
end)
