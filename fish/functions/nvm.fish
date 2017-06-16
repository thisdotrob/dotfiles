# nvm fish wrapper
# uses https://github.com/edc/bass
function nvm
  bass source /usr/local/opt/nvm/nvm.sh ';' nvm $argv
end
