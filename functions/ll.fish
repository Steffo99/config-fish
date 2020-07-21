# Defined in - @ line 1
function ll --wraps='ls -al' --description 'alias ll=ls -al'
  ls -al $argv;
end
