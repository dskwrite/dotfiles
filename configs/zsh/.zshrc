export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/opt/homebrew/bin

# pnpm
export PNPM_HOME="/Users/dsk/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end