module "organization" {
  source       = "./modules/organization"
  students     = var.students
  region       = var.region
  student_budget_usd = var.student_budget_usd
}

module "sso_users" {
  source            = "./modules/sso-users"
  students          = var.students
  identity_store_id = module.organization.identity_store_id
}

module "sso_groups" {
  source            = "./modules/sso-groups"
  identity_store_id = module.organization.identity_store_id
  students          = module.sso_users.students
}

module "permission_sets" {
  source          = "./modules/permission-sets"
  sso_instance_arn = module.organization.sso_instance_arn
  region          = var.region
}

module "assignments" {
  source             = "./modules/assignments"
  sso_instance_arn   = module.organization.sso_instance_arn
  readonly_permission_set_arn = module.permission_sets.readonly_permission_set_arn
  lab_permission_set_arn      = module.permission_sets.lab_permission_set_arn
  group_id           = module.sso_groups.students_group_id
  lab_group_id       = module.sso_groups.lab_group_id
  accounts           = module.organization.students_accounts
}