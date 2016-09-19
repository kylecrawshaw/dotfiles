alias mux='tmuxomatic'
alias googler='docker run --rm -it --name googler kylecrawshaw/googler "$@"'
alias py3='docker run --rm -it -v "$PWD":/data/ kylecrawshaw/python3.5env python "$@"'
alias py3i='docker run --rm -it -v "$PWD":/data/ kylecrawshaw/python3.5env pip install "$@"'
