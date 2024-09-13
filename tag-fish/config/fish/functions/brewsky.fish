function brewsky
  set -l package $argv[1]
  brew info $package
  read -l -P 'Install this package? [y/N]'\n confirm
  switch $confirm
    case 'y'
      brew install $package
  end
end
