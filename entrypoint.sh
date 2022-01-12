#!/bin/bash
git clone "$selfrepository"
#giving permissions
chmod +x /gh-repo-bulk-randomizer/nginx.sh
chmod +x /gh-repo-bulk-randomizer/randomizer.sh
mkdir /datarepo
cd /datarepo; git clone "$datarepository"

#doing without supervisor
log="dumb.log"
match="nothing to match run nginx run "

echo "nothing to match run nginx run "; bash /gh-repo-bulk-randomizer/nginx.sh > "$log" 2>&1 &


while sleep 5
do
    if fgrep --quiet "$match" "$log"
    then
        bash /gh-repo-bulk-randomizer/randomizer.sh
    fi
done



#supervisord
