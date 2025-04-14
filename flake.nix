{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    stylix.url = "github:danth/stylix";
  };

  outputs =
    { nixpkgs, nixpkgs-stable, ... }@inputs:
    let
      systemSettings = {
        system = "x86_64-linux";
        timezone = "Europe/Paris";
        locale = "en_US.UTF-8";
        bootMode = "uefi";
        bootMountPath = "/boot";
      };

      userSettings = {
        username = "nk";
        fullname = "Noé Ksiazek";
        email = "noe.ksiazek@pm.me";
        dotfilesDir = "home/${userSettings.username}/.dotfiles";
        theme = "nord";
      };

      pkgs-stable = import nixpkgs-stable {
        system = systemSettings.system;
        config = {
          allowUnfree = true;
        };
      };

      pkgs = import nixpkgs {
        system = systemSettings.system;
        config = {
          allowUnfree = true;
        };
      };

    in
    {
      nixosConfigurations = {
        nkdtop = nixpkgs.lib.nixosSystem {
          inherit pkgs;
          system = systemSettings.system;
          specialArgs = {
            inherit inputs;
            inherit pkgs-stable;
            inherit systemSettings;
            inherit userSettings;
          };
          modules = [ ./hosts/nkdtop.nix ];
        };
        nkltop = nixpkgs.lib.nixosSystem {
          system = systemSettings.system;
          specialArgs = {
            inherit pkgs-stable;
            inherit systemSettings;
            inherit userSettings;
          };
          modules = [ ./hosts/nkltop.nix ];
        };
      };

      devShells.${systemSettings.system}.default = pkgs.mkShell {
        packages = [
          pkgs.nil
          pkgs.nixfmt-rfc-style
        ];
      };

    };

}
