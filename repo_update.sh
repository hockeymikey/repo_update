#!/bin/bash

ANDROOT=$PWD

pushd () {
    command pushd "$@" > /dev/null
}

popd () {
    command popd "$@" > /dev/null
}

if [ "$skip_sync" != "true" ]; then
repo sync -j$(nproc) --current-branch --no-tags --force-sync
fi

pushd $ANDROOT/frameworks/opt/net/wifi
#git fetch https://github.com/LineageOS/android_frameworks_opt_net_wifi refs/changes/26/206926/3 && git cherry-pick FETCH_HEAD
popd

pushd $ANDROOT/bionic
#git fetch https://github.com/LineageOS/android_bionic refs/changes/70/206170/2 && git cherry-pick FETCH_HEAD
popd

pushd $ANDROOT/build/make
#git fetch https://github.com/LineageOS/android_build refs/changes/71/206171/2 && git cherry-pick FETCH_HEAD
popd
