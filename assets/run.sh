#!/bin/bash

echo $MYHOSTNAME > /etc/mailname
postconf -e myhostname=$MYHOSTNAME
postconf -e mynetworks=172.16.0.0/12
touch /var/log/mail.log
chown syslog:adm /var/log/mail.log
service rsyslog start

service postfix start
tail -f /var/log/mail.log
