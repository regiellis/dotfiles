# BASE ZSH - PERSONA IO
# JAN 2015
#
# ASK FOR THE ADMINISTRATOR PASSWORD UPFRONT
# sudo -v
# Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
# while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

DISABLE_UPDATE_PROMPT=false
ZSH_THEME="zhann"

# GRAB ALL FILES WITH THE ".zsh" EXT
for config_file ($HOME/.dotfiles/*/*.zsh); do
  source $config_file
done
