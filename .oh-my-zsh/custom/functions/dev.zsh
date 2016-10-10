
function gitcleanbranch() {
    CURRENT_BRANCH=$(echo `git_current_branch`)
    git checkout master
    git pull
    git branch -D $CURRENT_BRANCH
    git push origin --delete $CURRENT_BRANCH
}

function gitcleanup() {
    if [ "$1" = "dryrun" ]; then
        for b in `git branch --merged | grep -v \*`; do echo $b; done
    else
        for b in `git branch --merged | grep -v \*`; do 
            if [ $b = "master" ]; then
                echo "Skipping over master branch"
            else
                git branch -D $b; 
            fi
        done
    fi
}
