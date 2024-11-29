terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.45"
    }
  }
  # TODO: Not supported yet because object storage is Beta in Hetzner Cloud for now
  # backend "s3" {
  #   bucket                      = "security-tracker-state"
  #   key                         = "terraform.tfstate"
  #   endpoint                    = "https://s3.eu-central-1.hetzner.cloud"
  #   region                      = "eu-central-1"
  #   skip_credentials_validation = true
  #   skip_region_validation      = true
  #   skip_metadata_api_check     = true
  #   force_path_style            = true
  # }
}

variable "hcloud_token" {
  sensitive = true
}

provider "hcloud" {
  token = var.hcloud_token
}
