#!/bin/bash
sshpass -p 'apj0702' ssh -t gor@10.23.17.39 "cd /home/gor/embd_logs/charger;./test.sh" > /tmp/bhar.txt
