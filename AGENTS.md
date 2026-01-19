# Repository Guidelines

## Project Structure & Module Organization
- `main.tf`, `variables.tf`, `outputs.tf`, `providers.tf`: root Terraform entrypoint, inputs, outputs, and provider config.
- `terraform.tfvars`: environment-specific values (keep local and avoid committing secrets).
- `modules/`: reusable Terraform modules for AWS Organizations and IAM Identity Center (SSO):
  - `modules/organization/`: OUs, accounts, SCPs, and budgets.
  - `modules/sso-users/`, `modules/sso-groups/`, `modules/permission-sets/`, `modules/assignments/`: Identity Center entities and bindings.

## Build, Test, and Development Commands
- `terraform init`: initialize providers and modules.
- `terraform plan -out plan.tfplan`: preview changes with a saved plan.
- `terraform apply plan.tfplan`: apply the reviewed plan.
- `terraform apply`: plan and apply in one step (use for quick iterations only).
- `terraform destroy`: remove all managed resources.
- `terraform fmt -recursive`: format all `.tf` files.
- `terraform validate`: basic configuration validation.

## Coding Style & Naming Conventions
- Terraform files use 2-space indentation and standard HCL formatting via `terraform fmt`.
- Prefer descriptive resource and module names matching AWS domains (e.g., `sso_readonly`, `scp_region_lock`).
- Keep variables in `variables.tf` and document with `description`.

## Testing Guidelines
- No automated test suite is configured. Validation is done via `terraform validate` and review of `terraform plan` output.
- For changes to org structure or permissions, run a plan and get a second review.

## Commit & Pull Request Guidelines
- Commit history shows no strict convention. Use short, imperative messages (e.g., "Add budget guardrails").
- PRs should include: purpose, affected modules, and a paste of `terraform plan` (or summary of changes).
- Link any related issue or ticket if available.

## Security & Configuration Tips
- Do not commit secrets in `terraform.tfvars` or state files. Use secure variable injection for sensitive values.
- Review SCPs and permission sets carefully; they are security-critical and affect all accounts.
