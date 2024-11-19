$env:PATH = "/opt/homebrew/bin:" + $env:PATH

Invoke-Expression (& { (zoxide init powershell | Out-String) })