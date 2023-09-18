#!/usr/bin/env nu

#update brew in case brew is already installed
print "Homebrew: Running update ..."
/opt/homebrew/bin/brew update

/opt/homebrew/bin/brew tap homebrew/cask-fonts

let $apps = (open ~/.dotfiles/apps.yaml)

let $apps_homebrew_install_commands = ($apps.homebrew | each { 
    |it| $"exec( /opt/homebrew/bin/brew install ($it) )"
})

let $apps_appstore_install_commands = (#$apps.appstore | each { 
    |it| $"exec( /opt/homebrew/bin/mas install ($it) )"
})

$apps_homebrew_install_commands | null
$apps_appstore_install_commands | null

#curl -fsSL https://get.pnpm.io/install.sh | sh -

exit
