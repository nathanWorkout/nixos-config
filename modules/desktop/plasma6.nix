{ config, pkgs, inputs, ... }:

{
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.nathan.packages = with pkgs; [
    kdePackages.kate
  ];

  programs.firefox.enable = true;

  environment.systemPackages = [
    inputs.quickshell.packages.${pkgs.system}.default
    pkgs.linux-wallpaperengine
    pkgs.mpvpaper
    pkgs.obsidian
    pkgs.p3x-onenote
    pkgs.blender
    pkgs.unityhub
    pkgs.vscode-fhs
  ];
}
