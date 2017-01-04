
# This needs to match the console information given by L.A. after creating the lab.
aws_profile				= "linuxacademy"

aws_region				= "us-east-1"
db_instance_class		= "db.t1.micro"
dbname					= "superherodb"
dbuser					= "superhero"
dbpassword				= "superheropass"

# These need to match whatever key name and directory they used for ssh-keygen. I'll assume the defaults.
key_name                = "id_rsa"
public_key_path         = "/home/linuxacademy/.ssh/id_rsa.pub"

domain_name				= "linuxsuperhero"
dev_instance_type		= "t2.micro"
dev_ami					= "ami-b73b63a0"
elb_healthy_threshold   = "2"
elb_unhealthy_threshold = "2"
elb_timeout 			= "3"
elb_interval			= "30"
asg_max 				= "2"
asg_min					= "1"
asg_grace				= "300"
asg_hct					= "EC2"
asg_cap					= "2"
lc_instance_type		= "t2.micro"

# This needs to match whatever was returned from the 
delegation_set 			= "N3GTFFZI1MK1OT"
