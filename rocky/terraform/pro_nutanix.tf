terraform {
  required_providers {
    nutanix = {
      source = "nutanix/nutanix"
      version = "1.7.0"
    }
  }
}

provider "nutanix" {
    username     = "${var.ntnx_pe_user}"
    password     = "${var.ntnx_pe_password}"
    endpoint     = "${var.ntnx_pe_ip}"
    insecure     = true
    port         = "${var.ntnx_pe_port}"
    wait_timeout = 10
}
data "nutanix_subnet" "ahv_network" {
    subnet_name = "${var.ntnx_pe_network}"
}
data "nutanix_image" "ahv_image" {
    image_name = "${var.ntnx_pe_image}"
}
data "nutanix_clusters" "clusters" {}
locals {
    cluster = data.nutanix_clusters.clusters.entities[0].metadata.uuid
}
data "nutanix_cluster" "cluster" {
    cluster_id = "${local.cluster}"
}