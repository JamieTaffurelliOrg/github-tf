resource "github_repository" "default_repositories" {
  for_each                                = { for repo in var.default_repositories : repo.name => repo }
  name                                    = each.key
  visibility                              = each.value.visibility
  homepage_url                            = each.value.homepage_url
  has_issues                              = each.value.has_issues
  has_projects                            = each.value.has_projects
  has_wiki                                = each.value.has_wiki
  allow_merge_commit                      = each.value.allow_merge_commit
  allow_squash_merge                      = each.value.allow_squash_merge
  allow_rebase_merge                      = each.value.allow_rebase_merge
  allow_auto_merge                        = each.value.allow_auto_merge
  delete_branch_on_merge                  = each.value.delete_branch_on_merge
  has_downloads                           = each.value.has_downloads
  auto_init                               = each.value.auto_init
  license_template                        = each.value.license_template
  archived                                = each.value.archived
  archive_on_destroy                      = each.value.archive_on_destroy
  vulnerability_alerts                    = each.value.vulnerability_alerts
  ignore_vulnerability_alerts_during_read = each.value.ignore_vulnerability_alerts_during_read

  security_and_analysis {
    advanced_security {
      status = "enabled"
    }

    secret_scanning {
      status = "enabled"
    }

    secret_scanning_push_protection {
      status = "enabled"
    }
  }
}

resource "github_repository_file" "default_codeowners" {
  for_each            = { for repo in var.default_repositories : repo.name => repo }
  repository          = github_repository.default_repositories[(each.key)].name
  branch              = "main"
  file                = "CODEOWNERS"
  content             = each.value.code_owners
  commit_message      = "Initial code owners commit"
  overwrite_on_create = false
  lifecycle {
    ignore_changes = [
      commit_author,
      commit_email,
      content
    ]
  }
}

resource "github_branch_protection" "default_branch_protection" {
  for_each      = { for repo in var.default_repositories : repo.name => repo }
  repository_id = github_repository.default_repositories[(each.key)].node_id

  pattern          = "main"
  enforce_admins   = each.value.enforce_admins
  allows_deletions = true

  required_status_checks {
    strict = true
  }

  required_pull_request_reviews {
    dismiss_stale_reviews = true
    restrict_dismissals   = false
  }
  depends_on = [
    github_repository_file.default_codeowners
  ]
}

resource "github_repository" "tf_repositories" {
  for_each                                = { for repo in var.tf_repositories : repo.name => repo }
  name                                    = each.key
  visibility                              = each.value.visibility
  homepage_url                            = each.value.homepage_url
  has_issues                              = each.value.has_issues
  has_projects                            = each.value.has_projects
  has_wiki                                = each.value.has_wiki
  allow_merge_commit                      = each.value.allow_merge_commit
  allow_squash_merge                      = each.value.allow_squash_merge
  allow_rebase_merge                      = each.value.allow_rebase_merge
  allow_auto_merge                        = each.value.allow_auto_merge
  delete_branch_on_merge                  = each.value.delete_branch_on_merge
  has_downloads                           = each.value.has_downloads
  auto_init                               = each.value.auto_init
  license_template                        = each.value.license_template
  archived                                = each.value.archived
  archive_on_destroy                      = each.value.archive_on_destroy
  vulnerability_alerts                    = each.value.vulnerability_alerts
  ignore_vulnerability_alerts_during_read = each.value.ignore_vulnerability_alerts_during_read

  security_and_analysis {
    advanced_security {
      status = "enabled"
    }

    secret_scanning {
      status = "enabled"
    }

    secret_scanning_push_protection {
      status = "enabled"
    }
  }
}

