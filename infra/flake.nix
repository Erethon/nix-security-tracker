{
  description = "Nix Security Tracker infra";

  inputs = { nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.05"; };

  outputs = { self, nixpkgs, ... }@inputs: {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt;
    nixosConfigurations.stfmaster = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./default.nix /hosts/stfmaster/default.nix ];
    };
  };
}
