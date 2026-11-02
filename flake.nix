{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    freesmlauncher.url = "github:FreesmTeam/FreesmLauncher";
  };

  nixConfig = {
    extra-substituters = [
      "https://freesmlauncher.cachix.org"
    ];
    extra-trusted-public-keys = [
      "freesmlauncher.cachix.org-1:Jcp5Q9wiLL+EDv8Mh7c6L9xGk+lXr7/otpKxMOuBuDs="
    ];
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, freesmlauncher, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit nixpkgs-unstable freesmlauncher; };
      modules = [
        ./hardware-configuration.nix
        ./configuration.nix
      ];
    };
  };
}   
