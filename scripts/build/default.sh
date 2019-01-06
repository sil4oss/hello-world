#!/usr/bin/env bash

SCRIPTDIR=`dirname $0`
BASEDIR=$SCRIPTDIR/../..
BUILDDIR=$BASEDIR/build

mkdir $BUILDDIR
pushd $BUILDDIR

cmake ..
make -j$((`nproc`+1))
popd
