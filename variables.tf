variable "default_repositories" {
  type = list(object(
    {
      name                                    = string
      visibility                              = optional(string, "private")
      homepage_url                            = optional(string)
      has_issues                              = optional(bool, true)
      has_projects                            = optional(bool, false)
      has_wiki                                = optional(bool, true)
      allow_merge_commit                      = optional(bool, true)
      allow_squash_merge                      = optional(bool, true)
      allow_rebase_merge                      = optional(bool, true)
      allow_auto_merge                        = optional(bool, true)
      delete_branch_on_merge                  = optional(bool, true)
      has_downloads                           = optional(bool, false)
      auto_init                               = optional(bool, true)
      license_template                        = optional(string)
      archived                                = optional(bool, false)
      archive_on_destroy                      = optional(bool, true)
      vulnerability_alerts                    = optional(bool, true)
      ignore_vulnerability_alerts_during_read = optional(bool, false)
      code_owners                             = string
      enforce_admins                          = optional(bool, true)
      allows_deletions                        = optional(bool, false)
      advanced_security                       = optional(string, "enabled")
      secret_scanning                         = optional(string, "enabled")
      secret_scanning_push_protection         = optional(string, "enabled")
    }
  ))
  description = "Blank (non-templated#) repositories to create"
}

variable "tf_repositories" {
  type = list(object(
    {
      name                                    = string
      visibility                              = optional(string, "private")
      homepage_url                            = optional(string)
      has_issues                              = optional(bool, true)
      has_projects                            = optional(bool, false)
      has_wiki                                = optional(bool, true)
      allow_merge_commit                      = optional(bool, true)
      allow_squash_merge                      = optional(bool, true)
      allow_rebase_merge                      = optional(bool, true)
      allow_auto_merge                        = optional(bool, true)
      delete_branch_on_merge                  = optional(bool, true)
      has_downloads                           = optional(bool, false)
      auto_init                               = optional(bool, true)
      license_template                        = optional(string)
      archived                                = optional(bool, false)
      archive_on_destroy                      = optional(bool, true)
      vulnerability_alerts                    = optional(bool, true)
      ignore_vulnerability_alerts_during_read = optional(bool, false)
      code_owners                             = string
      enforce_admins                          = optional(bool, true)
      allows_deletions                        = optional(bool, false)
      advanced_security                       = optional(string, "enabled")
      secret_scanning                         = optional(string, "enabled")
      secret_scanning_push_protection         = optional(string, "enabled")
    }
  ))
  description = "The repositories to be created that host Terraform modules"
}
