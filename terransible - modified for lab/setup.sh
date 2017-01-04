curl -O https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
sudo pip install awscli

sudo apt-get update
sudo apt-get -y install unzip
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible

wget https://releases.hashicorp.com/terraform/0.7.10/terraform_0.7.10_linux_amd64.zip
mkdir ~/terraform
unzip terraform_0.7.10_linux_amd64.zip -d ~/terraform
export PATH=$PATH:~/terraform

ssh-keygen
ssh-agent bash
ssh-add ~/.ssh/id_rsa

aws route53 create-reusable-delegation-set --caller-reference 12345

echo "Now put that Id in the terraform.tfvars file"