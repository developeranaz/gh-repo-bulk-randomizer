#!/bin/bash

#authorize
wget "$gtpusher" -O /usr/bin/gtpusher
chmod +x /usr/bin/gtpusher
echo "$gh_token" > /token.txt
gh auth login --with-token < /token.txt
#authorized using token
cd /
git clone https://github.com/dev-extended/datarepository
#repository list update
cat /datarepository/repositorylist.txt >/.ignore
#wget "$repolist_in_url" -O /.ignore
cat /.ignore |sed '/#/d' >/repolist.txt
#repository list updated to repolist.txt
rm /datarepository/repositorylist.txt
#file names are stored as txt
#folder- /datarepository


#only reponames for next step
cat /repolist.txt |sed 's|https://github.com/|prefix180|g' |sed 's/\//\nsuperprefix180/g' |grep 'superprefix180' |sed 's/superprefix180//g' >/reponame.txt

#REPONAME=OLD-REPO >oldreponameequals
cat /reponame.txt |sed 's/^/REPONAME="/g' |sed 's/$/"; /g' >/envoldreponameequals

#NEWREPONAME= NEW RANDOM REPONAME
cat /reponame.txt|sed 's/$/ignoreme170/g' |sed 's/-n-/\n/g' |grep 'developeranaz' |sed 's/^/REPONEWNAME="/g' |sed 's/$/-n-$(randomhash)"; /g' >/envnewreponameequals

#linkname part for sending to dottxt (only in the format list --not-env) #### has a "developeranaz" identifier
cat /reponame.txt|sed 's/$/ignoreme170/g' |sed 's/-n-/\n/g' |grep 'developeranaz' >/repoid
#repoid to env repoid
cat /repoid |sed 's/^/REPOID="/g' |sed 's/$/"; /g' >/envrepoidequals

##gh bulk cloning part #file ghrnpu + RENAMING +RENAME PUSHING + sending to txt to data repo
#command - gh repo clone htt....... --

cat /repolist.txt | sed 's/^/gh repo clone "/g' |sed 's/$/";/g' | sed 's/$/ cd "\/$REPONAME"; gh repo rename "$REPONEWNAME" -y; echo "https:\/\/github.com\/dev-extended\/$REPONEWNAME" >\/datarepository\/$REPOID; cd \/; echo "$REPONEWNAME $REPOID" >>party.txt; echo "https:\/\/github.com\/dev-extended\/$REPONEWNAME" >>\/datarepository\/repositorylist.txt/g' >/ghrnpu

paste -d'\0' /envrepoidequals /envoldreponameequals /envnewreponameequals /ghrnpu >/superscript.sh
cd /
date > /date
chmod +x /superscript.sh
bash /superscript.sh
cd /datarepository
git config --global user.name "dev-extended"
git config --global user.email "$gitemail"
git init 
git add .
git commit -m "$(cat /date)"
cd /datarepository; gtpusher
while :
do 
sleep 10
date > /var/www/html/index.html
done

