{config, lib, pkgs, inputs, ...}:

{
	programs.zsh = {
    	enableCompletion = true;
        enable = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
		package = pkgs.emptyDirectory;

        oh-my-zsh = {
        	enable = true;
        	theme = "robbyrussell";
        };

		shellAliases = {
			"dokja-update" = "~/dokja-dotfiles/scripts/dokja-update.sh";
			"dokja-switch" = "~/dokja-dotfiles/scripts/dokja-switch.sh";
			"dokja-news" = "cd ~/dokja-dotfiles && home-manager news --flake .#dokja && cd";
			"dokja-delete-unused" = "pacman -Qtdq | xargs sudo pacman -Rns --noconfirm";
			"ff" = "fastfetch";
		};

		envExtra = ''
			export QT_QPA_PLATFORMTHEME="qt6ct"
			export ELECTRON_OZONE_PLATFORM_HINT="auto"
			export MANGOHUD="1"
			export ROCM_PATH="/opt/rocm"
			export HSA_OVERRIDE_GFX_VERSION="10.3.0"
			export ZSH_CUSTOM="/home/$USER/dokja-dotfiles/modules/zsh"
			export VCPKG_ROOT="/home/$USER/.local/share/vcpkg"
			export SSH="kitty +kitten ssh"
		'';
    };
}