terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.18.3"
    }
  }
  required_version = "~> 1.5.0"
}
