{
  config,
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

  fonts.fontconfig.enable = true;

  home = {
    stateVersion = "23.05";

    username = "hosea";
    homeDirectory = "/home/hosea";

    packages = with pkgs; [
    ];

    file = {
      ".zshrc".source = ./zshrc;
    };
  };

  programs = {
    home-manager.enable = true;
  };

  xdg = {
    configFile = {
      nvim = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/home-manager/nvim";
        recursive = true;
      };
        
      "scripts".source = ./scripts;
      "rofi".source = ./rofi;
      "waybar".source = ./waybar;
      "alacritty".source = ./alacritty;
      "hypr".source = ./hypr;
      "dunst".source = ./dunst;
      "starship.toml".source = ./starship.toml;
    };
  };
}
