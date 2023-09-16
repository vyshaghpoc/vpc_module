# Terraform AWS VPC Module

This Terraform module is designed to create an AWS VPC along with associated subnets and route tables.

## Table of Contents

- [Features](#features)
- [Usage](#usage)
  - [Basic Example](#basic-example)
- [Requirements](#requirements)
- [Inputs](#inputs)
- [Outputs](#outputs)
- [Best Practices](#best-practices)

## Features

- **VPC Creation**: Creates a new VPC in the specified CIDR block.
- **Subnet Creation**: Creates new subnets within the VPC.
- **Route Table**: Sets up a route table and associates it with the subnets.

## Usage

### Basic Example

Here is a basic example on how to use the module in your own Terraform script:

```hcl
module "aws_vpc" {
  source = "./path/to/module"

  cidr_block         = "10.0.0.0/16"
  availability_zones = ["us-east-1a", "us-east-1b"]
  env                = "prod"
  subnet_bits        = 8
  tags = {
    "Name"        = "my-vpc"
    "Environment" = "prod"
  }
}


## Requirements

- Terraform 0.14.x or newer
- AWS provider 3.x or newer

## Inputs

| Name                | Description                                     | Type          | Default | Required |
|---------------------|-------------------------------------------------|---------------|---------|----------|
| `cidr_block`        | The CIDR block for the VPC                      | `string`      | n/a     | yes      |
| `availability_zones`| List of availability zones                      | `list(string)`| `[]`    | no       |
| `env`               | Environment (prod, dev, test)                   | `string`      | n/a     | yes      |
| `sub`               | The availability zones to use for subnets       | `list(string)`| `[]`    | no       |
| `subnet_bits`       | Additional bits for subnet CIDR                 | `number`      | n/a     | yes      |
| `instance_tenancy`  | Tenancy of instances launched into the VPC      | `string`      | `default` | no     |
| `tags`              | Tags to be applied to the VPC                   | `map(string)` | `{}`    | no       |

## Outputs

| Name        | Description                              |
|-------------|------------------------------------------|
| `vpc_id`    | The ID of the created VPC                |
| `subnet_ids`| List of IDs for the created subnets      |


