function gnr --description "Create a new git repo under ~/code/github.com/robgyiv and open it in a tmux session"
    if test (count $argv) -lt 1
        echo "Usage: gnr <repo-name>"
        return 1
    end

    set -l name $argv[1]
    set -l DIR "$HOME/code/github.com/robgyiv/$name"

    if test -e "$DIR"
        echo "gnr: $DIR already exists"
        return 1
    end

    mkdir -p "$DIR"; or return 1
    git -C "$DIR" init; or return 1

    # tmux session names can't contain dots; swap them for underscores
    set -l session (string replace -a '.' '_' -- $name)

    if not tmux has-session -t "$session" 2>/dev/null
        tmux new-session -d -s "$session" -c "$DIR"
    end

    if set -q TMUX
        tmux switch-client -t "$session"
    else
        tmux attach-session -t "$session"
    end
end
