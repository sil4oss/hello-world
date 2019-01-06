#!/usr/bin/env bash

SCRIPTDIR=`dirname $0`
BASEDIR=$SCRIPTDIR/..
BUILDDIR=$BASEDIR/build

mkdir $BUILDDIR
pushd $BUILDDIR

cmake -DENABLE_CPPCHECK=1 ..
make -j$((`nproc`+1)) cppcheck
popd
