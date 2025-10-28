# https://github.com/robgyiv/git-find-rs
function repo
    set initial_query $argv
    set code_dir $HOME/code
    set dest (git-find-rs -d "$code_dir" -m 5 | fzy -q "$initial_query" -l 10)

    if test -n "$dest"
        set session_name (basename "$dest" | string replace -a -r '[.:\s]' '_')

        if test -n "$TMUX"
            # Create new detached session starting in $dest, then switch to it
            tmux new-session -d -s "$session_name" -c "$dest"
            tmux switch-client -t "$session_name"
        else
            # Outside tmux: attach or create, starting in $dest
            tmux new-session -A -s "$session_name" -c "$dest"
        end
    end
end
