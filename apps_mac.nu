#!/usr/bin/env nu

#update brew in case brew is already installed
print "Homebrew: Running update ..."
/opt/homebrew/bin/brew update

/opt/homebrew/bin/brew tap homebrew/cask-fonts

let $apps = (open ~/.dotfiles/apps_mac.yaml)

for $app in $apps.homebrew { 
	/opt/homebrew/bin/brew install $app
}

for $app in $apps.homebrew_casks { 
	/opt/homebrew/bin/brew install $app --cask
}

for $app in $apps.appstore { 
	/opt/homebrew/bin/mas install $app
}

# addresses "VSCodium.app can’t be opened because Apple cannot check it for malicious software" message
codesign --sign - --force --deep /Applications/VSCodium.app
xattr -d com.apple.quarantine /Applications/VSCodium.app

# pnpm
curl -fsSL https://get.pnpm.io/install.sh | sh -

$apps.remove | each {
	if ( $in | path exists) { 
		print $"Uninstalling ($in)"
		trash $in 
	}
}

let $font_icloud_dir_path = "~/Library/Mobile Documents/com~apple~CloudDocs/fonts/berkeley-mono/TTF/"
let $font_file_names = (ls -a $font_icloud_dir_path).name | path basename

for $f in ( $font_file_names | where { $in =~ ^\..*\.icloud$ }  ) {
	let $d = ( $f | str replace -r '^\.(.*).icloud$' '$1' )
	brctl download ( $"($font_icloud_dir_path)($d)" | path expand )
}

cp ($"($font_icloud_dir_path)/*" | path expand) ~/Library/Fonts

defaults write com.googlecode.iterm2 PrefsCustomFolder -string "~/.dotfiles/configs/iterm2/"
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true

exit
