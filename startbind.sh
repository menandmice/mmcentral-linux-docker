#!/bin/sh
/usr/sbin/named -u bind
/usr/sbin/mmremoted -ubind -gbind -c/etc/bind/named.conf -f
