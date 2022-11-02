#
# Powerline Blue - Tmux Theme
# Created by Jim Myhrberg <contact@jimeh.me>.
#
# Inspired by vim-powerline: https://github.com/Lokaltog/powerline
#
# Requires terminal to be using a powerline compatible font, find one here:
# https://github.com/Lokaltog/powerline-fonts
#
#
# Updated by Alex Drouillard for truecolor support
#
# base03:    002b36
# base02:    073642
# base01:    586e75
# base00:    657b83
# base0:     839496
# base1:     93a1a1
# base2:     eee8d5
# base3:     fdf6e3
# yellow:    b58900
# orange:    cb4b16
# red:       dc322f
# magenta:   d33682
# violet:    6c71c4
# blue:      268bd2
# cyan:      2aa198
# green:     859900
#

# Status update interval
set -g status-interval 1

# Basic status bar colors
set-option -g status-style fg="#93a1a1",bg="#fdf6e3"
# Left side of status bar
set -g status-left-style bg="#fdf6e3",fg="#839496"
set -g status-left-length 40
set -g status-left "#[fg=#eee8d5,bg=#586e75] #S #[fg=#586e75,bg=#93a1a1]#[fg=#eee8d5,bg=#93a1a1] #(whoami) #[fg=#93a1a1,bg=#fdf6e3]"

# Right side of status bar
set -g status-right-style bg="#fdf6e3",fg="#839496"
set -g status-right-length 150
set -g status-right "#[fg=#93a1a1,bg=#fdf6e3]#[fg=#eee8d5,bg=#93a1a1] %d-%b-%y #[fg=#586e75,bg=#93a1a1]#[fg=#eee8d5,bg=#586e75] #H "

# Window status
set -g window-status-format "  #I:#W#F  "
set -g window-status-current-format "#[fg=#fdf6e3,bg=#eee8d5]#[fg=#93a1a1] #I:#W#F #[fg=#fdf6e3,bg=#eee8d5]"

# Current window status
set -g window-status-current-style bg="#eee8d5",fg="#859900"

# Window with activity status
set -g window-status-activity-style bg="#d33682",fg="#859900"

# Window separator
set -g window-status-separator ""

# Window status alignment
set -g status-justify centre

# Pane border
set -g pane-border-style bg="#fdf6e3",fg="#839496"

# Active pane border
set -g pane-active-border-style bg="#fdf6e3",fg="#839496"

# Pane number indicator
set -g display-panes-colour "#839496"
set -g display-panes-active-colour "#d33682"

# Clock mode
set -g clock-mode-colour "#586e75"
set -g clock-mode-style 12

# Message
set-option -g message-style fg="#586e75",bg="#fdf6e3" #base2

# Command message
set -g message-command-style bg="#fdf6e3",fg="#586e75"

# Mode
set -g mode-style bg="#fdf6e3",fg="#586e75"