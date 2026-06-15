{ pkgs, ... }: {
  # services.xserver = {
  #   enable = true;
  #   xkb = {
  #     layout = "us";
  #     variant = "";
  #   };
  # };
  #
  # services.displayManager = {
  #   autoLogin = {
  #     enable = true;
  #     user = "pepe";
  #   };
  #   gdm = {
  #     enable = true;
  #     # wayland = true;
  #   };
  # };
  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
    };
    autoLogin = {
      enable = true;
      user = "pepe";
    };
  };
}
