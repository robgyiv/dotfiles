# Remove fish welcome message
set fish_greeting

set -x EDITOR nvim

set -gx PKG_CONFIG_PATH "/usr/local/opt/libffi/lib/pkgconfig"
set -gx LDFLAGS "-L/usr/local/opt/libffi/lib"
set -gx CPPFLAGS "-I/usr/local/opt/libffi/include"

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
abbr gfo 'git fetch origin'
abbr gida "git config user.email 'robbie@asidatascience.com'"
abbr gidr "git config user.email 'robbie@roygbiv.co.uk'"
abbr gl 'git pull'
abbr glom 'git pull origin (git rev-parse --abbrev-ref HEAD)'
abbr gnum 'git rev-list --all --count'
abbr gp 'git push'
abbr gpom 'git push origin (git rev-parse --abbrev-ref HEAD)'
abbr grv 'git remote -v'
abbr gst 'git status'
abbr gfopm 'git fetch origin; git pull origin (git rev-parse --abbrev-ref HEAD)'
abbr gpfwl 'git push --force-with-lease'

abbr nvmd 'nvm use default'

# editors
abbr e emacs -nw
abbr v nvim

# useful
abbr brewcaskup 'brew cask list; xargs brew cask reinstall'
abbr brewup 'brew update; brew upgrade'
abbr kwmrs 'brew services restart chunkwm; brew services restart khd'
abbr l 'ls -alh'
abbr pipr 'pip install -r requirements.txt'
alias apprm 'mdfind -name $argv' # find all files associated with an app
alias bigfolders "du -k ~ | awk '$argv > 50000' | sort -nr"
alias cwd "pwd | tr -d '\n' | pbcopy"
alias macsleep "pmset displaysleepnow"
alias resetwifi 'networksetup -setairportpower en0 off; networksetup -setairportpower en0 on'

# venv
abbr avenv 'source venv/bin/activate'
abbr venv 'virtualenv venv -p $argv[1]'

# tmux
abbr t tmux
abbr tns 'tmux new -s (basename (pwd))'

# pyenv
# source (pyenv init - | psub)
# status --is-interactive; and pyenv init - | source
# status --is-interactive; and pyenv virtualenv-init - | source
# status is-login; and pyenv init --path | source
# pyenv init - | source

# source /Users/robbie/Library/Application\ Support/org.dystroy.broot/launcher/fish/br.fish

# nnn
abbr nn 'nnn -de'
export NNN_PLUG='f:finder;o:fzopen;p:mocq;d:diffs;t:nmount;v:imgview'

# nvm
export NVM_DIR="$HOME/.nvm"

# work
set -l work_config ~/.config/fish/work.fish
if test -e work_config
  source work_config
end
