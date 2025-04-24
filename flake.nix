{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";

    hm.url = "github:nix-community/home-manager/master";
    hm.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";

    betterfox.url = "github:HeitorAugustoLN/betterfox-nix";
    betterfox.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-stable,
      hm,
      betterfox,
      ...
    }@inputs:
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
        homeDir = "/home/${userSettings.username}";
        dotfilesDir = "${userSettings.homeDir}/.dotfiles";
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
          modules = [
            /etc/nixos/hardware-configuration.nix
            ./hosts/nkdtop.nix
          ];
        };
        nkltop = nixpkgs.lib.nixosSystem {
          system = systemSettings.system;
          specialArgs = {
            inherit inputs;
            inherit pkgs-stable;
            inherit systemSettings;
            inherit userSettings;
          };
          modules = [
            /etc/nixos/hardware-configuration.nix
            ./hosts/nkltop.nix
          ];
        };
      };

      homeConfigurations = {
        "nk@nkdtop" = hm.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit inputs;
            inherit pkgs;
            inherit systemSettings;
            inherit userSettings;
          };
          modules = [
            ./users/nk.nix
            inputs.stylix.homeManagerModules.stylix
          ];
        };

        "nk@nkltop" = hm.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit inputs;
            inherit pkgs;
            inherit systemSettings;
            inherit userSettings;
          };
          modules = [
            ./users/nk.nkltop.nix
            inputs.stylix.homeManagerModules.stylix
          ];
        };
      };

      devShells.${systemSettings.system}.default = pkgs.mkShell {
        packages = with pkgs; [
          go-task
          nil
          nixfmt-rfc-style
          lua-language-server
          vscode-langservers-extracted
          yaml-language-server
          taplo
        ];
      };
    };
}
