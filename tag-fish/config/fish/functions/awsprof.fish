# Sets up the AWS profile environment variables using fzf and the profile in ~/.aws/config
function awsprof
  set profile (cat ~/.aws/config | grep '\[profile ' | awk '{print $2}' | sed 's/\]//' | fzf) # Needs to remove the `]` character
  export AWS_PROFILE="$profile"
  echo "AWS_PROFILE set to $profile"
  aws-sso-util login

  # Use `fd` to find eks-*.yaml with wildcard files and set $KUBECONFIG to its absolute path
  set kubeconfig (fd eks -e yaml | fzf)
  export KUBECONFIG="$kubeconfig"
  echo "KUBECONFIG set to $kubeconfig"
end

