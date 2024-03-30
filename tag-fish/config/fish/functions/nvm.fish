function nvm
    set -x NVM_DIR "$HOME/.nvm"
    bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end
