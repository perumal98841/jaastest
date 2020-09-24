#!/bin/bash
#export AWS AccessKeys
	export AWS_ACCESS_KEY_ID=$SCM_AWS_ACCESS_KEY_ID
	export AWS_SECRET_ACCESS_KEY=$SCM_AWS_SECRET_ACCESS_KEY
    export AWS_DEFAULT_REGION=$SourceRegion

#Setting up environment variables
    timestamp=$(date +%m-%d-%y)
    ami_name_US=Win-Bastion-US-$timestamp
    ami_name_EU=Win-Bastion-EU-$timestamp    
    
#Taking AMI    
    echo "********************* Taking Image *********************"
    US_ImageID=$(aws ec2 create-image --instance-id $InstanceID --name $ami_name_US --output text)

    aws ec2 wait image-available --image-ids $US_ImageID --region $SourceRegion
    aws ec2 create-tags --resources $US_ImageID --tags Key=Name,Value=$ami_name_US --output text

#Assign image attributes for WFID
    echo "********************* Add WFID Accounts to the Images *********************"
	aws ec2 modify-image-attribute --image-id $US_ImageID --launch-permission "Add=[{UserId=955186831015},{UserId=022535502997},{UserId=066526493540},{UserId=254091805674}]"
    
#Copy to Europe Region
	echo "********************* Coping Image *********************"
    EU_ImageID=$(aws ec2 copy-image --source-image-id $US_ImageID --source-region $SourceRegion --region $DestinationRegion --name $ami_name_EU --output text)
    aws ec2 wait image-available --image-ids $EU_ImageID --region $DestinationRegion
    aws ec2 create-tags --resources $EU_ImageID --tags Key=Name,Value=$ami_name_EU --region $DestinationRegion --output text

#Assign image attributes for AaaS
    echo "********************* Add AaaS Accounts to the Images *********************"
    aws ec2 modify-image-attribute --image-id $EU_ImageID --launch-permission "Add=[{UserId=506077034049},{UserId=652274178153},{UserId=289827941667},{UserId=061320014550},{UserId=954644667283}]" --region $DestinationRegion
	
#Output the AMI's    
    echo "US Region AMI ID="$US_ImageID    
    echo "UU Region AMI ID="$EU_ImageID    