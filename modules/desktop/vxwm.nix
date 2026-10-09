# modules/desktop/vxwm.nix
{ config, pkgs, lib, ... }:

let
  st-custom = pkgs.st.overrideAttrs (old: {
    preBuild = ''
      cp ${./st-config.h} config.h
    '';
  });

  yazi-vxwm = pkgs.writeShellScriptBin "yaziv" ''
    YAZI_CONFIG_HOME="/home/nathan/.config/yazi-vxwm" exec ${pkgs.yazi}/bin/yazi "$@"
  '';

  vxwm = pkgs.stdenv.mkDerivation {
    pname = "vxwm";
    version = "unstable-2025";

    src = pkgs.fetchFromCodeberg {
      owner = "wh1tepearl";
      repo = "vxwm";
      rev = "main";
      sha256 = "sha256-W7BYpvU1oBfHN3QzZDvDhWVEQ4w/1hKRFdiDzpqfhJ8=";
    };

    buildInputs = with pkgs; [
      libx11
      libxft
      libxinerama
    ];

    nativeBuildInputs = [ pkgs.gnumake pkgs.pkg-config ];

    preBuild = ''
      sed -i "s|/usr/local|$out|g" config.mk
      sed -i "s|CFLAGS =|CFLAGS = -DAUTOSTART|g" config.mk
      cat ${./vxwm-config.h} > config.h
    '';

    meta = {
      description = "Versatile X Window Manager, dwm fork with infinite tags";
      homepage = "https://codeberg.org/wh1tepearl/vxwm";
      license = lib.licenses.mit;
      platforms = lib.platforms.linux;
    };
  };
in
{
  services.xserver = {
    enable = true;
    windowManager.session = lib.singleton {
      name = "vxwm";
      start = ''
        ${vxwm}/bin/vxwm &
        waitPID=$!
      '';
    };
  };

  services.picom = {
    enable = true;
    backend = "glx";
    vSync = true;
  };

  services.displayManager.sddm.enable = true;

  environment.systemPackages = with pkgs; [
    vxwm
    dmenu
    st-custom
    yazi-vxwm
    xinit
    xsetroot
    feh
    xclip
    scrot
  ];
}
