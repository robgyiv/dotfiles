# Sets up the AWS profile environment variables using fzf and the profile in ~/.aws/config
function awsprof
  argparse 'l/login' 'k/kubeconfig' -- $argv
  set -l login_flag 0
  set -l kubeconfig_flag 0

  # Handle options
  for name in (set -e argv; string split ' ' -- $argv)
    switch $name
        case '-l' '--login'
            set login_flag 1
        case '-k' '--kubeconfig'
            set kubeconfig_flag 1
    end
  end

  if test -f ~/.aws/config
    set profile (cat ~/.aws/config | grep '\[profile ' | awk '{print $2}' | sed 's/\]//' | fzf) # Needs to remove the `]` character
    export AWS_PROFILE="$profile"
    echo "AWS_PROFILE set to $profile"
  end
  if test $login_flag -eq 1
    aws-sso-util login
  end

  if test $kubeconfig_flag -eq 1
    # Use `fd` to find eks-*.yaml with wildcard files and set $KUBECONFIG to its absolute path
    set kubeconfig (fd eks -e yaml | fzf)
    export KUBECONFIG="$kubeconfig"
    echo "KUBECONFIG set to $kubeconfig"
  end
end

