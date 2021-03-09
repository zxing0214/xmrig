#!/bin/sh
set -x
host=`hostname`
sed -i 's/"rig\-id":.*$/"rig\-id":"${host}",/' /xmrig/config.json
/usr/bin/xmrig --rig-id "${host}" -c /xmrig/config.json