output "default_repositories" {
  value       = { for k, v in github_repository.default_repositories : k => v }
  description = "Created blan Repositories"
}

output "tf_repositories" {
  value       = { for k, v in github_repository.tf_repositories : k => v }
  description = "Created Terraform Module Repositories"
}
