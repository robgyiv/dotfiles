function gnr --description "Create a new git repo under ~/code/github.com/robgyiv and open it in a rex session"
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

    rex-session $name "$DIR"
end
