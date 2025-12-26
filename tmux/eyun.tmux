##### EYUN TMUX THEME
# Author: Rajae
# Style: modern, elegant, balanced, readable

# PALETTE

set -g @bg        "#0f1412"
set -g @bg_alt    "#1b1f1c"
set -g @bg_soft   "#242a26"

set -g @fg        "#e7ece9"
set -g @fg_dim    "#8a9a91"

set -g @green     "#6ccf8e"
set -g @green_hi  "#8fd6a0"
set -g @yellow    "#e3b86b"
set -g @red       "#e28c8c"

# STATUS BASE

set -g status-position bottom
set -g status-interval 2
set -g status-style "bg=#{@bg},fg=#{@fg}"

# LEFT STATUS
# Session · Path · Git

set -g status-left-length 140
set -g status-left "\
#[fg=#{@bg},bg=#{@green}]\
#[fg=#{@bg},bg=#{@green},bold]  #S  \
#[fg=#{@green},bg=#{@bg_alt}]\
#[fg=#{@fg},bg=#{@bg_alt}] 󰉋 #(basename \"#{pane_current_path}\") \
#[fg=#{@bg_alt},bg=#{@bg_soft}]\
#[fg=#{@green_hi},bg=#{@bg_soft}]  #(git -C \"#{pane_current_path}\" rev-parse --abbrev-ref HEAD 2>/dev/null) \
#[fg=#{@bg_soft},bg=#{@bg}]"

# RIGHT STATUS
# Uptime · Host · App · Date/Time

set -g status-right-length 200
set -g status-right "\
#[fg=#{@bg},bg=#{@bg_soft}]\
#[fg=#{@fg_dim},bg=#{@bg_soft}] 󰔟 #(uptime | sed 's/.*up \\([^,]*\\),.*/\\1/') \
#[fg=#{@bg_soft},bg=#{@bg_alt}]\
#[fg=#{@fg},bg=#{@bg_alt}]  #H \
#[fg=#{@bg_alt},bg=#{@bg_soft}]\
#[fg=#{@fg},bg=#{@bg_soft}]  #{pane_current_command} \
#[fg=#{@bg_soft},bg=#{@bg}]\
#[fg=#{@yellow},bg=#{@bg}] 󰅐 %Y-%m-%d %H:%M \
"

# WINDOW LIST

setw -g window-status-style "bg=#{@bg},fg=#{@fg_dim}"
setw -g window-status-format "  #I:#W  "

setw -g window-status-current-style "bg=#{@green},fg=#{@bg}"
setw -g window-status-current-format "\
#[fg=#{@green},bg=#{@bg}]\
#[fg=#{@bg},bg=#{@green},bold] #I:#W \
#[fg=#{@green},bg=#{@bg}]"

# PANE BORDERS

set -g pane-border-style "fg=#{@bg_soft}"
set -g pane-active-border-style "fg=#{@green}"

# MESSAGES / MODES

set -g message-style "bg=#{@bg_alt},fg=#{@fg}"
set -g message-command-style "bg=#{@green_hi},fg=#{@bg}"
setw -g mode-style "bg=#{@green_hi},fg=#{@bg}"
