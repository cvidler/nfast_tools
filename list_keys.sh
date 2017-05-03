#!/bin/bash
# Lists all keys stored locally

NFASTDIR=/opt/nfast

if [ ! -r $NFASTDIR/bin ]; then
	echo "Can't find NFast binaries."
	exit 1
fi


OLDDIR=`pwd`
cd $NFASTDIR
NFAST_KEYS=`sudo ./bin/kmfile_dump ./kmdata/local/key_pkcs11_*`
if [ $? -ne 0 ]; then
	echo "FATAL: Couldn't query NFast keys"
	exit 1
fi

RTM_KEYS=`sudo rcmd show ssldecr keys`
if [ $? -ne 0 ]; then
	echo "FATAL: Couldn't query AMD (rcmd)"
	exit 1
fi




cd $OLDDIR


