local config_version = "2.0.2"

-- Creating a custom user command in 0.7
vim.api.nvim_create_user_command("ConfigVersion", function(args)
    print("Running neovim configuration version ", config_version)
end, {})
