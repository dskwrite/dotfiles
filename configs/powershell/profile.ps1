oh-my-posh init pwsh --config ~/.dotfiles/configs/oh-my-posh/dskwrite.omp.yaml | Invoke-Expression
Invoke-Expression (& { (zoxide init powershell | Out-String) })
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete