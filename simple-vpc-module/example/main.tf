provider "aws" {
  region = "eu-west-1"
}

module "vpc" {
  source = "../"
  vpc_parameters = {
    vpc1 = {
      cidr_block = "10.0.0.0/16"
    }
  }
  subnet_parameters = {
    subnet1 = {
      cidr_block = "10.0.1.0/24"
      vpc_name   = "vpc1"
    }
  }
  igw_parameters = {
    igw1 = {
      vpc_name = "vpc1"
    }
  }
  rt_parameters = {
    rt1 = {
      vpc_name = "vpc1"
      routes = [{
        cidr_block = "0.0.0.0/0"
        gateway_id = "igw1"
        }
      ]
    }
  }
  rt_association_parameters = {
    assoc1 = {
      subnet_name = "subnet1"
      rt_name     = "rt1"
    }
  }
}
