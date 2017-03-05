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

_dpy_image_name() {
    PY_SCRIPT="$1"
    PY_SCRIPT_PATH="$PWD/$PY_SCRIPT"
    echo "$PY_SCRIPT_PATH" | tr / _ | cut -c2- | awk '{print tolower($0)}'
}

_dpy_build() {
    DOCKER_IMAGE="$1"
    PY_SCRIPT="$2"
    DOCKERFILE="$PWD/Dockerfile.dpy"
    if [ ! -e "$DOCKERFILE" ]; then
        DOCKERFILE="$PWD/.Dockerfile-$PY_SCRIPT"
    
        echo "FROM $PYTHON_IMAGE" > $DOCKERFILE
    
        DOCKER_IMAGE=$(_dpy_image_name $PY_SCRIPT)
        docker build -t "$DOCKER_IMAGE"  -f "$DOCKERFILE" . 
    
        rm "$DOCKERFILE"
    else
        docker build -t "$DOCKER_IMAGE" -f "$DOCKERFILE" .
    fi
}

dpyrm() {
    if [ ! -z "$1" ]; then
        DOCKER_IMAGE=$(_dpy_image_name "$1")
        if [ ! -z $(docker images -q "$DOCKER_IMAGE") ]; then
            docker rmi "$DOCKER_IMAGE"
        fi
    fi
}

dpy() {
    PY_SCRIPT="$1"
    PY_SCRIPT_PATH="$PWD/$PY_SCRIPT"
    if [ ! -e "$PY_SCRIPT_PATH" ]; then
        echo "Must be run from the same directory as $PY_SCRIPT"
        return 1
    fi

    if [ -e "requirements.txt" ]; then
        PYTHON_IMAGE=python:3-onbuild
    else
        PYTHON_IMAGE=
    fi

    if [ ! -z "$PYTHON_IMAGE" ]; then
        DOCKER_IMAGE=$(_dpy_image_name "$PY_SCRIPT")
        if [ -z $(docker images -q "$DOCKER_IMAGE") ]; then
            _dpy_build "$DOCKER_IMAGE" "$PY_SCRIPT"
        fi
    else
        DOCKER_IMAGE=python:3
    fi

    DPY_CUSTOM_RUN="$PWD/dpy.run"
    if [ ! -e "$DPY_CUSTOM_RUN" ]; then
        docker run -it --rm \
                       --name "$PY_SCRIPT" \
                       -v "$PWD":/usr/src/myapp \
                       -w /usr/src/myapp \
                       $DOCKER_IMAGE python "$@"
    else
        DOCKER_IMAGE="$DOCKER_IMAGE" bash dpy.run "$@"
    fi

}

