#!/bin/sh
sudo docker start `sudo docker ps -l -q`
