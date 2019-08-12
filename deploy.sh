#!/bin/bash
echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi

cd ~/blog

# Build the project. 
hexo g 
proxychains4 hexo d

# Push Hexo content 
git add -A
git commit -m "$msg"
proxychains4 git push  origin source
