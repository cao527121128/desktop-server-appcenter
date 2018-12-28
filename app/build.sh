#! /bin/bash
rm -fr desktop_server_appcenter.tar.gz 
tar czvf desktop_server_appcenter.tar.gz --exclude=./build.sh  .
/bin/cp -fr desktop_server_appcenter.tar.gz /mnt/hgfs/vmware-fedora25-share/bin/
