#!/bin/bash
# Tag root ebs volumes

set -o errexit
set -o xtrace
set -o nounset
AWS_INSTANCE_ID=$(curl http://169.254.169.254/latest/meta-data/instance-id)

Instance_Name=$(aws ec2 describe-instances --instance-ids ${AWS_INSTANCE_ID} --query 'Reservations[0].Instances[0]
.Tags[?Key==`Name`].Value' --output text)
RootDeviceName=$(aws ec2 describe-instances --instance-ids ${AWS_INSTANCE_ID} --query 'Reservations[0].Instances[0
].RootDeviceName' --output text)
RootVolumeId=$(aws ec2 describe-instances --instance-ids ${AWS_INSTANCE_ID} --query "Reservations[0].Instances[0].
BlockDeviceMappings[?DeviceName==\`${RootDeviceName}\`].Ebs.VolumeId" --output text)


#ROOT_DISK_ID=$(aws ec2 describe-volumes --filter "Name=attachment.instance-id, Values=$(AWS_INSTANCE_ID)" --query
 "Volumes[].VolumeId" --out text)
aws ec2 create-tags --resources ${RootVolumeId} --tags Key=Name,Value=Root-Volume-${Instance_Name} --tags Key=Appl
ication,Value=gitlab