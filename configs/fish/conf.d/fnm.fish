#### Tools installed with `npm --global install`
# Use hardcoded path instead of `(npm bin --global)` to decrease load time
set -x PATH /usr/local/Cellar/node/*/bin $PATH

# Must be set after node to have priority
fnm env --use-on-cd | source
# fnm
set PATH "/Users/adrian/.fnm" $PATH
fnm env | source
