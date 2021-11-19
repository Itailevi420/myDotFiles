# Defined in - @ line 1
function a --wraps='ls -a' --description 'alias a ls -a'
  ls -a $argv;
end
