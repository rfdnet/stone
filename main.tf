
provider "aws" {
  profile = "default"
  shared_credentials_file = "/Users/rdias/.aws/credentials"
  
  region  = "${var.region}"
}

resource "aws_instance" "app_server" {
  
  ami            = "ami-0742b4e673072066f"
  
  instance_type           = "${var.instance_type}"
  
  key_name              = "${var.key_name}"
  
  associate_public_ip_address = "true"

  subnet_id = "${var.subnet_id}"
  user_data = <<-EOF
              #! /bin/bash
              sudo yum -y install httpd
              sudo service httpd start
              echo "<h1>Verdinha app ...now I m ready</h1>" >> /var/www/html/index.html
              curl http://169.254.169.254/latest/meta-data/public-ipv4
            EOF   
  tags = {
   Name = "verdinha"
   
   
  }





}