#!/usr/bin/env nu

#update brew in case brew is already installed
print "Homebrew: Running update ..."
/opt/homebrew/bin/brew update

/opt/homebrew/bin/brew tap homebrew/cask-fonts

let $apps = (open ~/.dotfiles/apps.yaml)

$apps.homebrew | each { 
    /opt/homebrew/bin/brew install $in
}

exit

$apps.appstore | each { 
    /opt/homebrew/bin/mas install $in
}

# addresses "VSCodium.app” can’t be opened because Apple cannot check it for malicious software.
codesign --sign - --force --deep /Applications/VSCodium.app
xattr -d com.apple.quarantine /Applications/VSCodium.app

curl -fsSL https://get.pnpm.io/install.sh | sh -

 
$apps.remove | each {
    if ( $in | path exists) { 
        print $"Uninstalling ($in)"
        trash $in 
    }
}

exit
