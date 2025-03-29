# Set PATH first
$env.PATH = ($env.PATH | split row (char esep) | prepend $'($env.HOME)/.nix-profile/bin')
$env.PATH = ($env.PATH | split row (char esep) | prepend '/opt/homebrew/bin')
$env.PATH = ($env.PATH | split row (char esep) | prepend '/Users/dsk/.local/bin') # uv installed tools

# Now generate init scripts
mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu

$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
mkdir ~/.cache/carapace
carapace _carapace nushell | save --force ~/.cache/carapace/init.nu

#atuin init nu | save -f ~/.local/share/atuin/init.nu

zoxide init nushell | save -f ~/.zoxide.nu