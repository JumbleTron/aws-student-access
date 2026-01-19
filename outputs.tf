output "sso_login_url" {
  value = data.aws_ssoadmin_instances.this.identity_store_ids[0]
}