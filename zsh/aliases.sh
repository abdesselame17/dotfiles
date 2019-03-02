# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    # test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

#ls aliases
alias ll='ls -halF'
alias la='ls -A'

# try base16 colors
alias colortest='$HOME/.config/base16-shell/./colortest'

# edit aliases
alias aliases='$EDITOR $HOME/.zsh/aliases.sh'
alias functions='$EDITOR $HOME/.zsh/functions.sh'
alias zshrc='$EDITOR $HOME/.zshrc'
alias vimrc='$EDITOR $HOME/.vimrc'
alias tmuxconf='$EDITOR $HOME/.tmux.conf'

# source zsh
alias szsh='source $HOME/.zshrc'

# pwd
alias p='pwd'
alias l='clear'
alias bye='tmux kill-server'
alias update='sudo apt-get update && sudo apt-get upgrade'
alias upgrade='sudo apt-get upgrade'
alias clean='sudo apt-get autoclean && sudo apt-get autoremove'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# quit 
alias q='exit'
alias :q='exit'

# lamp aliases
alias lstart='sudo /opt/lampp/lampp start'
alias lstop='sudo /opt/lampp/lampp stop'
alias lstatus='sudo /opt/lampp/lampp status'

# vim
alias v='vim'

# tmux
alias t='tmux'

# tmux -2
alias t2='tmux -2'

# laravel artisan aliases 
alias serve='php artisan serve'

# home
alias hm='cd $HOME'

# cd Repos
alias rp='cd $REPOS'

# cd Dotfiles
alias dotfiles='cd $DOTFILES'

# cd Downloads
alias dwl='cd $HOME/Downloads'
