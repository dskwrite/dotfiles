# Add Homebrew to PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

# Initialize Starship
eval "$(starship init bash)"

# Initialize Zoxide
eval "$(zoxide init bash)"

# Initialize Atuin
eval "$(atuin init bash)"

# Initialize Carapace (check Carapace docs for latest Bash snippet)
# Example: source <(carapace _carapace bash)

# Your other Bash settings...