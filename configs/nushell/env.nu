$env.PATH = ($env.PATH | split row (char esep) | prepend '/usr/local/bin')
$env.PATH = ($env.PATH | split row (char esep) | prepend '/opt/homebrew/bin')
$env.PATH = ($env.PATH | split row (char esep) | prepend '~/Library/pnpm')

oh-my-posh init nu --config ~/.dotfiles/configs/oh-my-posh/dskwrite.omp.yaml --print | save ~/.dotfiles/configs/oh-my-posh/.oh-my-posh.nu --force
zoxide init nushell | save -f ~/.dotfiles/configs/zoxide/.zoxide.nu