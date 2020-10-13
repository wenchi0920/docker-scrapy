#!/bin/bash

dname=$(/usr/bin/dirname $0)
dname=$(/bin/readlink -f "$dname")


IFS=$'\n'
for tag in `cat "${dname}/tag" | sort` ;
do
    echo "${tag}"
    cat "${dname}/Dockerfile.sample" | sed "s/{{VER}}/$tag/" > "${dname}/Dockerfile"
    git commit "${dname}/Dockerfile" -m "version ${tag}"
    git tag -f "${tag}"
done

git push origin master
git push -f --tag


