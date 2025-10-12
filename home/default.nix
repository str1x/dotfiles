{ config, pkgs }:

{
  home.username = "pepe";
  home.homeDirectory = "/home/pepe";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    neofetch
  ];

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "Max Green";
    userEmail = "strixdevelop@gmail.ru";
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
