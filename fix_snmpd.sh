#!/bin/sh
PXE_URL=

# Copy snmpd.conf via bolt command
wget -O - $PXE_URL/snmpd.conf > /etc/snmp/snmpd.conf
cat /etc/snmp/snmpd.conf

# Restart snmpd services

systemctl restart snmpd 
systemctl status snmpd 