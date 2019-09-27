
# xl command line installieren
curl -LO https://dist.xebialabs.com/public/xl-cli/9.0.5/darwin-amd64/xl
chmod +x xl
sudo mv xl /usr/local/bin

# Installieren brew falls Du das noch nicht hast:
#!/bin/bash

############################
#helper script function
############################
setProperty(){
  awk -v pat="^$1=" -v value="$1=$2" '{ if ($0 ~ pat) print value; else print $0; }' $3 > $3.tmp
  mv $3.tmp $3
}


/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#Brew ist ein Paketmanager für OS X (ala apt oder apk bei Linux)

# Dann minishift installieren ... der lädt auch alle Abhängikeiten usw.
$ brew cask install --force minishift

# Vor dem Start brauchst Du einen Redhat Account:
# https://developers.redhat.com/auth/realms/rhd/protocol/openid-connect/registrations?client_id=web&redirect_uri=https%3A%2F%2Fdevelopers.redhat.com%2F%2Fconfirmation&state=dc759cde-4548-4aeb-8ba7-d49175118756&nonce=3750e062-03bc-442d-85a2-ba5cd7e88aea&response_mode=fragment&response_type=code

#Dann Virtual Box als Driver festlegen, dann muss man es nicht bei jedem start angeben
minishift config set vm-driver virtualbox

# Dann minishift starten, Du musst dann den user name und pwd von dem RH Developer account eingeben:
minishift start
# das kann dauern
#Token auslesen:
minishift console --url --request-oauth-token
# Den Token brauchst Du dann für deine XLD Connection..
echo "please update toke in the minishift.xvals file"
# Dann die XLD yamls einspielen.
MYTOKEN="$(oc whoami -t)"
############################
### usage: setProperty $key $value $filename
setProperty "token" $MYTOKEN "./minishift.xlvals"
import.sh



