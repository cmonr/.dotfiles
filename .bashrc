# Check for an interactive session
[ -z "$PS1" ] && return

# Add color to terminal
alias ls='ls --color=auto -h'
export GREP_COLOR="1;33"  #Light Yellow
alias grep='grep --color=auto'
alias pacman='sudo pacman'

# Setup terminal prompt
set_prompt_style () {
  local USER_COLOR="\[\033[1;34m\]"    #Light Blue
  local DIR_COLOR="\[\033[1;32m\]"     #Light Green
  local RESET_COLOR="\[\033[1;37m\]"   #White
  local DEFAULT_COLOR="\[\033[0;37m\]" #Grey
  local SYMBOL="$"

  if [ `whoami` == "root" ] ; then
    USER_COLOR="\[\033[0;31m\]"      #Light Red
    DIR_COLOR=$USER_COLOR
    SYMBOL="#"
    cd /
    clear
  fi

  PS1="${USER_COLOR}\u${RESET_COLOR} ${DIR_COLOR}[\W]${RESET_COLOR}${SYMBOL}${DEFAULT_COLOR} "
}
set_prompt_style

# Tab Completiton for sudo
complete -cf sudo

# Set Vim as default editor
export EDITOR='vim'

# Easily extract compressed files
extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)  tar xvjf $1    ;;
      *.tar.gz)   tar xvzf $1    ;;
      *.bz2)      bunzip2 $1     ;;
      *.rar)      unrar x $1     ;;
      *.gz)       gunzip $1      ;;
      *.tar)      tar xvf $1     ;;
      *.tbz2)     tar xvjf $1    ;;
      *.tgz)      tar xvzf $1    ;;
      *.zip)      unzip $1       ;;
      *.Z)        uncompress $1  ;;
      *.7z)       7z x $1        ;;
      *)          echo "Unknown archive type..." ;;
    esac
  else
    echo "Invalid file..."
  fi
}

# Easier Navigation
alias ..='cd ..'
alias ~='cd'
#alias -='cd -'

# Easy system upgrade
alias update='sudo yaourt -Syu --aur --noconfirm'

# Yogurt [^_^]
alias yogurt='yaourt'

# Sudo aliases
alias pacman='sudo pacman-color'

# Common calender action
alias cal="cal -3"

# Easier Exiting
alias :q="exit"

# Power Shortcuts
#alias turnoff="shutdown -h -P now"
#alias restart="shutdown -r now"

# List helpful device information
alias diskinfo="df -h |grep /dev/sd |sort"

# Restart Alsa
alias restart_alsa="sudo /etc/rc.d/alsa restart"

# Make and move into directory
mkcd () {
  mkdir -p "$*"
  cd "$*"
}

# Daemon service aliases
start () {
  sudo /etc/rc.d/$1 start
}
stop () {
  sudo /etc/rc.d/$1 stop
}
restart () {
  sudo /etc/rc.d/$1 restart
}

# True Terminal Transparency
transset-df -a 0.9 &>/dev/null

# Fast Shell Auto-completion
set show-all-if-ambiguous on

# Start X on vc/1 login
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]] && [[ `whoami` != "root" ]]; then
  startx
  logout
fi
