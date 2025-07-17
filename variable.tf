variable "ami_id" {
    description = "This is AMI ID"
    type = string
}
variable "instance_type" {
    description = "This instance type"
    type = string
}
variable "instance_count" {
    description = "This is instance count"
    type = number
}
variable "cidr_block_vpc" {
    description = "CIDR VALUE"
    type = bool
}
variable "cidr_block_subnet" {
    description = "CIDR VALUE"
    type = bool
}
variable "port_to_open" {
    description = "CIDR VALUE"
    type = number
}