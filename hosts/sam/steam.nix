{ pkgs, lib, config, ... }:

{
  options = {
    steam.enable = lib.mkEnableOption "Enables steam config";
  };

  config = lib.mkIf config.steam.enable {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };

    environment.systemPackages = with pkgs; [
      mangohud
      protonup
    ];

    programs.gamemode.enable = true;

    services.xserver.videoDrivers = [ "nvidia" ];

    hardware = {
      opengl = {
        enable = true;
      };
      nvidia = {
        modesetting.enable = true;
        powerManagement.enable = false;
        powerManagement.finegrained = false;
        open = false;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.production;
      };
    };
  };
}
