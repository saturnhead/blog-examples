package spacelift

cidr_block_vpc = block {
    resources := input.kubernetes.items[_].after
    resources.kind == "VPC"
    ip_parts := split(resources.spec.forProvider.cidrBlock, "/")
    block := ip_parts[1]
}

cidr_block_subnet = block {
    resources := input.kubernetes.items[_].after
    resources.kind == "Subnet"
    ip_parts := split(resources.spec.forProvider.cidrBlock, "/")
    block := ip_parts[1]
}

warn[msg] {
    cidr_block_vpc != "16"
    msg := sprintf("Your VPC cidr block mask /%v is different than /16", [cidr_block_vpc])
}

warn[msg] {
    cidr_block_subnet != "25"
    msg := sprintf("Your Subnet cidr block mask /%v is different than /25", [cidr_block_subnet])
}

sample = true

