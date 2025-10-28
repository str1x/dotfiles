{ config, pkgs, ... }: {
  home.packages = with pkgs; [ waybar ];

  home.file."${config.xdg.configHome}/waybar" = {
    source = ./.;
    recursive = true;
  };
}
