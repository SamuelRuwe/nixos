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
      terminal = "tmux-256color";

      plugins = with pkgs; [
        tmuxPlugins.better-mouse-mode
      ];

      extraConfig = ''
        set-option -ga terminal-overrides ",*:Tc"

        # Mouse works as expected
        set-option -g mouse on
        bind c new-window -c "#{pane_current_path}"
        bind-key v split-window -h -c "#{pane_current_path}"
        bind-key s split-window -v -c "#{pane_current_path}"
        bind-key h select-pane -L
        bind-key j select-pane -D
        bind-key k select-pane -U
        bind-key x kill-pane

        bind-key C-o rotate-window

        set-window-option -g window-status-current-style fg=colour33
        set-window-option -g window-status-style bg=default

        # Status Bar
        set-option -g status-interval 1
        set-option -g status-style bg=black
        set-option -g status-style fg=white
        set -g status-left '#[fg=green]#H #[default]'
        set -g status-right '%a %l:%M:%S %p#[default] #[fg=blue]%Y-%m-%d'
        set-option -g pane-active-border-style fg=yellow
        set-option -g pane-border-style fg=cyan
        bind-key l select-pane -R
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
