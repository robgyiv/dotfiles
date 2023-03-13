# git clone, cd into directory
# usage: `gccd git@github.com:username/possible-project/repo-name.git`
# TODO: git clone https sources

function gccd
    set code_dir "/Users/robbie/code"
    set domain_split (string split : $argv[1])
    set git_host (string split @ $domain_split)[2]
    set formatted_repo_path (string split .git $domain_split[2])
    set full_repo_path $code_dir/$git_host/$formatted_repo_path[1]

    if test -d $full_repo_path
        echo "> Directory already exists at:"
        echo "$full_repo_path"
        echo "> Changing to directory"
        cd $full_repo_path
        tmux new -s (basename (pwd))
        return 1
    else
        cd $code_dir
        git clone $argv[1] $full_repo_path
        echo "> Changing to directory"
        cd $full_repo_path
        tmux new -s (basename (pwd))
    end
end
