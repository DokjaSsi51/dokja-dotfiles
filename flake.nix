{
    description = " Dokja's Flake";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager/master";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";

        nixpkgs-2405.url = "nixpkgs/nixos-24.05";
    	home-manager-2405.url = "github:nix-community/home-manager/release-24.05";
    	home-manager-2405.inputs.nixpkgs.follows = "nixpkgs-2405";

    	nixpkgs-stable.url = "nixpkgs/nixos-24.11";
    	home-manager-stable.url = "github:nix-community/home-manager/release-24.11";
    	home-manager-stable.inputs.nixpkgs.follows = "nixpkgs-stable";

        stylix = {
            url = "github:nix-community/stylix";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        nixgl = {
            url = "github:nix-community/nixGL";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = {self, nixpkgs, home-manager, stylix, ...} @ inputs:
    let
        lib = nixpkgs.lib;
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};

    in {

        homeConfigurations = {

            dokja = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                extraSpecialArgs = {inherit inputs;};
                modules = [
                    ./profiles/user/dokja.nix
                    stylix.homeModules.stylix
                ];
	        };

        };
    };
}
