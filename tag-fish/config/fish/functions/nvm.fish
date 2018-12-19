function nvm
  set -x NVM_DIR "$HOME/.nvm"
  bass source /usr/local/opt/nvm/nvm.sh --no-use ';' nvm $argv
end

