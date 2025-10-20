{ config, pkgs, ... }: {
  home.file."${config.xdg.configHome}/rofi" = {
    source = ./.;
    recursive = true;
  };

  home.packages = with pkgs; [
    rofi
  ];
}
