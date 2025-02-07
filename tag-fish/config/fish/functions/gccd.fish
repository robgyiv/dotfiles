# git clone, cd into directory in a tmux session
# Usage: 
#   SSH:   gccd -r git@gitlab.com:username/possible-project/repo-name.git [-d depth]
#   HTTPS: gccd -r https://gitlab.com/username/possible-project/repo-name.git [-d depth]

function gccd
    set -l options (fish_opt -s d -l depth --long-only --optional-val)
    set options $options (fish_opt -s r -l repo --required-val)
    argparse $options -- $argv

    # Exit if required repo argument is missing
    if not set -q _flag_repo
        echo "Error: Repository URL is required. Use -r or --repo flag."
        return 1
    end

    set -l code_dir "$HOME/code"
    set -l repo_url $_flag_repo
    set -l domain ""
    set -l repo_relative_path ""
    
    # Determine if SSH or HTTPS protocol
    if string match -q -r '^git@' -- $repo_url
        # SSH format: git@gitlab.com:username/project.git
        set -l ssh_parts (string split '@' $repo_url)
        set -l domain_and_path (string split ':' $ssh_parts[2])
        set domain $domain_and_path[1]
        set repo_relative_path (string replace -r '\.git$' '' $domain_and_path[2])
    else if string match -q -r '^https?://' -- $repo_url
        # HTTPS format: https://gitlab.com/username/project.git
        set -l url_parts (string split '/' $repo_url)
        set domain (string replace -r '^https?://' '' $url_parts[3])
        # Join all parts after the domain with '/'
        set repo_relative_path (string join '/' $url_parts[4..-1])
        set repo_relative_path (string replace -r '\.git$' '' $repo_relative_path)
    else
        echo "Error: Invalid repository URL format. Must be SSH or HTTPS."
        return 1
    end

    set -l full_repo_path "$code_dir/$domain/$repo_relative_path"

    # Ensure parent directories exist
    set -l parent_dir (dirname $full_repo_path)
    if not test -d $parent_dir
        mkdir -p $parent_dir
        or begin
            echo "Error: Failed to create directory: $parent_dir"
            return 1
        end
    end

    if test -d $full_repo_path
        echo "> Directory already exists at $full_repo_path"
        echo "> Changing to directory"
        cd $full_repo_path
        attach-tmux (basename (pwd))
        return 0
    end

    # Clone the repository
    if set -q _flag_depth
        echo "> Cloning repository with depth $_flag_depth"
        git clone --depth $_flag_depth $repo_url $full_repo_path
    else
        echo "> Cloning repository"
        git clone $repo_url $full_repo_path
    end

    if test $status -ne 0
        echo "Error: Git clone failed"
        return 1
    end

    echo "> Changing to directory"
    cd $full_repo_path
    attach-tmux (basename (pwd))
end

function attach-tmux -a session_name
    if test -z "$session_name"
        echo "Error: Session name is required"
        return 1
    end

    if tmux has-session -t $session_name 2>/dev/null
        tmux attach-session -t $session_name
    else
        tmux new-session -s $session_name
    end
end
