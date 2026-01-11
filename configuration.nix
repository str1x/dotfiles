{ lib, pkgs, ... }: {
  imports =
    [
      ./hardware.nix
      ./modules/plymouth
      ./modules/dm
      ./modules/networking
      ./modules/bluetooth
      ./modules/hyprland
      # ./modules/amnezia-vpn
      ./modules/clang
    ];

  nixCats = {
    enable = true;
  };
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  time.timeZone = "Europe/Moscow";

  nixpkgs.config.allowUnfree = true;

  nixpkgs.config.permittedInsecurePackages = [
    "nodejs-v22.16.0"
  ];

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
     fnm # Add fnm here
  ];

  security.rtkit.enable = true;

  services.pipewire = {
    enable = true; # if not already enabled
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  fonts.packages = with pkgs; [
    nerd-fonts.hasklug
  ];

  users.users.pepe = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };

  programs.ssh.startAgent = true;

  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };

  nix.settings.auto-optimise-store = true;

  environment.systemPackages = with pkgs; [
    wl-clipboard
    btop
    # neovim
    wget
    kitty
    lact
    hardinfo2
    dmidecode
    pwvucontrol
    easyeffects
    git
    google-chrome
  ];

  environment.variables.EDITOR = "vim";

  systemd.packages = with pkgs; [ lact ];

  systemd.services.lactd.wantedBy = ["multi-user.target"];

  system.stateVersion = "25.05"; # Did you read the comment? TODO: fix warning

}

