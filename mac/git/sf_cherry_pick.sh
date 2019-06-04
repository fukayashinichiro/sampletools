#!/bin/sh
# options :  $REPO $SHA

REPO=$1
cd $REPO
pwd
shift 1

echo SHA $*

MERGE_COMMIT=off
for S in $* ; do
  git log --oneline -n 1 $S | grep "Merge pull request"
  if [ $? -eq 0 ] ; then
    MERGE_COMMIT=on
  fi
done

if [ $MERGE_COMMIT == "on" ] ; then
  GIT_OPTS="-m 1"
fi

echo git cherry-pick $GIT_OPTS  $*
git cherry-pick $GIT_OPTS  $*


