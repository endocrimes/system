{ config, lib, pkgs, ... }:

{
  imports = [
    ./graphical.nix
    ./audio.nix
    ./yubikey.nix
  ];

  location.provider = "geoclue2";
  services.redshift = {
    enable = true;
  };

  programs.dconf.enable = true;

  virtualisation.docker.enable = true;
}
