# Create an EC2 Auto Scaling Group - app
resource "aws_autoscaling_group" "swiggy_app_asg" {
  name = "swiggy-appch-asg"

  launch_template {
    id      = aws_launch_template.swiggy_app_template.id
    version = "$Latest"
  }

  vpc_zone_identifier = [
    aws_subnet.swiggy_pvt_sub_1.id,
    aws_subnet.swiggy_pvt_sub_2.id
  ]

  min_size         = 2
  max_size         = 3
  desired_capacity = 2
}

# Create a launch template for the EC2 instances
resource "aws_launch_template" "swiggy_app_template" {
  name_prefix   = "swiggy-appch-template"
  image_id      = "ami-0861f4e788f5069dd"
  instance_type = "t3.micro"
  key_name      = "3tierprojectforchakri"

  network_interfaces {
    security_groups             = [aws_security_group.swiggy_ec2_asg_sg_app.id]
    associate_public_ip_address = false
  }

  user_data = base64encode(<<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install -y mysql
  EOF
  )

  lifecycle {
    prevent_destroy = true
    # if you want to ignore some attributes:
    # ignore_changes = [tags, user_data]
  }
}
