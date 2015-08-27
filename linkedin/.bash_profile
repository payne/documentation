# Make sublime default editor
export EDITOR="subl -w"

# Source nvm
. ~/.nvm/nvm.sh

# Aliases and Variables
########################
alias devbox="ssh brbennet-ld1" # SSH into dev box faster
export LOCALDEVBOX="/Volumes/brbennet-ld1/"

# RVM
######################
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Android SDK
#####################
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools