# Automate-EC2-Alarm-Creation

The given code is a Bash script that creates Amazon CloudWatch alarms for CPU, memory, and disk utilization for EC2 instances in AWS. When the thresholds for these metrics are exceeded, the alarms will send an alert to an Amazon SNS topic that is specified by an ARN.

Code Explanation:
The code starts by defining threshold values for CPU, memory, and disk utilization. These thresholds are set to 90% by default but can be changed according to specific requirements.

The next line sets the Amazon SNS ARN to which the alarms will send alerts. This variable should be updated with a valid SNS ARN that the user has access to.

The array variable contains a list of EC2 instances with their instance IDs and names. Each element in the array is in the format "Instance_Name:Instance_ID". The script iterates through this array to create CloudWatch alarms for each EC2 instance.

The script then creates three CloudWatch alarms for each instance: one for CPU utilization, one for memory utilization, and one for disk utilization. Each alarm has a unique name and description that includes the instance name and a message stating that the utilization has reached above 90%.

The script specifies the metric name, namespace, statistic, period, threshold, comparison operator, dimensions, evaluation periods, alarm actions, and unit for each alarm. These parameters are used to configure the alarm to trigger when the specified threshold is exceeded for the specified metric.
