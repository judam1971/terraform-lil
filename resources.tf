resource "aws_vpc" "enviroment-example-two" {
   cidr_block = "10.0.0.0/16"
   enable_dns_hostnames = true
   enable_dns_support = true
   tags = {
     Name = "terraform-aws-vpc-example-two"
   } 
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "subnet1" {
    cidr_block = "${cidrsubnet(aws_vpc.enviroment-example-two.cidr_block, 3, 1)}"
    vpc_id = "${aws_vpc.enviroment-example-two.id}"
    availability_zone = "${data.aws_availability_zones.available.names[0]}"
}

