#! /bin/bash
rsync -rtv ./vm-image/etc/confd/*  root@192.168.13.165:/etc/confd/
rsync -rtv ./vm-image/opt/zkapp/*  root@192.168.13.165:/opt/zkapp/


