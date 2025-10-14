{ pkgs, ... }: {
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
    displayManager = {
      autoLogin = {
        enable = true;
        user = "pepe";
      };
      gdm = {
        enable = true;
        wayland = true;
      };
    };
  };
}
