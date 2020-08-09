#!/bin/bash
if [ "$Environment" == "DEV" ]; then
	{
	echo I am in DEV
    echo $Environment
    export AWS_ACCESS_KEY_ID=$DEV_AWS_ACCESS_KEY_ID
	export AWS_SECRET_ACCESS_KEY=$DEV_AWS_SECRET_ACCESS_KEY
    mv dev.terraform.tfstate terraform.tfstate
    mv dev.terraform.tfstate.backup terraform.tfstate.backup
    terraform destroy -auto-approve jaas_terraform/env/dev
    ls -ls
    echo "=========================="
    ls | grep -v prod.terraform.tfstate |grep -v prod.terraform.tfstate.backup | xargs rm -Rf
    echo "=========================="
    rm -f ../jaas_deploy/dev.terraform.tfstate
    ls -ls

    }
else 
	{
	echo I am in PROD
    echo $Environment
    export AWS_ACCESS_KEY_ID=$PROD_AWS_ACCESS_KEY_ID
	export AWS_SECRET_ACCESS_KEY=$PROD_AWS_SECRET_ACCESS_KEY
    mv prod.terraform.tfstate terraform.tfstate
    mv prod.terraform.tfstate.backup terraform.tfstate.backup
    terraform destroy -auto-approve jaas_terraform/env/prod
	ls -ls
    echo "=========================="
    ls | grep -v dev.terraform.tfstate | grep -v dev.terraform.tfstate.backup | xargs rm -Rf
    echo "=========================="
        rm -f ../jaas_deploy/prod.terraform.tfstate
	ls -ls
    }
fi
