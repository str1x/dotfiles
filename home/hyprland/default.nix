{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    rose-pine-hyprcursor
    hyprshot
  ];
  home.file."${config.xdg.configHome}/hypr" = {
    source = ./.;
    recursive = true;
  };
}
