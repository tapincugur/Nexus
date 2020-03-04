#!/bin/bash
REPOSITORY=private_releases
NEWREPOSITORY=maven-releases
EXTENSIONS="*.jar *.war *.pom *.xml *.md5 *.sha1 *.zip"
USERNAME="admin"
PASSWORD="PASSWORD"
DURL="167.172.111.73"

for tosearch in $EXTENSIONS;
do
    for file in `find / -name $tosearch | grep "sonatype-work" | egrep -v 'trash|SNAPSHOT'`;
    do
        path=${file}
        newpath=$(echo $path | awk -F"attributes" '{print $2}')
        echo "curl -v -u '$USERNAME:$PASSWORD' --upload-file $path http://$DURL/repository/$NEWREPOSITORY$newpath"
        curl -v -u '$USERNAME:$PASSWORD' --upload-file $path http://$DURL/repository/$NEWREPOSITORY$newpath
    done;
