function yay-update-all --wraps='yay --needed --overwrite "*" --answerclean None --answerdiff None --answeredit None --answerupgrade None --sudoloop --noconfirm' --wraps='yay --overwrite "*" --answerclean None --answerdiff None --answeredit None --answerupgrade None --sudoloop --noconfirm' --description 'alias yay yay --needed --overwrite "*" --answerclean None --answerdiff None --answeredit None --answerupgrade None --sudoloop --noconfirm'
    command yay -Syu --needed --overwrite "*" --answerclean None --answerdiff None --answeredit None --answerupgrade None --sudoloop --noconfirm $argv
end
