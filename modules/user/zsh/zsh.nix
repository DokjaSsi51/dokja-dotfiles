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
			"dokja-update" = "cd ~/dokja-dotfiles && sudo pacman -Syu --noconfirm && nix flake update && home-manager switch --flake .#mz && cd";
			"dokja-switch" = "cd ~/dokja-dotfiles && home-manager switch --flake .#dokja && cd";
			"dokja-news" = "cd ~/dokja-dotfiles && home-manager news --flake .#dokja && cd";
		};
    };
}
