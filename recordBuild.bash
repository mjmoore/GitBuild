#!/bin/bash
toplevel=$(git rev-parse --show-toplevel)
cd $toplevel/.git

buildInfo=$toplevel/build.info
touch buildInfo

commitHash='Commit SHA-1: '
commitHash+=$(cat $(cat HEAD | awk '{split($0, path, " "); print path[2]}'))
echo $commitHash
echo $commitHash > $buildInfo

branch='Local Branch: '
branch+=$(cat HEAD | awk '{split($0, path, " "); print path[2]}')
echo $branch
echo $branch >> $buildInfo

remoteTracking='Remote Tracking Branch: '
remoteTracking+=$(git rev-parse --abbrev-ref --symbolic-full-name @{u})
echo $remoteTracking
echo $remoteTracking >> $buildInfo

echo $(date) >> $buildInfo