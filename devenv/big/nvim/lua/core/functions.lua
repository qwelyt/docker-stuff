local THIS = {}

THIS.relativenumbertoggle = function ()
        vim.o[relativenumber] = "relativenumber!"
end

return THIS
