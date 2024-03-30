# git clone, cd into directory in a tmux session
# usage: `gccd git@gitlab.com:username/possible-project/repo-name.git`
# TODO: git clone HTTPS sources

function gccd
    set code_dir "$HOME/code"
    set domain_split (string split : $argv[1])
    set git_host (string split @ $domain_split)[2]
    set formatted_repo_path (string split .git $domain_split[2])
    set full_repo_path $code_dir/$git_host/$formatted_repo_path[1]

    if test -d $full_repo_path
        echo "> Directory already exists at:"
        echo "$full_repo_path"
        echo "> Changing to directory"
        cd $full_repo_path
        attach-tmux (basename (pwd))
        return 0
    else
        cd $code_dir
        git clone $argv[1] $full_repo_path
        echo "> Changing to directory"
        cd $full_repo_path
        attach-tmux (basename (pwd))
    end
end

function attach-tmux -a session_name
    if tmux has-session -t $session_name
        tmux attach-session -t $session_name
    else
        tmux new-session -s $session_name
    end
end
