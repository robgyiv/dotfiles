# Prompt

set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set red (set_color red)
set gray (set_color -o black)

# Remove fish welcome message
set fish_greeting ''

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch blue
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Status Chars
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_untrackedfiles '☡'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'


function fish_prompt
  set last_status $status

  set_color purple
  printf '%s' (prompt_pwd)
  set_color normal

  printf '%s ' (__fish_git_prompt)

  set_color normal
end

# Aliases

# git
alias g git
alias ga 'git add'
alias gb 'git branch'
alias gbv 'git branch -v'
alias gc 'git commit -v'
alias gca 'git commit -av'
alias gco 'git checkout'
alias gd 'git diff'
alias gida "git config user.email 'robbie@asidatascience.com'"
alias gidr "git config user.email 'robbie@roygbiv.co.uk'"
alias gl 'git pull'
alias gnum 'git rev-list --all --count'
alias gp 'git push'
alias grv 'git remote -v'
alias gst 'git status'

# editors
alias st '/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl $argv'
alias v nvim

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
alias t tmux

# venv
alias avenv 'source venv/bin/activate'
alias venv 'virtualenv venv -p $argv'

# useful commands at work
alias psqlstart "pg_ctl -D /usr/local/var/postgres start"
alias psqlstop "pg_ctl -D /usr/local/var/postgres stop"
alias techguide "echo $TECH_GUIDEBOOK_DOC | tr -d '\n' | pbcopy"
