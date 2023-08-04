# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  nixpkgs.config.allowUnfree = true;

  nixpkgs.overlays = [
    (self: super: {
      waybar = super.waybar.overrideAttrs (oldAttrs: {
       mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      });
    })
  ];
  
  nix = {
    gc.automatic = true;
    settings.auto-optimise-store = true;
  };

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelParams = ["quiet"];

    initrd.secrets = {
      "/crypto_keyfile.bin" = null;
    };
  };

  networking = {
    hostName = "nixos";
    # wireless.enable = true;
    networkmanager.enable = true;
  };

  time = {
    timeZone = "Asia/Jakarta";
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";

    extraLocaleSettings = {
      LC_ADDRESS = "id_ID.UTF-8";
      LC_IDENTIFICATION = "id_ID.UTF-8";
      LC_MEASUREMENT = "id_ID.UTF-8";
      LC_MONETARY = "id_ID.UTF-8";
      LC_NAME = "id_ID.UTF-8";
      LC_NUMERIC = "id_ID.UTF-8";
      LC_PAPER = "id_ID.UTF-8";
      LC_TELEPHONE = "id_ID.UTF-8";
      LC_TIME = "id_ID.UTF-8";
    };
  };

  users = {
    users.hosea = {
      isNormalUser = true;
      description = "hosea";
      extraGroups = [ "networkmanager" "wheel" "docker"];
    };

    defaultUserShell = pkgs.zsh;
  };

  environment = {
    shells = with pkgs; [ zsh ];

    systemPackages = with pkgs; [
      brightnessctl
      libnotify
      unzip
      killall
      git
      neovim 
      docker
      docker-compose

      alacritty
      btop
      swww
      starship
      zsh
      eww
      rofi
      waybar
      dunst

      joplin-desktop
      ungoogled-chromium
      bitwarden
      vscode
      postman
      discord
      gscreenshot
      obs-studio
      vlc

      ngrok
      go
      nodejs_18
      php
      php82Packages.composer
      lua
    ];
  };

  fonts = {
    fonts = with pkgs; [
      (nerdfonts.override {
        fonts = [ "JetBrainsMono" "FiraCode" "Mononoki" ];
      })
    ];
    fontconfig.enable = true;
  };

  services = {
    xserver = {
      enable = true;
      layout = "us";
      xkbVariant = "";

      displayManager.sddm.enable = true;
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    
    openssh.enable = true;

    flatpak.enable = true;
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  programs = {
    hyprland.enable = true;

    zsh = {
      enable = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
    };

    ssh.enableAskPassword = false;
  };


  security.rtkit.enable = true;

  virtualisation.docker.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}
