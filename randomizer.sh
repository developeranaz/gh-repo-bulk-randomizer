#!/bin/bash

#authorize
echo "$gh_token" > /token.txt
gh auth login --with-token < /token.txt
#authorized using token

#repository list update
wget "$repolist_in_url" -O /.ignore
cat /.ignore |sed '/#/d' >/repolist.txt
#repository list updated to repolist.txt
cat /repolist.txt |sed 's|||g'
cat /repolist.txt |sed 's|https://github.com/|prefix180|g' |sed 's/\//\nsuperprefix180/g' |grep 'superprefix180' |sed 's/superprefix180//g' >reponame.txt
#not yet coml*ted
