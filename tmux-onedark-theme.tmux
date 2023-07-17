#!/bin/bash
onedark_black="#282c34"
onedark_blue="#61afef"
onedark_yellow="#e5c07b"
onedark_red="#e06c75"
onedark_white="#aab2bf"
onedark_green="#98c379"
onedark_visual_grey="#3e4452"
onedark_comment_grey="#5c6370"

get() {
   local option=$1
   local default_value=$2
   local option_value="$(tmux show-option -gqv "$option")"

   if [ -z "$option_value" ]; then
      echo "$default_value"
   else
      echo "$option_value"
   fi
}

set() {
   local option=$1
   local value=$2
   tmux set-option -gq "$option" "$value"
}

setw() {
   local option=$1
   local value=$2
   tmux set-window-option -gq "$option" "$value"
}

set "status" "on"
set "status-justify" "left"

set "status-left-length" "100"
set "status-right-length" "100"
set "status-right-attr" "none"

set "message-fg" "white"
set "message-bg" "black"

set "message-command-fg" "white"
set "message-command-bg" "black"

set "status-attr" "none"
set "status-left-attr" "none"

setw "window-status-fg" "black"
setw "window-status-bg" "black"
setw "window-status-attr" "none"

setw "window-status-activity-bg" "black"
setw "window-status-activity-fg" "black"
setw "window-status-activity-attr" "none"

setw "window-status-separator" ""

set "window-style" "fg=$onedark_comment_grey"
set "window-active-style" "fg=white"

set "pane-border-fg" "white"
set "pane-border-bg" "black"
set "pane-active-border-fg" "green"
set "pane-active-border-bg" "black"

set "display-panes-active-colour" "yellow"
set "display-panes-colour" "blue"

set "status-bg" "black"
set "status-fg" "white"

set "@prefix_highlight_fg" "black"
set "@prefix_highlight_bg" "green"
set "@prefix_highlight_copy_mode_attr" "fg=black,bg=green"
set "@prefix_highlight_output_prefix" "  "

status_widgets=$(get "@onedark_widgets")
time_format=$(get "@onedark_time_format" "%R")
date_format=$(get "@onedark_date_format" "%d/%m/%Y")

set "status-right" "#[fg=white,bg=black,nounderscore,noitalics]#h #[fg=$onedark_visual_grey,bg=black]#[fg=$onedark_visual_grey,bg=$onedark_visual_grey]#[fg=white, bg=$onedark_visual_grey]${status_widgets} #[fg=green,bg=$onedark_visual_grey,nobold,nounderscore,noitalics]#[fg=black,bg=green,bold] ${date_format}  ${time_format} #[fg=yellow, bg=green]#[fg=red,bg=yellow]"
set "status-left" "#[fg=black,bg=green,bold] #S #{prefix_highlight}#[fg=green,bg=black,nobold,nounderscore,noitalics]"

set "window-status-format" "#[fg=black,bg=black,nobold,nounderscore,noitalics]#[fg=white,bg=black] #I  #W #[fg=black,bg=black,nobold,nounderscore,noitalics]"
set "window-status-current-format" "#[fg=black,bg=$onedark_visual_grey,nobold,nounderscore,noitalics]#[fg=white,bg=$onedark_visual_grey,nobold] #I  #W #[fg=$onedark_visual_grey,bg=black,nobold,nounderscore,noitalics]"
