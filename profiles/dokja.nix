{config, lib, pkgs, pkgs-stable, pkgs-prior-stable, inputs, ...}:

{
    home.username = "dokja";
    home.homeDirectory = "/home/dokja";

   targets.genericLinux = {
        enable = true;

        nixGL = {
            packages = inputs.nixgl.packages;
            defaultWrapper = "mesa";
            installScripts = ["mesa"];
            vulkan.enable = true;
        };
    };

    imports = [
        /home/dokja/dokja-dotfiles/modules/rofi/rofi.nix
        /home/dokja/dokja-dotfiles/modules/themes/themes.nix
        /home/dokja/dokja-dotfiles/modules/waybar/waybar.nix
        /home/dokja/dokja-dotfiles/modules/wlogout/wlogout.nix
        /home/dokja/dokja-dotfiles/modules/zsh/zsh.nix
    ];

    nixpkgs.config.allowUnfree = true;

    home.packages = with pkgs; [
        (config.lib.nixGL.wrap pkgs.blender)
        (config.lib.nixGL.wrap pkgs-stable.bottles)
		hyprsome
        (config.lib.nixGL.wrap pkgs.upscaler)
        nwg-displays
	    vscode
        
        corefonts
        google-fonts
    ];

	xdg = {
		enable = true;

		userDirs = {
			enable = true;
			createDirectories = true;
		};
	};
    
    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
    home.stateVersion = "26.05";
}
