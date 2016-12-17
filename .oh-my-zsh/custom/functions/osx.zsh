
function fix_brew() {
    sudo chown -R $(whoami) /usr/local
    brew link pkg-config
}
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

function bzapp() {
    APP_PATH="$1"
    # Make sure arg $1 ends with .app
    if [ "${APP_PATH##*.}" != "app" ]; then
        echo "Invalid type. Must be an app ending in .app!"
    else
        APP_BASE_PATH=$(dirname "$APP_PATH")
        APP_BUNDLE=$(basename "$APP_PATH")
        OUT_DIR=${2:-"$PWD"}
        CUR_DIR="$PWD"
        TAR_FILE="$APP_BUNDLE.tar.bz2"

        cd $APP_BASE_PATH
        /usr/bin/tar cvjf $TAR_FILE $APP_BUNDLE
        echo 
        if [[ ${OUT_DIR:0:1} != "/" ]]; then
            OUT_DIR=$CUR_DIR/$OUT_DIR
        fi
        mkdir -p $OUT_DIR
        mv $TAR_FILE $OUT_DIR
        cd $CUR_DIR
    fi
}

function cmc() {
    CONFIG_PROFILE_PATH="$1"
    if [ -z "$2" ]; then
        OUTPUT_PATH="$CONFIG_PROFILE_PATH"
    else
        OUTPUT_PATH="$2"
    fi

    if [ "${CONFIG_PROFILE_PATH##*.}" != "mobileconfig" ]; then
        echo "Invalid type. Must end in .mobileconfig"
    else
        openssl smime -inform DER -verify -in "$CONFIG_PROFILE_PATH" -noverify 2>/dev/null | xmllint --pretty 1 --output "$OUTPUT_PATH" -
    echo "Removed profile signing: $OUTPUT_PATH"
    fi
}
