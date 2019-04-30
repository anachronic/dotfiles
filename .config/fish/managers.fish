set -q NVM_DIR; or set -gx NVM_DIR ~/.nvm

function nvm
   bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

nvm use default --silent
