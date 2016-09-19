gmutt(){
	# subshell so we dont overwrite variables
	(
	export IMAP_SERVER=""
	export SMTP_SERVER=""

	docker run -it --rm \
		-e GMAIL \
		-e GMAIL_NAME \
		-e GMAIL_PASS \
		-e GMAIL_FROM \
		-e GPG_ID \
		-e IMAP_SERVER \
		-e SMTP_SERVER \
		-v $HOME/.gnupg:/home/user/.gnupg:ro \
		-v /etc/localtime:/etc/localtime:ro \
		--name mutt${account} \
		jess/mutt
	)
}

googler(){
    docker run --rm -it --name googler kylecrawshaw/googler "$@"
}

py3() {
    docker run --rm -it -v "$PWD":/data/ kylecrawshaw/python3.5env python "$@"
}

py3i() {
    docker run --rm -it -v "$PWD":/data/ kylecrawshaw/python3.5env pip install "$@"
}
