set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set red (set_color red)
set foobar (set_color 333333)
# black, red, green, yellow, blue, magenta, cyan, white

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'yes'
# set __fish_git_prompt_color_branch 118ab2
set __fish_git_prompt_color_branch normal
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Git status chars
set __fish_git_prompt_char_dirtystate '*'
set __fish_git_prompt_char_stagedstate '+'
set __fish_git_prompt_char_untrackedfiles '…'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'
set __fish_git_prompt_char_upstream_prefix ""

function fish_prompt
  set last_status $status

  # if set -q VIRTUAL_ENV
  #   echo -n -s (set_color yellow) "[" (basename "$VIRTUAL_ENV") "]" (set_color normal) " "
  # end

  # set_color 06d6a0
  set_color magenta
  printf '%s' (prompt_pwd)
  set_color normal

  printf '%s' (__fish_git_prompt)

  set_color normal

  printf '$ '
end

function fish_right_prompt
  set_color 495262
  date '+%H:%M:%S'
  set_color normal
end
