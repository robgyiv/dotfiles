# Remove fish welcome message
set fish_greeting

set -x EDITOR nvim

set -gx LDFLAGS "-L/usr/local/opt/libffi/lib"
set -gx PKG_CONFIG_PATH "/usr/local/opt/libffi/lib/pkgconfig"

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
abbr glom 'git pull origin master'
abbr gnum 'git rev-list --all --count'
abbr gp 'git push'
abbr gpom 'git push origin master'
abbr grv 'git remote -v'
abbr gst 'git status'
abbr n 'nnn'
abbr nvmd 'nvm use default'

# editors
abbr e emacs -nw
alias st '/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl $argv'
abbr v nvim

# notebooks
abbr nbk 'cd ~/code/notebooks; jupyter notebook'
abbr nbkc 'jupyter notebook'

# useful
abbr brewcaskup 'brew cask list; xargs brew cask reinstall'
abbr brewup 'brew update; brew upgrade'
abbr kwmrs 'brew services restart chunkwm; brew services restart khd'
abbr l 'ls -alh'
abbr pipr 'pip install -r requirements.txt'
abbr t tmux
alias apprm 'mdfind -name $argv' # find all files associated with an app
alias bigfolders "du -k ~ | awk '$argv > 50000' | sort -nr"
alias cwd "pwd | tr -d '\n' | pbcopy"
alias path 'echo $PATH | tr -s ":" "\n"'
alias macsleep "pmset displaysleepnow"

# venv
abbr avenv 'source venv/bin/activate'
abbr venv 'virtualenv venv -p $argv[1]'

# pyenv
source (pyenv init - | psub)
status --is-interactive; and pyenv init - | source
status --is-interactive; and pyenv virtualenv-init - | source

# useful commands at work
abbr ytuw 'yarn test:unit:watch'
