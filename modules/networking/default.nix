{ pkgs, ... }:
{
  networking.hostName = "PepeOS";
  networking.networkmanager.enable = true;
  environment.systemPackages = with pkgs; [ networkmanagerapplet ];
}
