# Sets up the AWS profile environment variables using fzf and the profile in ~/.aws/config
function awsprof
  argparse 'l/login' 'k/kubeconfig' -- $argv

  if test -f ~/.aws/config
    set profile (cat ~/.aws/config | grep '\[profile ' | awk '{print $2}' | sed 's/\]//' | fzf) # Removes the `]` character
    export AWS_PROFILE="$profile"
    echo "AWS_PROFILE set to $profile"
  end
  if test -n "$_flag_login"
    aws-sso-util login
  end

  if test -n "$_flag_kubeconfig"
    set fd_files (fd eks -e yaml | string collect -N)
    if test -n "$fd_files"
      set kubeconfig (echo "$fd_files" | fzf)
      export KUBECONFIG="$kubeconfig"
      echo "KUBECONFIG set to $kubeconfig"
    end
  end
end

