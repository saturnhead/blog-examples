vpc_params = {
  vpc1 = {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name : "vpc1"
      owner : "owner1"
    }
  }
  vpc2 = {
    cidr_block = "11.0.0.0/16"
    tags = {
      Name : "vpc1"
      owner : "owner2"
    }
  }
}

subnet_params = {
  subnet11 = {
    cidr_block = "10.0.1.0/24"
    tags = {
      Name = "subnet11"
    }
    vpc_id = "vpc1"
  }
  subnet12 = {
    cidr_block = "10.0.2.0/24"
    tags = {
      Name = "subnet2"
    }
    vpc_id = "vpc1"
  }
  subnet21 = {
    cidr_block = "11.0.1.0/24"
    tags = {
      Name = "subnet11"
    }
    vpc_id = "vpc2"
  }
  subnet22 = {
    cidr_block = "11.0.2.0/24"
    tags = {
      Name = "subnet2"
    }
    vpc_id = "vpc2"
  }
}

security_group_params = {
  sg1 = {
    tags = {
      Name = "sg1"
    }
    vpc_id = "vpc1"
  }
}

sg_rule_params = {
  sg1r1 = {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    sg_id       = "sg1"
    to_port     = 80
    type        = "ingress"
  }

  sg1r2 = {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 8080
    sg_id       = "sg1"
    to_port     = 8080
    type        = "ingress"
  }
}
