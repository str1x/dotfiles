{ config, pkgs, lib, ... }: {
  # TODO fix impure error or manage secrets with agenix
  home.file."${config.xdg.configHome}/lazysql/config.toml".text = let
    secrets = lib.importJSON /home/pepe/.secrets/dbs.json;
    s1 = secrets.abAdminDB.preprod;
  in
  /* toml */ ''
    [[database]]
    Name = 'ab-admin-preprod'
    Provider =  'postgres'
    DBName = '${s1.dbname}'
    URL = 'postgres://${s1.user}:${s1.password}@${s1.host}:${s1.port}/${s1.dbname}'
  '';

  home.packages = with pkgs; [
    lazysql
  ];

}
