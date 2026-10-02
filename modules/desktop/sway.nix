{ config, pkgs, ... }:

{
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  environment.systemPackages = with pkgs; [
    waybar
    swaylock
    swayidle
    wofi
    mako
    wl-clipboard
    grim
    slurp
    alacritty
  ];
}
