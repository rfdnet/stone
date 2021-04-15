
variable "region" {
  default = "us-east-1"
}

//tipo de instancia
variable "instance_type" {
  default = "t2.micro"
}

//Defina um SG
variable "security_groups" {
  type = "list"
  default = [ "sg-034969290d638e836","sg-034969290d638e836"]
  
}

//Defina uma subnet
variable "subnet_id" {
  default ="subnet-f4d5d0b9"
}

variable "key_name" {
  default = "lab1"
}

variable "availability_zone" {
  default = "us-east-1d"
}

variable "root_block_device" {
  //size in GB
  default = "10"
}