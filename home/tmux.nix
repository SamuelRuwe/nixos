{ pkgs, lib, config, ... }:

{
  options = {
    tmux.enable = lib.mkEnableOption "Enables tmux config";
  };

  config = lib.mkIf config.tmux.enable {
    programs.tmux = {
      enable = true;
      shortcut = "a";
      # aggressiveResize = true; -- Disabled to be iTerm-friendly
      baseIndex = 1;
      newSession = false;
      # Stop tmux+escape craziness.
      escapeTime = 0;
      # Force tmux to use /tmp for sockets (WSL2 compat)
      secureSocket = false;

      plugins = with pkgs; [
        tmuxPlugins.better-mouse-mode
      ];

      extraConfig = ''
        set -g default-terminal "xterm-256color"
        set -ga terminal-overrides ",*256col*:Tc"
        set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
        set-environment -g COLORTERM "truecolor"

        # Mouse works as expected
        set-option -g mouse on
        # easy-to-remember split pane commands
        bind | split-window -h -c "#{pane_current_path}"
        bind - split-window -v -c "#{pane_current_path}"
        bind c new-window -c "#{pane_current_path}"
      '';
    };

    home.packages = [
      # Open tmux for current project.
      (pkgs.writeShellApplication {
        name = "pux";
        runtimeInputs = [ pkgs.tmux ];
        text = ''
          PRJ="''$(zoxide query -i)"
          echo "Launching tmux for ''$PRJ"
          set -x
          cd "''$PRJ" && \
            exec tmux -S "''$PRJ".tmux attach
        '';
      })
    ];
  };
}
