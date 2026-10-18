{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  environment.gnome.excludePackages = with pkgs; [
    # Jeux
    aisleriot gnome-chess gnome-mahjongg gnome-mines gnome-sudoku
    gnome-robots gnome-tetravex gnome-klotski gnome-taquin
    gnome-nibbles five-or-more four-in-a-row hitori iagno
    lightsoff quadrapassel swell-foop tali atomix

    # Apps inutiles
    epiphany geary gnome-maps gnome-music gnome-weather
    gnome-contacts gnome-calendar gnome-clocks totem cheese
    simple-scan yelp gnome-sound-recorder gnome-color-manager
    devhelp gitg ghex gucharmap seahorse baobab
    gnome-system-monitor gnome-packagekit gnome-software
    rygel gnome-user-share gnome-remote-desktop
    accerciser gnome-tour gnome-connections
  ];

  # Audio
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  environment.systemPackages = with pkgs; [
    gruvbox-gtk-theme
    papirus-icon-theme
  ];

  users.users.nathan.packages = with pkgs; [
    firefox
    gnome-browser-connector 
    gnome-tweaks
    dconf-editor
    gnome-shell-extensions
    gnomeExtensions.user-themes
    gnomeExtensions.dash2dock-lite
    gnomeExtensions.blur-my-shell
    gnomeExtensions.gtk4-desktop-icons-ng-ding
  ];

  programs.firefox.enable = true;
}
