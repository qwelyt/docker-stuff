local THIS = {}


THIS.map = function(modes, lhs, rhs, opts)
    local options = {noremap = true}

    if opts then options = vim.tbl_extend('force', options, opts) end

    for mode in modes:gmatch"." do
        vim.api.nvim_set_keymap(mode, lhs, rhs, options)
    end
end

return THIS
