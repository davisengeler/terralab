Deploy to AWS with Ansible and Terraform Lab Notes
-------------

After starting the lab and logging into the EC2 instance with `ssh`, we need to prepare the environment. 

### Install `pip`

```
curl -O https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
```

### Install `awscli`

```
sudo pip install awscli
```

### Install `terraform`

First, install `unzip` with the following:

```sudo apt-get install unzip```

Then install `terraform`

```
wget https://releases.hashicorp.com/terraform/0.7.10/terraform_0.7.10_linux_amd64.zip
mkdir ~/terraform
unzip terraform_0.7.10_linux_amd64.zip -d ~/terraform
export PATH=$PATH:~/terraform
```

### Install `ansible`

```
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible
```

### Install `boto`

```
sudo pip install boto
```

### "Reusable delegation set"

```
aws route53 create-reusable-delegation-set --caller-reference 12345
```

Take note of the `Id` that is returned. Here's my output, for example: 

```
{
    "Location": "https://route53.amazonaws.com/2013-04-01/delegationset/NAICFA5JKLGEJ", 
    "DelegationSet": {
    "NameServers": [
    "ns-1340.awsdns-39.org", 
    "ns-166.awsdns-20.com", 
    "ns-1911.awsdns-46.co.uk", 
    "ns-990.awsdns-59.net"
    ], 
    "CallerReference": "12345", 
    "Id": "/delegationset/NAICFA5JKLGEJ"
}
}
```

We are interested in the `NAICFA5JKLGEJ` part of the `Id`. In the `terraform.tfvars` file, set this value for the `delegation_set` variable.

### AWS Access Keys

We do not need to set up the AWS access keys in the lab since we are using an EC2 instance that's already inside of our AWS environment. 

### Generate and add ssh key

```
ssh-keygen
ssh-agent bash
ssh-add ~/.ssh/id_rsa
```

### Get `ec2.py` and `ec2.ini` files

```
wget -O ec2.ini 'https://raw.githubusercontent.com/ansible/ansible/devel/contrib/inventory/ec2.ini'
wget -O ec2.py 'https://raw.githubusercontent.com/ansible/ansible/devel/contrib/inventory/ec2.py'
chmod +x ec2.py
```

Modify the `ec2.ini` file:

- Change `regions` = `us-east-1`
- Uncomment `elasticache = False`

Test it with `./ec2.py --list`