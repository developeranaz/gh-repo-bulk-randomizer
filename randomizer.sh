#!/bin/bash

#authorize
echo "$gh_token" > /token.txt
gh auth login --with-token < /token.txt
#authorized using token

#repository list update
wget "$repolist_in_url" -O /.ignore
cat /.ignore |sed '/#/d' >/repolist.txt
#repository list updated to repolist.txt
cat /reponame.txt |sed 's/^/REPONAME="/g' |sed 's/$/"; /g' >env1
cat /repolist.txt |sed 's/^/gh repo clone /g' |sed 's/$/; cd \//g' >/s1
cat /repolist.txt |sed 's|https://github.com/|prefix180|g' |sed 's/\//\nsuperprefix180/g' |grep 'superprefix180' |sed 's/superprefix180//g' >/reponame.txt
paste -d'\0' /env1 /s1 /reponame.txt |sed 's/$/; gh repo rename "developeranaz-$REPONAME$RANDOM" -y; bash \/script.sh; git init; git add .; git commit -m "$date"; git push; cd \//g'
## end line +(above )not compl*d
#not yet coml*ted
