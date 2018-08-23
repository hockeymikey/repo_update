#!/bin/bash

ANDROOT=$PWD

pushd () {
    command pushd "$@" > /dev/null
}

popd () {
    command popd "$@" > /dev/null
}

repo sync -j8 --current-branch --no-tags --force-sync

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
git fetch https://github.com/LineageOS/android_device_lineage_sepolicy refs/changes/27/212927/7 && git cherry-pick FETCH_HEAD
git fetch https://github.com/LineageOS/android_device_lineage_sepolicy refs/changes/87/225587/1 && git cherry-pick FETCH_HEAD
popd

pushd $ANDROOT/packages/apps/Snap
git fetch https://github.com/LineageOS/android_packages_apps_Snap refs/changes/16/225516/2 && git cherry-pick FETCH_HEAD
popd

pushd $ANDROOT/packages/apps/Gallery2
git fetch https://github.com/LineageOS/android_packages_apps_Gallery2 refs/changes/86/225586/1 && git cherry-pick FETCH_HEAD
popd
