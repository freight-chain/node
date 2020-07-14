variable "freight_api_key" {
  type = "string"
  description = "Freight Trust API Key"
}

// (c) 2020 - FreightTrust and Clearing Corporation
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//     http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.


variable "aws_region" {
  type = "string"
  description = "us-east1, us-west-1, central - all aws."
  default = "us-west1"
}

variable "provider" {
  type = "string"
  default = "besu"
  description = "Blockchain Node"
}

variable "consensus" {
  type = "string"
  default = "ibft2"
  description = "Consensus mechanism."
}

variable "multi_protocol" {
  type = "string"
  default = false
  description = "Make the environment multi-protocol compatible to support additional protocols, now or in the future"
}

variable "node_size" {
  type = "string"
  default = "small"
  description = "Size of the node"
}

variable "node_count" {
  type = "string"
  default = 1
  description = "Number of Nodes/Mailboxes"
}

variable "trading_channel_name" {
  type = "string"
  default = "Trading Channel"
}

variable "env_name" {
  type = "string"
  default = "EDI X12 4010"
}

variable "env_description" {
  type = "string"
  default = "EDI X12 4010 ASC"
}
variable "network_description" {
  type = "string"
  default = "See Schema Registry for more details"
}