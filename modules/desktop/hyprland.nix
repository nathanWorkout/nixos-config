{ config, pkgs, inputs, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.systemPackages = [
    inputs.quickshell.packages.${pkgs.system}.default
    pkgs.fuzzel
    pkgs.matugen
    pkgs.ffmpeg
    #pkgs.kdePackages.qtmultimedia
    pkgs.inkscape
    pkgs.imagemagick
    pkgs.grim     
    pkgs.wl-clipboard
    pkgs.cava
    pkgs.rofi
    pkgs.swaynotificationcenter
    pkgs.waybar
    pkgs.awww
  ];

  }
