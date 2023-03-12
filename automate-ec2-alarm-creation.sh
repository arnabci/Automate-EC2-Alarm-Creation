#!/bin/bash

threshold_cpu=90
threshold_memory=90
threshold_disk=90

sns_arn= <AWS_SNS_ARN>

ARRAY=( "<Instance_Name_1>:Instance_ID_1"
        "<Instance_Name_2>:Instance_ID_2"
        "<Instance_Name_3>:Instance_ID_3")


for ec2 in "${ARRAY[@]}" ; do
    instancename="${ec2%%:*}"
    instanceid="${ec2##*:}"

aws cloudwatch put-metric-alarm --alarm-name "CPU Utilisation of "$instancename" is critical." --alarm-description "CPU Utilisation of "$instancename" is critical and has reached above 90%. Please take care of this on priority." --metric-name CPUUtilization --namespace AWS/EC2 --statistic Average --period 300 --threshold $threshold_cpu --comparison-operator GreaterThanThreshold  --dimensions "Name=InstanceId,Value=$instanceid" --evaluation-periods 2 --alarm-actions $sns_arn --unit Percent
aws cloudwatch put-metric-alarm --alarm-name "Memory Utilisation of "$instancename" is critical." --alarm-description "Memory Utilisation of "$instancename" is critical and has reached above 90%. Please take care of this on priority." --metric-name MemoryUtilization --namespace System/Linux --statistic Average --period 300 --threshold $threshold_memory --comparison-operator GreaterThanThreshold  --dimensions "Name=InstanceId,Value=$instanceid" --evaluation-periods 2 --alarm-actions $sns_arn --unit Percent
aws cloudwatch put-metric-alarm --alarm-name "Strorage Consumption of "$instancename" is critical." --alarm-description "Disk Utilisation of "$instancename" is critical and has reached above 90%. Please take care of this on priority." --metric-name DiskSpaceUtilization --namespace System/Linux --statistic Average --period 300 --threshold $threshold_disk --comparison-operator GreaterThanThreshold  --dimensions "Name=InstanceId,Value=$instanceid" "Name=MountPath,Value=/" --evaluation-periods 2 --alarm-actions $sns_arn --unit Percent

done
