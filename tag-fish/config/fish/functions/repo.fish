# https://github.com/robgyiv/git-find-rs
function repo
    set initial_query $argv
    set code_dir "/Users/robbie/code"
    set dest (git-find-rs "$code_dir" | fzy -q "$initial_query" -l 20) && cd "$dest"
    tmux new -s (basename (pwd))
end
