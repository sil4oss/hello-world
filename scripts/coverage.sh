#!/usr/bin/env bash

SCRIPTDIR=`dirname $0`
BASEDIR=$SCRIPTDIR/..
BUILDDIR=$BASEDIR/build

mkdir $BUILDDIR
pushd $BUILDDIR

cmake -DENABLE_GCOV=1 ..
make -j$((`nproc`+1))
popd
