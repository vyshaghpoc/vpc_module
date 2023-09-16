variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = []
}

variable "env" {
  description = "Environment (prod, dev, test)"
  type        = string
}

variable "sub" {
  description = "The availability zones to use for subnets"
  type        = list(string)
  default     = []
}

variable "subnet_bits" {
  description = "Additional bits for subnet CIDR"
  type        = number
}

variable "instance_tenancy" {
  description = "Tenancy of instances launched into the VPC"
  type        = string
  default     = "default"
}

variable "tags" {
  description = "Tags to be applied to the VPC"
  type        = map(string)
  default     = {}
}
