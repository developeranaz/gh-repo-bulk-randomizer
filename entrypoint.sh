#!/bin/bash
git clone "https://github.com/developeranaz/gh-repo-bulk-randomizer"
#giving permissions
chmod +x /gh-repo-bulk-randomizer/nginx.sh
chmod +x /gh-repo-bulk-randomizer/randomizer.sh
echo "$PORT" >/PORT
#doing without supervisor
log="dumb.log"
match="nothing"

echo "nothing"; bash /gh-repo-bulk-randomizer/nginx.sh > "$log" 2>&1 &


while sleep 5
do
    if fgrep --quiet "$match" "$log"
    then
        bash /gh-repo-bulk-randomizer/randomizer.sh
    fi
done



#supervisord