resource "github_repository_file" "tf_gitignore" {
  for_each            = { for repo in var.tf_repositories : repo.name => repo }
  repository          = github_repository.tf_repositories[(each.key)].name
  branch              = "main"
  file                = ".gitignore"
  content             = <<EOF
test-results.xml
code-coverage.xml
**/*.tfstate
**/*.tfstate.*
**/*.tfplan
**/*.tfplan.*
**/*.terraform*
crash.log
*.tfvars
override.tf
override.tf.json
*_override.tf
*_override.tf.json
.terraformrc
terraform.rc
EOF
  commit_message      = "Initial gitignore commit"
  overwrite_on_create = false

  lifecycle {
    ignore_changes = [
      commit_author,
      commit_email,
      content
    ]
  }
}

resource "github_repository_file" "tf_codeowners" {
  for_each            = { for repo in var.tf_repositories : repo.name => repo }
  repository          = github_repository.tf_repositories[(each.key)].name
  branch              = "main"
  file                = "CODEOWNERS"
  content             = each.value.code_owners
  commit_message      = "Initial code owners commit"
  overwrite_on_create = false

  lifecycle {
    ignore_changes = [
      commit_author,
      commit_email,
      content
    ]
  }
}

resource "github_repository_file" "tf_main" {
  for_each            = { for repo in var.tf_repositories : repo.name => repo }
  repository          = github_repository.tf_repositories[(each.key)].name
  branch              = "main"
  file                = "main.tf"
  content             = ""
  commit_message      = "Initial main.tf"
  overwrite_on_create = false

  lifecycle {
    ignore_changes = [
      commit_author,
      commit_email,
      content
    ]
  }
}

resource "github_repository_file" "tf_local" {
  for_each            = { for repo in var.tf_repositories : repo.name => repo }
  repository          = github_repository.tf_repositories[(each.key)].name
  branch              = "main"
  file                = "local.tf"
  content             = ""
  commit_message      = "Initial local.tf"
  overwrite_on_create = false

  lifecycle {
    ignore_changes = [
      commit_author,
      commit_email,
      content
    ]
  }
}

resource "github_repository_file" "tf_versions" {
  for_each            = { for repo in var.tf_repositories : repo.name => repo }
  repository          = github_repository.tf_repositories[(each.key)].name
  branch              = "main"
  file                = "versions.tf"
  content             = ""
  commit_message      = "Initial versions.tf"
  overwrite_on_create = false

  lifecycle {
    ignore_changes = [
      commit_author,
      commit_email,
      content
    ]
  }
}

resource "github_repository_file" "tf_outputs" {
  for_each            = { for repo in var.tf_repositories : repo.name => repo }
  repository          = github_repository.tf_repositories[(each.key)].name
  branch              = "main"
  file                = "outputs.tf"
  content             = ""
  commit_message      = "Initial outputs.tf"
  overwrite_on_create = false

  lifecycle {
    ignore_changes = [
      commit_author,
      commit_email,
      content
    ]
  }
}

resource "github_repository_file" "tf_data" {
  for_each            = { for repo in var.tf_repositories : repo.name => repo }
  repository          = github_repository.tf_repositories[(each.key)].name
  branch              = "main"
  file                = "data.tf"
  content             = ""
  commit_message      = "Initial data.tf"
  overwrite_on_create = false

  lifecycle {
    ignore_changes = [
      commit_author,
      commit_email,
      content
    ]
  }
}

resource "github_repository_file" "tf_variables" {
  for_each            = { for repo in var.tf_repositories : repo.name => repo }
  repository          = github_repository.tf_repositories[(each.key)].name
  branch              = "main"
  file                = "variables.tf"
  content             = ""
  commit_message      = "Initial variables.tf"
  overwrite_on_create = false

  lifecycle {
    ignore_changes = [
      commit_author,
      commit_email,
      content
    ]
  }
}

resource "github_repository_file" "tf_pre_commit" {
  for_each            = { for repo in var.tf_repositories : repo.name => repo }
  repository          = github_repository.tf_repositories[(each.key)].name
  branch              = "main"
  file                = ".pre-commit-config.yaml"
  content             = <<EOF
repos:
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v4.2.0
    hooks:
      - id: check-added-large-files
      - id: check-merge-conflict
      - id: check-vcs-permalinks
      - id: forbid-new-submodules
      - id: no-commit-to-branch
      - id: end-of-file-fixer
      - id: trailing-whitespace
        args: [--markdown-linebreak-ext=md]
        exclude: CHANGELOG.md
      - id: check-yaml
      - id: check-json
      - id: pretty-format-json
        args: [--autofix]
      - id: check-merge-conflict
      - id: check-case-conflict
      - id: mixed-line-ending
        args: [--fix=lf]
      - id: detect-private-key

  - repo: https://github.com/gruntwork-io/pre-commit
    rev: v0.1.17
    hooks:
      - id: terraform-fmt
      - id: terraform-validate
      - id: tflint
        args:
          - "--module"
          - "--config=.tflint.hcl"
      - id: shellcheck

  - repo: https://github.com/antonbabenko/pre-commit-terraform
    rev: v1.72.1
    hooks:
      - id: terrascan
        args:
          - --args=--verbose
          - --args=--non-recursive
      - id: terraform_tfsec

EOF
  commit_message      = "Initial pre-commit"
  overwrite_on_create = false

  lifecycle {
    ignore_changes = [
      commit_author,
      commit_email,
      content
    ]
  }
}

resource "github_repository_file" "tf_pre_commit_workflow" {
  for_each            = { for repo in var.tf_repositories : repo.name => repo }
  repository          = github_repository.tf_repositories[(each.key)].name
  branch              = "main"
  file                = ".github/workflows/pre-commit.yaml"
  content             = <<EOF
on: pull_request

concurrency: ci-$${{ github.workflow }}-$${{ github.ref }}

env:
  ARM_CLIENT_ID: $${{ secrets.AZURE_CLIENT_ID }}
  ARM_CLIENT_SECRET: $${{ secrets.AZURE_CLIENT_SECRET }}
  ARM_TENANT_ID: $${{ secrets.AZURE_TENANT_ID }}
  ARM_SUBSCRIPTION_ID: $${{ secrets.AZURE_SUBSCRIPTION_ID }}
  TERRAFORM_VERSION: "1.3.3"
jobs:
  pre-commit:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout
      uses: actions/checkout@v3
      with:
        fetch-depth: 0

    - name: Set up Terraform
      uses: hashicorp/setup-terraform@v2
      with:
        terraform_version: $${{ env.TERRAFORM_VERSION }}
        terraform_wrapper: false

    - name: Set up Go
      uses: actions/setup-go@v3
      with:
        go-version: 1.18

    - name: Set up Python
      uses: actions/setup-python@v4
      with:
        python-version: '3.x'

    - name: Set up Tflint
      uses: lablabs/setup-tflint@v2

    - name: install packages
      run: |
        curl -L "$(curl -s https://api.github.com/repos/tenable/terrascan/releases/latest | grep -o -E https://.+?_Linux_x86_64.tar.gz)" > terrascan.tar.gz
        tar -xf terrascan.tar.gz terrascan && rm terrascan.tar.gz
        install terrascan /usr/local/bin && rm terrascan
        go install github.com/aquasecurity/tfsec/cmd/tfsec@latest

    - name: Run pre-commit
      uses: pre-commit/action@v3.0.0
      with:
        extra_args: -v --all-files
EOF
  commit_message      = "Initial pre-commit workflow"
  overwrite_on_create = false

  lifecycle {
    ignore_changes = [
      commit_author,
      commit_email,
      content
    ]
  }
}

resource "github_repository_file" "tf_release_workflow" {
  for_each            = { for repo in var.tf_repositories : repo.name => repo }
  repository          = github_repository.tf_repositories[(each.key)].name
  branch              = "main"
  file                = ".github/workflows/release.yaml"
  content             = <<EOF
on:
  push:
    branches:
      - main

concurrency: ci-$${{ github.workflow }}-$${{ github.ref }}

jobs:
  release:
    environment: deploy
    runs-on: ubuntu-latest
    steps:
    - name: Checkout
      uses: actions/checkout@v3
      with:
        fetch-depth: 0

    - name: Version Module
      id: version-module
      uses: paulhatch/semantic-version@v4
      with:
        tag_prefix: ""
        major_pattern: (MAJOR)
        minor_pattern: (MINOR)
        format: $${major}.$${minor}.$${patch}
        bump_each_commit: false
        change_path: main.tf outputs.tf providers.tf variables.tf data.tf local.tf arm

    - name: Release Module
      uses: ncipollo/release-action@v1
      with:
        generateReleaseNotes: true
        tag: $${{ steps.version-module.outputs.version }}
        token: $${{ secrets.GITHUB_TOKEN }}
EOF
  commit_message      = "Initial release workflow"
  overwrite_on_create = false

  lifecycle {
    ignore_changes = [
      commit_author,
      commit_email,
      content
    ]
  }
}

resource "github_repository_file" "tf_docs_workflow" {
  for_each            = { for repo in var.tf_repositories : repo.name => repo }
  repository          = github_repository.tf_repositories[(each.key)].name
  branch              = "main"
  file                = ".github/workflows/terraform-docs.yaml"
  content             = <<EOF
on: pull_request

concurrency: ci-$${{ github.workflow }}-$${{ github.ref }}

jobs:
  docs:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
      with:
        ref: $${{ github.event.pull_request.head.ref }}

    - name: Render terraform docs and push changes back to PR
      uses: terraform-docs/gh-actions@main
      with:
        working-dir: .
        output-file: README.md
        output-method: inject
        git-push: "true"
EOF
  commit_message      = "Initial release workflow"
  overwrite_on_create = false

  lifecycle {
    ignore_changes = [
      commit_author,
      commit_email,
      content
    ]
  }
}

resource "github_branch_protection" "tf_branch_protection" {
  for_each      = { for repo in var.tf_repositories : repo.name => repo }
  repository_id = github_repository.tf_repositories[(each.key)].node_id

  pattern          = "main"
  enforce_admins   = each.value.enforce_admins
  allows_deletions = true

  required_status_checks {
    strict = true
  }

  required_pull_request_reviews {
    dismiss_stale_reviews = true
    restrict_dismissals   = false
  }

  depends_on = [
    github_repository_file.tf_gitignore,
    github_repository_file.tf_codeowners,
    github_repository_file.tf_local,
    github_repository_file.tf_main,
    github_repository_file.tf_versions,
    github_repository_file.tf_data,
    github_repository_file.tf_outputs,
    github_repository_file.tf_variables,
    github_repository_file.tf_pre_commit,
    github_repository_file.tf_pre_commit_workflow,
    github_repository_file.tf_release_workflow,
    github_repository_file.tf_docs_workflow,
  ]
}
