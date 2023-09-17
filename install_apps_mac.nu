#!/usr/bin/env nu

#update brew in case brew is already installed
print "Homebrew: Running update ..."
/opt/homebrew/bin/brew update

/opt/homebrew/bin/brew tap homebrew/cask-fonts

let $apps = (open apps_test.yaml)

$apps.homebrew | each { 
    |it| $"exec( /opt/homebrew/bin/brew install ($it) )" | null
}

$apps.appstore | each { 
    |it| $"exec( /opt/homebrew/bin/mas install ($it) )" | null
}

curl -fsSL https://get.pnpm.io/install.sh | sh -

exit
