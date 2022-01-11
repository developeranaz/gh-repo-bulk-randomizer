#!/bin/bash
echo "$gh_token" > /token.txt

#authorize
gh auth login --with-token < /token.txt
#authorized

