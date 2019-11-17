{ pkgs }:
{
  enable = true;
  tmuxinator.enable = true;
  keyMode = "vi";
  secureSocket = false;
  shortcut = "b";
  customPaneNavigationAndResize = true;
  disableConfirmationPrompt = true;
  plugins = with pkgs.tmuxPlugins; [ resurrect continuum ];
  extraConfig = ''
    set -g mouse on
    bind c new-window -c "#{pane_current_path}"
    bind - split-window -c "#{pane_current_path}"
    bind \ split-window -h -c "#{pane_current_path}"
    #
    # Powerline Gray Block - Tmux Theme
    # Created by Jim Myhrberg <contact@jimeh.me>.
    #
    # Inspired by vim-powerline: https://github.com/Lokaltog/powerline
    #
    # Requires terminal to be using a powerline compatible font, find one here:
    # https://github.com/Lokaltog/powerline-fonts
    #

    # Status update interval
    # Basic status bar colors
    set -g status-style fg=colour238,bg=colour233

    # Left side of status bar
    set -g status-left-style bg=colour233,fg=colour243
    set -g status-left-length 0
    set -g status-left ""

    # Right side of status bar
    set -g status-right-style bg=colour233,fg=colour243
    set -g status-right-length 30
    set -g status-right "#[fg=colour235,bg=colour233]#[fg=colour240,bg=colour235] %H:%M#[fg=colour240,bg=colour235]#[fg=colour233,bg=colour240] %d-%b "

    # Window status
    set -g window-status-format " #I:#W#F "
    set -g window-status-current-format " #I:#W#F "

    # Current window status
    set -g window-status-current-style bg=colour245,fg=colour232

    # Window with activity status
    set -g window-status-activity-style bg=colour233,fg=colour245

    # Window separator
    set -g window-status-separator ""

    # Window status alignment
    set -g status-justify left

    # Pane border
    set -g pane-border-style bg=default,fg=colour235

    # Active pane border
    set -g pane-active-border-style bg=default,fg=colour240

    # Pane number indicator
    set -g display-panes-colour colour233
    set -g display-panes-active-colour colour245

    # Clock mode
    set -g clock-mode-colour colour240
    set -g clock-mode-style 24

    # Message
    set -g message-style bg=colour245,fg=colour232

    # Command message
    set -g message-command-style bg=colour233,fg=colour250

    # Mode
    set -g mode-style bg=colour243,fg=colour232
    set status-bg default
    '';
}
