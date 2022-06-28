# Configure the AWS Provider
provider "aws" {
  region     = "us-west-2"
}

resource "aws_instance" "ec2test" {
   
    ami = "ami-0ca285d4c2cda3300"
    availability_zone = "us-west-2a"
    instance_type = "t2.micro"
    tags = {
    Name = "instance1"
  }
}
resource "aws_ebs_volume" "data-vol" {
 availability_zone = "us-west-2a"
 size = 1
}
resource "aws_volume_attachment" "vol" {

 device_name = "/dev/sdc"
 volume_id = aws_ebs_volume.data-vol.id
 instance_id = aws_instance.ec2testtf.id
}
resource "aws_ebs_snapshot" "example_snapshot" {
  volume_id = aws_ebs_volume.data-vol.id
}
