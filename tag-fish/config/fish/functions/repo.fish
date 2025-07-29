# https://github.com/robgyiv/git-find-rs
function repo
    set initial_query $argv
    set code_dir $HOME/code
    set dest (git-find-rs -d "$code_dir" -m 5 | fzy -q "$initial_query" -l 10) && cd "$dest"
    if test $dest
        set session_name (basename (pwd) | string replace -a -r '[.:\s]' '_')
        if test -n "$TMUX"
            tmux new -d -s "$session_name"
            tmux switch-client -t "$session_name"
        else
            tmux new -A -s "$session_name"
        end
    end
end
