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

#not yet coml*ted
