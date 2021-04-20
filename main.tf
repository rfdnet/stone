
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
              sudo yum update -y
              #sudo yum install -y mod_ssl
              #cd /etc/pki/tls/certs
              #sudo ./make-dummy-cert localhost.crt
              sudo wget https://s3.cn-north-1.amazonaws.com.cn/amazoncloudwatch-agent/amazon_linux/amd64/latest/amazon-cloudwatch-agent.rpm
              sudo service httpd start
              echo "<h1>Verdinha app ...now I m ready</h1>" >> /var/www/html/index.html
              curl http://169.254.169.254/latest/meta-data/public-ipv4
            EOF   
  tags = {
   Name = "verdinha"
   
   
  }



}