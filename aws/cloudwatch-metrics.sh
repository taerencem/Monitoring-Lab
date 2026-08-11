#!/bin/bash

INSTANCE=$1

aws cloudwatch get-metric-statistics \
  --metric-name CPUUtilization \
  --start-time $(date -u -d '10 minutes ago' +%Y-%m-%dT%H:%M:%SZ) \
  --end-time $(date -u +%Y-%m-%dT%H:%M:%SZ) \
  --period 300 \
  --namespace AWS/EC2 \
  --statistics Average \
  --dimensions Name=InstanceId,Value=$INSTANCE \
  --output json > ../examples/cloudwatch-output.json
