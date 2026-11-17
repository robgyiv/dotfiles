# Open (creating if needed) a rex session called NAME starting in DIR, and show it in the app
# Usage: rex-session NAME [DIR]
function rex-session -a name dir
    if test -z "$name"
        echo "Error: Session name is required"
        return 1
    end

    test -n "$dir"; or set dir $PWD

    set -l id (rex ls --json | jq -r --arg name "$name" 'first(.sessions[] | select(.label == $name) | .session_id) // empty')

    if test -z "$id"
        set id (rex new "$name" -c "$dir" --json | jq -er '.session_id')
        or begin
            echo "Error: Failed to create rex session: $name"
            return 1
        end
    end

    rex do session.select session_id=$id >/dev/null
end
