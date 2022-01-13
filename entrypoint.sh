#!/bin/bash
git clone "https://github.com/developeranaz/gh-repo-bulk-randomizer"
#giving permissions
chmod +x /gh-repo-bulk-randomizer/nginx.sh
chmod +x /gh-repo-bulk-randomizer/randomizer.sh

#doing without supervisor
log="dumb.log"
match="nothing"

echo "nothing"; bash /gh-repo-bulk-randomizer/nginx.sh 


#supervisord
