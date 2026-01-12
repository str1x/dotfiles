{ pkgs, ... }:
{
  networking.hostName = "PepeOS";
  networking.networkmanager.enable = true;
  networking.networkmanager.plugins = with pkgs; [
    networkmanager-openconnect
  ];
  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];
}
