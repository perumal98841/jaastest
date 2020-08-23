#!/bin/bash
if [ "$Agent" == "START" ]; then
	{
	echo I am going to start Agent
    echo $Agent
    export AWS_ACCESS_KEY_ID=$DEV_AWS_ACCESS_KEY_ID
	export AWS_SECRET_ACCESS_KEY=$DEV_AWS_SECRET_ACCESS_KEY

	aws ec2 start-instances --instance-ids i-0c09e2ff48f58db85 --region us-east-1 --output json
    sleep 10
	echo Getting Eip, please wait
    echo "========================================================================================================"
	Eip=$(aws ec2 describe-instances --filters "Name=instance-id,Values=i-0c09e2ff48f58db85" --query "Reservations[*].Instances[*].PublicIpAddress" --region us-east-1 --output text)
	echo "========================================================================================================"
	SysStarted=$(curl -s http://whatismyip.akamai.com/)/32
	
    echo $SysStarted
    aws ec2 update-security-group-rule-descriptions-ingress --group-id sg-06073e0ec7574b399 --ip-permissions '[{"IpProtocol": "tcp", "FromPort": 22, "ToPort": 22, "IpRanges": [{"CidrIp": "'$SysStarted'", "Description": "SSH"}]}]' --region us-east-1
    aws ec2 update-security-group-rule-descriptions-ingress --group-id sg-06073e0ec7574b399 --ip-permissions '[{"IpProtocol": "tcp", "FromPort": 8080, "ToPort": 8080, "IpRanges": [{"CidrIp": "'$SysStarted'", "Description": "Jenkins"}]}]' --region us-east-1

    echo "=========================="
    ls -ls

	sed -i "s/\(<host>\)[^<]*\(<\/host>\)/\1$Eip\2/" /var/lib/jenkins/nodes/Linux-Agent/config.xml
    service jenkins restart
    }
else 
	{
	echo I am going to STOP
    echo $Agent
    export AWS_ACCESS_KEY_ID=$DEV_AWS_ACCESS_KEY_ID
	export AWS_SECRET_ACCESS_KEY=$DEV_AWS_SECRET_ACCESS_KEY
	aws ec2 stop-instances --instance-ids i-0c09e2ff48f58db85 --region us-east-1 --output json
    
    SysStarted=$(curl -s http://whatismyip.akamai.com/)/32 
    
    aws ec2 revoke-security-group-ingress --group-id sg-06073e0ec7574b399 --ip-permissions '[{"IpProtocol": "tcp", "FromPort": 22, "ToPort": 22, "IpRanges": [{
"CidrIp": "'$SysStarted'"}]}]' --region us-east-1
	aws ec2 revoke-security-group-ingress --group-id sg-06073e0ec7574b399 --ip-permissions '[{"IpProtocol": "tcp", "FromPort": 8080, "ToPort": 8080, "IpRanges": [{
"CidrIp": "'$SysStarted'"}]}]' --region us-east-1


	ls -ls
    }
fi
