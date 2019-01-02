#! /bin/bash
#
# Copyright (C) 2018 Yunify Inc.
#
#
# check if apache2 port is ready
# check apache2 vdi_portal port:8897
vdi_portal_port_status=$(netstat -tulpen | grep 8897)
echo "vdi_portal_port_status == $vdi_portal_port_status"
if [ "$vdi_portal_port_status" != "" ]
then
    vdi_portal_port_Ready=true
else
    vdi_portal_port_Ready=false
fi
echo "vdi_portal_port_Ready == $vdi_portal_port_Ready"

# check apache2 desktop port:7776
desktop_port_status=$(netstat -tulpen | grep 7776)
echo "desktop_port_status == $desktop_port_status"
if [ "$desktop_port_status" != "" ]
then
    desktop_port_Ready=true
else
    desktop_port_Ready=false
fi
echo "desktop_port_Ready == $desktop_port_Ready"

# check if nginx port:80 is ready
nginx_port_status=$(netstat -tulpen | grep 80 | grep nginx)
echo "nginx_port_status == $nginx_port_status"
if [ "$nginx_port_status" != "" ]
then
    nginx_port_Ready=true
else
    nginx_port_Ready=false
fi
echo "nginx_port_Ready == $nginx_port_Ready"

# check if desktop_server service is running
desktop_server_status=$(supervisorctl status desktop_server | grep RUNNING)
if [ "$desktop_server_status" != "" ]
then
    desktop_server_Ready=true
else
    desktop_server_Ready=false
fi
echo "desktop_server_Ready == $desktop_server_Ready"

if [ $vdi_portal_port_Ready == "true" ]&&[ $desktop_port_Ready == "true" ]&&[ $nginx_port_Ready == "true" ]&&[ $desktop_server_Ready == "true" ]
then
    exit 0
else
    exit 1
fi
