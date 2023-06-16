# https://github.com/robgyiv/git-find-rs
function repo
    set initial_query $argv
    set code_dir /Users/robbie/code
    set dest (git-find-rs "$code_dir" | fzy -q "$initial_query" -l 10) && cd "$dest"
    if test $dest
        tmux new -A -s (basename (pwd))
    end
end
