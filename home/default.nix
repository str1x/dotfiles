{ pkgs, ... }:

{
  home.username = "pepe";
  home.homeDirectory = "/home/pepe";

  # wayland.windowManager.hyprland.enable = true;

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    neofetch
  ];

  programs.waybar = {
    enable = true;
    settings = [{
      layer = "bottom";
      position = "bottom";
      modules-left = ["tray" "clock"];
    }];
  };

  programs.ssh = {
    enable = true;
    extraConfig = ''
      AddKeysToAgent yes

      Host github.com
      # allow to securely use local SSH agent to authenticate on the remote machine.
      # It has the same effect as adding cli option `ssh -A user@host`
      ForwardAgent yes
      # romantic holds my homelab~
      IdentityFile ~/.ssh/id_github_ed25519
      # Specifies that ssh should only use the identity file explicitly configured above
      # required to prevent sending default identity files first.
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
  };

  home.stateVersion = "25.05";
}
