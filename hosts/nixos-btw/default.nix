{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/core.nix
    ../../modules/dev.nix
    ../../modules/network.nix
    ../../modules/utilities.nix
    ../../modules/fonts.nix
    ../../modules/gaming.nix
    ../../modules/desktop/plasma6.nix
    ../../modules/desktop/sway.nix
    ../../modules/desktop/hyprland.nix
    ../../modules/desktop/vxwm.nix
    ../../modules/desktop/budgie.nix
  ];
}
