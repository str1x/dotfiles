{ pkgs, ... }: let
  pname = "Pachca";
  version = "latest";
  src = pkgs.fetchurl {
    url = "https://install.pachca.com/linux/appImage/x64";
    sha256 = "sha256-hbH+jXbiyQ7vi3Oo7wIp2KyCNcMlbGxGYjAsW+kDst8=";
  };
  appimageContents = pkgs.appimageTools.extract {inherit pname version src;};
in {
  home.packages = with pkgs; [
    (appimageTools.wrapType2 {
      inherit pname version src;
    })
  ];

  home.file.".local/share/icons/${pname}.png".source = "${appimageContents}/${pname}.png";

  xdg.desktopEntries.Pachca = {
    name = "${pname}";
    exec = "${pname}";
    icon = "${pname}";
  };
}
