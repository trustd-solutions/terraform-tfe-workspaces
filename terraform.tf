terraform {
  required_version = "1.9.5"
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.58.1"
    }
    template = {
      source  = "hashicorp/template"
      version = "2.2.0"
    }
  }
}
