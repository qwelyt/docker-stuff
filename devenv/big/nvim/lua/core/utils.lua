local THIS = {}

-- bool arg - force relead or not
THIS.loadConfig = function(reload)
    return {
        ui = {
            theme = "javacafe",
        },
        plugin_status = {
            gitsigns = true,
        }
    }
end

THIS.map = function(modes, lhs, rhs, opts)
    local options = {noremap = true}

    if opts then options = vim.tbl_extend('force', options, opts) end

    for mode in modes:gmatch"." do
        vim.api.nvim_set_keymap(mode, lhs, rhs, options)
    end
end


-- load plugin after entering vim ui
THIS.packer_lazy_load = function(plugin, timer)
   if plugin then
      timer = timer or 0
      vim.defer_fn(function()
         require("packer").loader(plugin)
      end, timer)
   end
end

return THIS
