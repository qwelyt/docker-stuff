local THIS = {}

THIS.init = function(theme)
    if not theme then
        theme = require("core.utils").loadConfig().ui.theme
    end

    local present, base16 = pcall(require, "base16")
    
    if present then
        base16(base16.themes(theme),true)
    else
        return false
    end
end

THIS.get = function(theme)
    if not theme then
        theme = require("core.utils").loadConfig().ui.theme
    end

    return require("colors.themes." .. theme)
end

return THIS
