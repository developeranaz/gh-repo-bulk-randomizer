#!/bin/bash

#authorize
cp /gh-repo-bulk-randomizer/gitpusher /usr/bin/gitpusher
chmod +x /usr/bin/gitpusher
echo "$gh_token" > /token.txt
gh auth login --with-token < /token.txt
#authorized using token

#repository list update
cat /gh-repo-bulk-randomizer/repositorylist.txt >/.ignore
#wget "$repolist_in_url" -O /.ignore
cat /.ignore |sed '/#/d' >/repolist.txt
#repository list updated to repolist.txt

#file names are stored as txt
#folder- /datarepository
cd /
git clone https://github.com/dev-extended/datarepository

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

cat /repolist.txt | sed 's/^/gh repo clone "/g' |sed 's/$/";/g' | sed 's/$/ cd "\/$REPONAME"; gh repo rename "$REPONEWNAME" -y; echo "https:\/\/github.com\/$REPONEWNAME" >\/datarepository\/$REPOID.txt; cd \/; echo "$REPONEWNAME $REPOID.txt"> party.txt/g' >/ghrnpu

paste -d'\0' /envoldreponameequals /envnewreponameequals /ghrnpu >/superscript.sh
cd /
date > /date
chmod +x /superscript.sh
bash /superscript.sh
cd /datarepository
git init 
git add .
git commit -m "$(cat /date)"
cd /datarepository; /usr/bin/gitpusher
while :
do 
sleep 10
date > /var/www/html/index.html
done

