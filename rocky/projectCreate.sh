packer init rocky/packer
packer validate rocky/packer
packer build -only nutanix.rocky rocky/packer

terraform -chdir=rocky/terraform init
terraform -chdir=rocky/terraform plan
terraform -chdir=rocky/terraform apply -input=false -auto-approve