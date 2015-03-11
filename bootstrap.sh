#!/bin/bash

source ~/.shcolor.sh 2>/dev/null || source <(curl -s https://raw.githubusercontent.com/kba/shcolor/master/shcolor.sh|tee ~/.shcolor.sh)

while [[ -z "$NAME" ]];do
    echo -n "`C 3`Enter name: `C 9`"
    read NAME
done
while [[ -z "$GITHUB_USER" ]];do
    echo -n "`C 3`Enter Github username: `C 9`"
    read GITHUB_USER
done
echo -n "`C 3`Enter description: `C 9`"
read DESC

package=$(cat package.json.tpl \
    | sed "s,\\\$NAME,$NAME," \
    | sed "s,\\\$DESC,$DESC," \
    | sed "s,\\\$REPO,$GITHUB_USER/$NAME," \
    )

echo "$package"
echo -n "`C 1`That seem about right? `C 9` <y/n>"
read yesno
if [[ "$yesno" == "y" ]];then
    dir=node_modules/$NAME
    mkdir -p $dir

    # copy files
    cp -r -t $dir src test .gitignore .npmignore
    
    # create package.json
    echo "$package" > $dir/package.json

    # Readme
    readme=$dir/README.md
    touch $readme
    echo "$NAME" >> $readme
    echo "$NAME" |sed 's/./=/g' >> $readme
    echo "" >> $readme
    echo $DESC >> $readme

    # init git
    cd $dir
    git init .
    git remote add origin "git@github.com/$GITHUB_USER/$NAME"
fi
