# Defined in - @ line 1
function restart-royalnet --wraps='ssh combo.steffo.eu sudo systemctl restart bot-royalnet' --description 'alias restart-royalnet ssh combo.steffo.eu sudo systemctl restart bot-royalnet'
  ssh combo.steffo.eu sudo systemctl restart bot-royalnet $argv;
end
