#!/bin/bash
#

# Global VARs
USR_ARCHV=$1
WORKING_DIR=$HOME/Downloads/IbmDsInstaller
CLNT_SETUP=$HOME/Downloads/IbmDsInstaller/Client

# The user needs to supply an archive
if [ -z $USR_ARCHV ]; then
    echo "This script requires a Data Studio Archive as an argument"
    exit 1
fi

# Create our working directory
if [ ! -d $WORKING_DIR ]; then
    mkdir -p $HOME/Downloads/IbmDsInstaller
fi

# Extract archive to our working directory
tar -zxvf $USR_ARCHV -C $HOME/Downloads/IbmDsInstaller

# Setup the installer.
# later you will be adding the following repo in the GUI.
#   com.ibm.dsida.im-offering-build-4.1.4-20211124.160709-33-im-offering.zip
if [ ! -d $CLNT_SETUP ]; then
    mkdir -p $CLNT_SETUP
    cd $CLNT_SETUP
    unzip ../agent.installer.linux.gtk.x86_64_1.9.1006.20210614_1906.zip
fi

# The following works on Ubuntu 20.04.
# It does not work on OpenSUSE 15.5.
if [ -e $CLNT_SETUP/install ]; then
    sudo $CLNT_SETUP/install
fi
