-- colorscheme catppuccin
return { 
    "catppuccin/nvim", 
    name = "catppuccin",
    priority = 1000,
    config = function()
        -- catppuccin
        require("catppuccin").setup()
        vim.cmd([[ colorscheme catppuccin ]])
    end
}

-- return {
--   {
--     "bluz71/vim-nightfly-guicolors",
--     priority = 1000, -- make sure to load this before all the other start plugins
--     config = function()
--       -- load the colorscheme here
--       vim.cmd([[colorscheme nightfly]])
--     end,
--   },
-- }
