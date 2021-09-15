local opts = {
    -- Basic
    syntax = enable,
    mouse = "a",
    modelines = 1,

    -- Spaces and tabs
    tabstop = 4, -- Basically, turn tabs into spaces, and 4 of them.
    softtabstop= 4,
    expandtab = true,
    autoindent = true, -- And auto indent things
    smartindent = true,

    -- UI
    signcolumn = "yes",
    number = true, -- linenumbers
    showcmd = true, -- Show last command in lower right
    cursorline = true, -- Highlight current line
    ruler = true, -- RULER!!!
    wildmenu = true, -- visual autocomplete for command menu
    laststatus = 2, -- Always show statusline
    lazyredraw = true, -- Don't redraw during macros, a lot faster
    showmatch = true, -- highlight matching {[()]}
    pastetoggle = "<F11>", -- toggle betwen "INSERT" and "INSERT (paste)" with the F11 key

    -- Searching
    incsearch = true, -- Search as characters are endered (live search)
    hlsearch = true, -- Highlight matches
    ignorecase = true, -- case insensitive search
    smartcase = true, --   except when using capital letters

    -- QoL
    backup = true,
    writebackup = true,

}

for key,value in pairs(opts) do
        vim.o[key] = value
end
