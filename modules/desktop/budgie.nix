
{ config, pkgs, ... }:

{
  services.xserver.enable = true;

  services.displayManager.sddm.enable = true;
  services.desktopManager.budgie.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Audio
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Applications utilisateur
  users.users.nathan.packages = with pkgs; [
    firefox
    # Ajoute tes applications ici
  ];

  programs.firefox.enable = true;
}
