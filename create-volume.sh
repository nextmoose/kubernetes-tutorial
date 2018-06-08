#!/bin/sh

sudo docker volume create --driver lvm --opt size=1G --opt=thinpool kubernetes-tutorial