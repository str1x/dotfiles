{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    rose-pine-hyprcursor
  ];
  home.file."${config.xdg.configHome}/hypr" = {
    source = ./.;
    recursive = true;
  };
}
