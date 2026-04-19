{ config, pkgs, ... }: {
  home.file."${config.xdg.configHome}/yazi" = {
    source = ./.;
    recursive = true;
  };

  home.packages = with pkgs; [
    yazi
  ];
}
