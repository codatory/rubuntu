alias join_session='tmux attach -t pair'
alias make_session='tmux new -s pair'

# set default editor to VIM
export EDITOR='vim'
export SVN_EDITOR='vim'
export GIT_EDITOR='vim'

# fix terminal colors
export TERM='xterm-256color'
alias ls='ls -G'
alias ll='ls -lG'
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"

# GIT aliases
alias git-rm-all='git ls-files --deleted | xargs git rm'
alias gs='git status'
alias gd='git diff'
alias ga='git add'
alias gb='git branch'
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr by %C(bold blue)%an%Cgreen)%Creset" --abbrev-commit --date=relative'
alias gco='git checkout'
alias gcm='git commit -m'
alias g{='git stash'
alias g}='git stash apply'

update_system() {
  apt-get update
  apt-get dist-upgrade -y
  cd ~/.vim && rake upgrade
  rvm update && rvm reload
}