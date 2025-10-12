{
  programs.nvf = {
    enable = true;
    
    # Your settings need to go into the settings attribute set
    # most settings are documented in the appendix
    settings = {
      # vim.enableLuaLoader = true;
      vim.startPlugins = [];
      vim.additionalRuntimePaths = [
         ./lua
      ];

     vim.viAlias = false;
     vim.vimAlias = true;
     vim.options.tabstop = 2;
     vim.filetree.nvimTree.enable = true;
     # theme
     vim.statusline.lualine.enable = true;
     vim.theme.enable = true;
     vim.theme.name = "everforest";
     vim.theme.style = "medium";
     vim.mini.notify.enable = true;
     # lsp
     vim.lsp = {
       enable = true;
     };
     vim.languages.nix.enable = true;
     vim.languages.lua.enable = true;

    };
  };
}
