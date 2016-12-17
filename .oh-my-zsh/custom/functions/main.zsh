
function mailvelope() {
    email="$1"
    if [ -z "$email" ]; then
        echo "Please provide an email address to search for!"
    else
        python - << END
import urllib2
import json

try:
    req = urllib2.urlopen('https://keys.mailvelope.com/api/v1/key?email={email}'.format(email="$email"))
    content = json.loads(req.read()) 
    for key, val in content.items():
        if key == 'publicKeyArmored':
            print('\033[1m{key}:\033[0m \n{val}'.format(key=key, val=val))
    
        else:
            print('\033[1m{key}:\033[0m {val}'.format(key=key, val=val))
except urllib2.HTTPError:
    print('No key found for "{email}"'.format(email="$email"))
END
    fi
}
