alias mux='tmuxomatic'
alias googler='docker run --rm -it --name googler kylecrawshaw/googler'
alias py3e='docker run --rm -it -v "$PWD":/data/ kylecrawshaw/python3.5env'
alias py3ei='py3e ipython'
alias py3pip='py3e pip'

function py3() {
    CURDIR=$PWD
    cd ~/
    py3e "$@"
    cd $CURDIR
}

function ipy3() {
    CURDIR=$PWD
    cd ~/
    py3ei "$@"
    cd $CURDIR
}

alias techo3='say yes; cd ~/ && echo "$@"'

alias dynamo='java -Djava.library.path=~/UtilityRepos/DynamoDBLocal_lib -jar ~/UtilityRepos/DynamoDBLocal.jar -sharedDb'
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
