#!/bin/bash

ANDROOT=$PWD

pushd () {
    command pushd "$@" > /dev/null
}

popd () {
    command popd "$@" > /dev/null
}

repo sync -j8 --current-branch --no-tags

pushd $ANDROOT/frameworks/opt/net/wifi
git fetch https://github.com/LineageOS/android_frameworks_opt_net_wifi refs/changes/26/206926/3 && git cherry-pick FETCH_HEAD
popd

pushd $ANDROOT/bionic
git fetch https://github.com/LineageOS/android_bionic refs/changes/70/206170/2 && git cherry-pick FETCH_HEAD
popd

pushd $ANDROOT/build/make
git fetch https://github.com/LineageOS/android_build refs/changes/71/206171/2 && git cherry-pick FETCH_HEAD
popd

pushd $ANDROOT/device/rr/sepolicy
git fetch https://github.com/LineageOS/android_device_lineage_sepolicy refs/changes/97/206797/5 && git cherry-pick FETCH_HEAD
popd
