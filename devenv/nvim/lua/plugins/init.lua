local present, packer = pcall(require, "plugins.packerInit")

if not present then
    print "Unable to find packer"
    return false
end

return packer.startup(function()
    use {
        "wbthomason/packer.nvim",
    }
end)
