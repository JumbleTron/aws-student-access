variable "region" {
  description = "Region AWS dla zajęć"
  default = "eu-central-1"
}

variable "students" {
  description = "Lista studentów"
  type = list(object({
    username = string
    email    = string
    name     = string
  }))
}

variable "student_budget_usd" {
  description = "Budżet w USD na konto studenta"
  default = 3
}