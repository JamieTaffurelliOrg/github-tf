# github-tf
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.4.0 |
| <a name="requirement_github"></a> [github](#requirement\_github) | = 5.18.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | = 5.18.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_branch_protection.default_branch_protection](https://registry.terraform.io/providers/integrations/github/5.18.3/docs/resources/branch_protection) | resource |
| [github_branch_protection.tf_branch_protection](https://registry.terraform.io/providers/integrations/github/5.18.3/docs/resources/branch_protection) | resource |
| [github_repository.default_repositories](https://registry.terraform.io/providers/integrations/github/5.18.3/docs/resources/repository) | resource |
| [github_repository.tf_repositories](https://registry.terraform.io/providers/integrations/github/5.18.3/docs/resources/repository) | resource |
| [github_repository_file.default_codeowners](https://registry.terraform.io/providers/integrations/github/5.18.3/docs/resources/repository_file) | resource |
| [github_repository_file.tf_codeowners](https://registry.terraform.io/providers/integrations/github/5.18.3/docs/resources/repository_file) | resource |
| [github_repository_file.tf_data](https://registry.terraform.io/providers/integrations/github/5.18.3/docs/resources/repository_file) | resource |
| [github_repository_file.tf_docs_workflow](https://registry.terraform.io/providers/integrations/github/5.18.3/docs/resources/repository_file) | resource |
| [github_repository_file.tf_gitignore](https://registry.terraform.io/providers/integrations/github/5.18.3/docs/resources/repository_file) | resource |
| [github_repository_file.tf_local](https://registry.terraform.io/providers/integrations/github/5.18.3/docs/resources/repository_file) | resource |
| [github_repository_file.tf_main](https://registry.terraform.io/providers/integrations/github/5.18.3/docs/resources/repository_file) | resource |
| [github_repository_file.tf_outputs](https://registry.terraform.io/providers/integrations/github/5.18.3/docs/resources/repository_file) | resource |
| [github_repository_file.tf_pre_commit](https://registry.terraform.io/providers/integrations/github/5.18.3/docs/resources/repository_file) | resource |
| [github_repository_file.tf_pre_commit_workflow](https://registry.terraform.io/providers/integrations/github/5.18.3/docs/resources/repository_file) | resource |
| [github_repository_file.tf_release_workflow](https://registry.terraform.io/providers/integrations/github/5.18.3/docs/resources/repository_file) | resource |
| [github_repository_file.tf_variables](https://registry.terraform.io/providers/integrations/github/5.18.3/docs/resources/repository_file) | resource |
| [github_repository_file.tf_versions](https://registry.terraform.io/providers/integrations/github/5.18.3/docs/resources/repository_file) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_default_repositories"></a> [default\_repositories](#input\_default\_repositories) | Blank (non-templated#) repositories to create | <pre>list(object(<br>    {<br>      name                                    = string<br>      visibility                              = optional(string, "private")<br>      homepage_url                            = optional(string)<br>      has_issues                              = optional(bool, true)<br>      has_projects                            = optional(bool, false)<br>      has_wiki                                = optional(bool, true)<br>      allow_merge_commit                      = optional(bool, true)<br>      allow_squash_merge                      = optional(bool, true)<br>      allow_rebase_merge                      = optional(bool, true)<br>      allow_auto_merge                        = optional(bool, true)<br>      delete_branch_on_merge                  = optional(bool, true)<br>      has_downloads                           = optional(bool, false)<br>      auto_init                               = optional(bool, true)<br>      license_template                        = optional(string)<br>      archived                                = optional(bool, false)<br>      archive_on_destroy                      = optional(bool, true)<br>      vulnerability_alerts                    = optional(bool, true)<br>      ignore_vulnerability_alerts_during_read = optional(bool, false)<br>      code_owners                             = string<br>      enforce_admins                          = optional(bool, true)<br>      allows_deletions                        = optional(bool, false)<br>    }<br>  ))</pre> | n/a | yes |
| <a name="input_tf_repositories"></a> [tf\_repositories](#input\_tf\_repositories) | The repositories to be created that host Terraform modules | <pre>list(object(<br>    {<br>      name                                    = string<br>      visibility                              = optional(string, "private")<br>      homepage_url                            = optional(string)<br>      has_issues                              = optional(bool, true)<br>      has_projects                            = optional(bool, false)<br>      has_wiki                                = optional(bool, true)<br>      allow_merge_commit                      = optional(bool, true)<br>      allow_squash_merge                      = optional(bool, true)<br>      allow_rebase_merge                      = optional(bool, true)<br>      allow_auto_merge                        = optional(bool, true)<br>      delete_branch_on_merge                  = optional(bool, true)<br>      has_downloads                           = optional(bool, false)<br>      auto_init                               = optional(bool, true)<br>      license_template                        = optional(string)<br>      archived                                = optional(bool, false)<br>      archive_on_destroy                      = optional(bool, true)<br>      vulnerability_alerts                    = optional(bool, true)<br>      ignore_vulnerability_alerts_during_read = optional(bool, false)<br>      code_owners                             = string<br>      enforce_admins                          = optional(bool, true)<br>      allows_deletions                        = optional(bool, false)<br>    }<br>  ))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_default_repositories"></a> [default\_repositories](#output\_default\_repositories) | Created blan Repositories |
| <a name="output_tf_repositories"></a> [tf\_repositories](#output\_tf\_repositories) | Created Terraform Module Repositories |
<!-- END_TF_DOCS -->
