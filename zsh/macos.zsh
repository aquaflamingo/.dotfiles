export PREFERRED_CACHE_HOME=~/.cache

# Add /usr/local/bin for homebrew to path
export PATH="/usr/local/bin:${PATH}"
eval "$(/opt/homebrew/bin/brew shellenv)"

export HOMEBREW_NO_ENV_HINTS=true
