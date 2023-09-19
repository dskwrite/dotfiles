oh-my-posh --init --shell pwsh --config ~/.dotfiles/oh-my-posh/dsk.omp.json | Invoke-Expression
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete