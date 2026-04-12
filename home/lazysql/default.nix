{ config, pkgs, lib, ... }: {
  # TODO fix impure error or manage secrets with agenix
  home.file."${config.xdg.configHome}/lazysql/config.toml".text = let
    secrets = lib.importJSON /home/pepe/.secrets/dbs.json;
    s1 = secrets.abAdminDB.preprod;
    s2 = secrets.abAdminDB.stand;
  in
  /* toml */ ''
    [[database]]
    Name = 'ab-admin-preprod'
    Provider =  'postgres'
    DBName = '${s1.dbname}'
    URL = 'postgres://${s1.user}:${s1.password}@${s1.host}:${s1.port}/${s1.dbname}'
    [[database]]
    Name = 'ab-admin-stand'
    Provider =  'postgres'
    DBName = '${s2.dbname}'
    URL = 'postgres://${s2.user}:${s2.password}@${s2.host}:${s2.port}/${s2.dbname}?sslmode=disable'
  '';

  home.packages = with pkgs; [
    lazysql
  ];
}
