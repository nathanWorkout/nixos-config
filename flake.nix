{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.zst";
  };

  outputs = { self, nixpkgs }: {
    nixosConfigurations.nixos-btw = nixpkgs.lib.nixosSystem {
      modules = [ ./configuration.nix ];
    };
  };
}
