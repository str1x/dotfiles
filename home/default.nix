{ pkgs, config, ... }:

{
  home.username = "pepe";
  home.homeDirectory = "/home/pepe";

  imports = [
    ./pachca
    ./hyprland
    ./waybar
    ./rofi
  ];

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    neofetch
    fnm
    lazygit
    telegram-desktop
    dbeaver-bin
    sysbench
  ];

  home.file."${config.xdg.configHome}/kitty" = {
    source = ./kitty;
    recursive = true;
  };

  services.swaync = {
    enable = true;
  };

  programs.ssh = {
    enable = true;
    extraConfig = ''
      AddKeysToAgent yes

      Host github.com
      ForwardAgent yes
      IdentityFile ~/.ssh/id_github_ed25519
      IdentitiesOnly yes 

      Host *
      ForwardAgent yes
      IdentityFile ~/.ssh/id_ed25519_work
      IdentitiesOnly yes 
     '';
   };
 
   # basic configuration of git, please change to your own
   programs.git = {
     enable = true;
     userName = "Max Green";
     userEmail = "strixdevelop@gmail.ru";
     extraConfig = {
       core.editor = "vim";
     };
   };
 
   # starship - an customizable prompt for any shell
   programs.starship = {
     enable = true;
     # custom settings
     settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    initExtra = ''
      eval "$(fnm env --use-on-cd --shell bash)"
    '';
  };

  home.stateVersion = "25.05";
}
