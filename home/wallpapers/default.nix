{ pkgs, config, ... }: {

  home.packages = with pkgs; [
    swaybg
  ];

  home.file."${config.xdg.configHome}/swaybg" = {
    source = ./.;
    recursive = true;
  };
}
