#!/bin/bash
git clone "https://github.com/developeranaz/gh-repo-bulk-randomizer"
#giving permissions
chmod +x /gh-repo-bulk-randomizer/nginx.sh
chmod +x /gh-repo-bulk-randomizer/randomizer.sh
echo "$PORT" >/PORT
set -ex
exec supervisord -c /supervisord.conf
#doing without supervisor
log="dumb.log"
match="nothinug"
#(cat '/gh-repo-bulk-randomizer/randomizer.sh'; cat '/gh-repo-bulk-randomizer/nginx.sh') | parallel
parallel /gh-repo-bulk-randomizer/randomizer.sh && bash /gh-repo-bulk-randomizer/nginx.sh
echo "nothinug"; bash /gh-repo-bulk-randomizer/nginx.sh > "$log" 2>&1 &


while sleep 5
do
    if fgrep --quiet "$match" "$log"
    then
        echo 'checking and working'
        bash /gh-repo-bulk-randomizer/randomizer.sh
    fi
done



#supervisord
