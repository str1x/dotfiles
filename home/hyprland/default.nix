{ config, ... }: {
  home.file."${config.xdg.configHome}/hypr" = {
    source = ./.;
    recursive = true;
  };
}
