
provider "aws" {
  profile = "default"
  shared_credentials_file = "/Users/rdias/.aws/credentials"
  //region  = "us-east-1"
  region  = "${var.region}"
}

resource "aws_instance" "app_server" {
  
  ami            = "ami-0742b4e673072066f"
  //instance_type = "t2.micro"
  instance_type           = "${var.instance_type}"
  //key_name = "lab1"
  key_name              = "${var.key_name}"
  
  associate_public_ip_address = "true"
  subnet_id = "${var.subnet_id}"
  user_data = <<-EOF
              #! /bin/bash
              sudo yum -y install httpd
              sudo service httpd start
              echo "<h1>Verdinha app ...now I m ready</h1>" >> /var/www/html/index.html
            EOF   
  tags = {
   Name = "verdinha"
   
   //key_name              = "${var.key_name}"
  }





}