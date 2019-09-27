
############################
#helper script function
############################
setProperty(){
  awk -v pat="^$1=" -v value="$1=$2" '{ if ($0 ~ pat) print value; else print $0; }' $3 > $3.tmp
  mv $3.tmp $3
}

MYTOKEN="$(oc whoami -t)"
############################
### usage: setProperty $key $value $filename
setProperty "token" $MYTOKEN "./minishift.xlvals"

