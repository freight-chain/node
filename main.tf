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

provider "freight" {
  "api" = "https://network${var.region}.freightlayer.io/api/v1"
  "api_key" = "${var.freight_api_key}"
}

/*
This represents a both the trade channel and protocol.
"protocol" can be set to "auto"
*/
resource "trade_channel" "channel" {
  name = "${var.channel_name}"
  description = "${var.network_description}"
}

/*
Associate the Node with the Trade Channel
@note, index is big eiden yymmdd + 1
*/
resource "trade_channel" "partner" {
  count = "${var.node_count}"
  channel_id = "${freight_channel.channel.id}"
  org_name = "Org ${count.index + 20201231}"
}

/*
Protocol type defines AS2, Kafka, or ActiveMQ
*/
resource "freight_environment" "env" {
  channel_id = "${ftrade_channel.channel.id}"
  multi_region = "${var.multi_region}"
  name = "${var.env_name}"
  env_type = "${var.provider}"
  protocol_type = "${var.protocol}"
  description = "${var.env_description}"
}