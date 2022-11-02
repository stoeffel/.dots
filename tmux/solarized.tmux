#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function get_opt() {
   local option=$1
   local default_value=$2
   local option_value="$(tmux show-option -gqv "$option")"

   if [ -z "$option_value" ]; then
      echo "$default_value"
   else
      echo "$option_value"
   fi
}

function set_opt() {
   local option=$1
   local value=$2
   tmux set-option -gq "$option" "$value"
}

function set_win_opt() {
   local option=$1
   local value=$2
   tmux set-window-option -gq "$option" "$value"
}

# default statusbar colors
set_opt status-bg black #base02
set_opt status-fg yellow #yellow
set_opt status-attr default

# default window title colors
set_win_opt window-status-fg brightblue #base0
set_win_opt window-status-bg default
#set_win_opt window-status-attr dim

# active window title colors
set_win_opt window-status-current-fg brightred #orange
set_win_opt window-status-current-bg default
#set_win_opt window-status-current-attr bright

# pane border
set_opt pane-border-fg black #base02
set_opt pane-active-border-fg brightgreen #base01

# message text
set_opt message-bg black #base02
set_opt message-fg brightred #orange

# pane number display
set_opt display-panes-active-colour blue #blue
set_opt display-panes-colour brightred #orange

# clock
set_win_opt clock-mode-colour green #green


set_opt "status" "on"
set_opt "status-justify" "left"

set_opt "status-left-length" "100"
set_opt "status-right-length" "100"
set_opt "status-right-attr" "none"

set_opt "message-command-fg" "brightred"
set_opt "message-command-bg" "black"

set_opt "status-attr" "none"
set_opt "status-left-attr" "none"
set_win_opt "window-status-attr" "none"

set_win_opt "window-status-activity-bg" "black"
set_win_opt "window-status-activity-fg" "black"
set_win_opt "window-status-activity-attr" "none"

set_win_opt "window-status-separator" ""

set_opt "@prefix_highlight_fg" "black"
set_opt "@prefix_highlight_bg" "cyan"
set_opt "@prefix_highlight_copy_mode_attr" "fg=black,bg=brightred"
set_opt "@prefix_highlight_output_prefix" "  "

set_opt "@solarized_powerline_prefix_active" \
    "#[fg=blue,bg=magenta,nobold,nounderscore,noitalics] \
#[fg=black,bg=magenta,nobold,nounderscore,noitalics] \
$(tmux show-option -gvq "prefix") \
#[fg=magenta,bg=brightcyan,nobold,nounderscore,noitalics]"
set_opt "@solarized_powerline_prefix_inactive" \
    "#[fg=blue,bg=brightcyan,nobold,nounderscore,noitalics] "
prefix_string="#{?client_prefix,#{@solarized_powerline_prefix_active},\
#{@solarized_powerline_prefix_inactive}}"

status_widgets=$(get_opt "@solarized_powerline_widgets")
time_format=$(get_opt "@solarized_powerline_time_format" "%R")
date_format=$(get_opt "@solarized_powerline_date_format" "%d/%m/%Y")
date_time_seperator=$(get_opt "@solarized_powerline_date_time_seperator" "")

set_opt "status-right" "#[fg=brightcyan,bg=black,nounderscore,noitalics]\
${time_format} ${date_time_seperator} ${date_format} \
#[fg=brightcyan,bg=black]\
#[fg=brightcyan,bg=brightcyan]\
#[fg=black, bg=brightcyan]${status_widgets}\
#[fg=blue,bg=brightcyan,nobold,nounderscore,noitalics] \
#[fg=black,bg=blue,bold] #h  "

set_opt "status-left" "#[fg=black,bg=blue,bold] #S $prefix_string"

set_opt "window-status-format" ""

set_opt "window-status-current-format" \
    "#[fg=black,bg=brightcyan,nobold] #W \
#[fg=brightcyan,bg=black,nobold,nounderscore,noitalics]"