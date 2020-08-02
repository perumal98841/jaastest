#!/bin/bash
if [ "$Environment" == "DEV" ]; then
	{
	echo I am in DEV
    echo $Environment
    export AWS_ACCESS_KEY_ID=$DEV_AWS_ACCESS_KEY_ID
	export AWS_SECRET_ACCESS_KEY=$DEV_AWS_SECRET_ACCESS_KEY
    mv dev.terraform.tfstate terraform.tfstate
    terraform destroy -auto-approve jaas-terraform/env/dev
    ls -ls
    mv terraform.tfstate dev.terraform.tfstate
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
    terraform destroy -auto-approve jaas-terraform/env/prod
	ls -ls
	mv terraform.tfstate prod.terraform.tfstate
    ls | grep -v dev.terraform.tfstate | grep -v prod.terraform.tfstate | xargs rm -Rf
    echo "=========================="
	ls -ls
    }
fi
