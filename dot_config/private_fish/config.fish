set -xg EDITOR /usr/bin/nvim

fish_vi_key_bindings

nvm use node

thefuck --alias | source

source ~/.asdf/asdf.fish

asdf shell python 3.10.4

export PAGER="most"

starship init fish | source

alias sbfdb-test="mongosh --host czcholsint2972.prg-dc.dhl.com --port 27001 --authenticationDatabase '$external' --authenticationMechanism \"PLAIN\" --username pskorepa"
alias sbfdb-prod="mongosh --host czchols5423.prg-dc.dhl.com --port 27001 --authenticationDatabase '$external' --authenticationMechanism \"PLAIN\" --username pskorepa"

function logi-keys-on
    set -U id (grep -FH "HID_NAME" /sys/class/hidraw/hidraw*/device/uevent | grep "K380" | grep -Po 'hidraw\d+')
    if test -n "$id"
        echo -ne "\x10\xff\x0b\x1e\x00\x00\x00" | sudo tee /dev/$id
        echo "keyboard on '\$id' is on $id"
    else
        echo 'no keyboard found!'
    end
end

# pnpm
set -gx PNPM_HOME "/home/pskorepa/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

alias cma="chezmoi edit --apply"
