#!/bin/bash
acsun_build=$1

echo "getting new build"
wget --user jenkins --password jenkins http://nexus/repository/task7deploy/$acsun_build && echo "completed"

echo "prepearing env"
mkdir -p -v ~/current ~/dist ~/old && echo "completed"

echo "deleting old backup"
rm -rf -v ~/old/*.tar.gz && echo "completed"

echo "backup (old)current build to old"
mv ~/current/*.tar.gz ~/old/ && echo "completed"

echo "move new build to current"
mv ~/*.tar.gz ~/current/ && echo "completed"

echo "cleaning dist"
rm -rf -v ~/dist/* && echo "completed"

echo "unpacking current build to dist"
tar xvf  ~/current/*.tar.gz -C ~/dist/ && echo "completed" 

echo "undeploying current app"
mv ~/custom/deploy/acsun.war ~/ && echo "completed"

echo "move from dist to prod"
mv ~/dist/acsun.war ~/custom/deploy/ && echo "completed"

echo "backing up current prod app and puting it to ~/old/"
tar czvf ~/old/acsun.war.prod.tar.gz acsun.war && echo "completed"

echo "cleaning"
rm -rf -v acsun.war/ && echo "completed"
