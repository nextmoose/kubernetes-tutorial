#!/bin/sh

sudo docker volume create --driver lvm --opt size=10G --opt=thinpool kubernetes-tutorial