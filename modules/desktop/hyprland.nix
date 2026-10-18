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
   	  pkgs.kdePackages.qtmultimedia
	  pkgs.matugen
  ];
}
