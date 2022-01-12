#!/bin/bash

#authorize
echo "$gh_token" > /token.txt
gh auth login --with-token < /token.txt
#authorized using token

#repository list update
wget "$repolist_in_url" -O /.ignore
cat /.ignore |sed '/#/d' >/repolist.txt
#repository list updated to repolist.txt
cat /repolist.txt |sed 's|https://github.com/|prefix180|g' |sed 's/\//\nsuperprefix180/g' |grep 'superprefix180' |sed 's/superprefix180//g' >/reponame.txt
cat /reponame.txt |sed 's/^/REPONAME="/g' |sed 's/$/"; /g' >env1
#repo new name env2
cat /reponame.txt|sed 's/$/ignoreme170/g' |sed 's/-n-/\n/g' |grep 'developeranaz' |sed 's/^/REPONEWNAME="/g' |sed 's/$/-n-$(randomhash)"; /g' /envnewname

#linkname env3
cat /reponame.txt|sed 's/$/ignoreme170/g' |sed 's/-n-/\n/g' |grep 'developeranaz' >repoid
#dottxt
cat /repoid |sed 's/$/.txt/g' >/repolinktxt
#to data repo 
# echo "https://$prefix/$newnames" >/datarepo/$datareponame/$repolinktxt; √push
cat /envnewname | sed 's|^|echo "$PREFIXURL/|g' |sed 's/$/" >\/datarepo\/$datareponame\//g' >/push1
paste -d'\0' /push1 /repolinktxt >savedottxt
#paste push1

cat /repolist.txt |sed 's/^/gh repo clone /g' |sed 's/$/; cd \//g' >/s1
paste -d'\0' /envnewname /env1 /s1 /reponame.txt |sed 's/$/; gh repo rename "$REPONEWNAME" -y; cd \//g' >final1
## end line +(above )not compl*d
#not yet coml*ted
