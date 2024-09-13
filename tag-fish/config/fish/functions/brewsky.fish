function brewsky
  set -l package $argv[1]
  brew info $package
  if test $status -eq 1
    return 1
  end
  read -l -P 'Install this package? [y/N]'\n confirm
  switch $confirm
    case 'y'
      brew install $package
    case '*'
      echo $package not installed
      return 1
  end
end
