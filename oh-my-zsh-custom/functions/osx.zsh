
function fix_brew() {
    sudo chown -R $(whoami) /usr/local
    brew link pkg-config
}
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
