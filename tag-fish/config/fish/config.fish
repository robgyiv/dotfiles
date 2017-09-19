# Remove fish welcome message
set fish_greeting

set -x EDITOR nvim
set PATH /usr/local/opt/python/libexec/bin $PATH # Use Homebrew Python

# Aliases

# git
abbr g git
abbr ga 'git add'
abbr gb 'git branch'
abbr gbv 'git branch -v'
abbr gc 'git commit -v'
abbr gca 'git commit -av'
abbr gco 'git checkout'
abbr gd 'git diff'
abbr gf 'git fetch'
abbr gida "git config user.email 'robbie@asidatascience.com'"
abbr gidr "git config user.email 'robbie@roygbiv.co.uk'"
abbr gl 'git pull'
abbr gnum 'git rev-list --all --count'
abbr gp 'git push'
abbr grv 'git remote -v'
abbr gst 'git status'

# editors
alias st '/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl $argv'
abbr v nvim

# notebooks
alias nbk 'cd ~/code/notebooks; jupyter notebook'
alias nbkc 'jupyter notebook'

# useful
alias apprm 'mdfind -name $argv' # find all files associated with an app
alias bigfolders "du -k ~ | awk '$argv > 50000' | sort -nr"
alias brewcaskup 'brew cask list | xargs brew cask reinstall'
alias brewup 'brew update; brew upgrade'
alias cwd "pwd | tr -d '\n' | pbcopy"
alias kwmrs 'brew services restart chunkwm; brew services restart khd'
alias l 'ls -al'
alias path 'echo $PATH | tr -s ":" "\n"'
abbr t tmux

# venv
alias avenv 'source venv/bin/activate'
alias venv 'virtualenv venv -p $argv[1]'

# useful commands at work
alias psqlstart "pg_ctl -D /usr/local/var/postgres start"
alias psqlstop "pg_ctl -D /usr/local/var/postgres stop"
alias techguide "echo $TECH_GUIDEBOOK_DOC | tr -d '\n' | pbcopy"
