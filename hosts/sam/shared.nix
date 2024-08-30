{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./openssh.nix
      ./hosts.nix
      ./firefox.nix
      ./greetd.nix
      inputs.home-manager.nixosModules.default
    ];

 programs.hyprland = {
     enable = true;
     xwayland.enable = true;
 };

 services.fail2ban.enable = true;

 hardware = {
    pulseaudio.enable = false;
    opengl.enable = true;
    nvidia.modesetting.enable = true;
 };

 environment.sessionVariables = {
     WLR_NO_HARDWARE_CURSORS = "1";
     NISOS_OZONE_WL = "1";
 };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.sam = {
    isNormalUser = true;
    description = "Sam Ruwe";
    extraGroups = [ "networkmanager" "wheel" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII2Un4494+M+C/BE1i0iiPwHWroq01xPski/0wZo7ESx"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIALo61mgxgc5kk8HJPOucrYdHPxima4AA/7aI0D/CQz7"
    ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    curl
    ripgrep
    unzip
    xclip
    discord
    fd
  ];

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal
    ];
    configPackages = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal
    ];
  };

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "24.05";
}
