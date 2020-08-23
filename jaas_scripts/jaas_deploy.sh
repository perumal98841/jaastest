#!/bin/bash
if [ "$Environment" == "DEV" ]; then
	{
	echo I am in DEV
    echo $Environment
    export AWS_ACCESS_KEY_ID=$DEV_AWS_ACCESS_KEY_ID
	export AWS_SECRET_ACCESS_KEY=$DEV_AWS_SECRET_ACCESS_KEY
    mv dev.terraform.tfstate terraform.tfstate
    mv dev.terraform.tfstate.backup terraform.tfstate.backup
    terraform init jaas_terraform/env/dev
    terraform plan jaas_terraform/env/dev
    terraform apply -auto-approve jaas_terraform/env/dev
	ls -ls
    mv terraform.tfstate dev.terraform.tfstate
    mv terraform.tfstate.backup dev.terraform.tfstate.backup
    cp -f dev.terraform.tfstate ../jaas_destroy_note/.
    cp -f dev.terraform.tfstate.backup ../jaas_destroy_note/.
    cp -Rf .terraform ../jaas_destroy_note/.
    ls | grep -v dev.terraform.tfstate | grep -v prod.terraform.tfstate | xargs rm -Rf
    echo "=========================="
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
    terraform init jaas_terraform/env/prod
    terraform plan jaas_terraform/env/prod
    terraform apply -auto-approve jaas_terraform/env/prod
	ls -ls
	mv terraform.tfstate prod.terraform.tfstate
    mv terraform.tfstate.backup prod.terraform.tfstate.backup
    cp -f prod.terraform.tfstate ../jaas_destroy_note/.
    cp -f .terraform/modules/modules.json ../jaas_destroy_note/.terraform/modules/modules.json
    ls | grep -v dev.terraform.tfstate | grep -v prod.terraform.tfstate | xargs rm -Rf
    echo "=========================="
	ls -ls
    }
fi
