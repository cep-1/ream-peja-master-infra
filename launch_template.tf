resource "aws_launch_template" "app" {
  name_prefix   = "app-launch-template-"
  image_id      = "ami-08188dffd130a1ac2"
  instance_type = "t2.micro"

  user_data = base64encode(<<-EOF
    #!/bin/bash
    sudo su
    yum update -y
    yum install -y httpd.x86_64
    systemctl start httpd.service
    systemctl enable httpd.service
    echo "This is $(hostname)" > /var/www/html/index.html
  EOF
  )

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [aws_security_group.allow_web.id]
  }
}