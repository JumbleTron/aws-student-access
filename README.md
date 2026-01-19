# AWS Students Terraform Project

## Struktura katalogów
- modules/
    - organization/        # OU + konta + SCP + Budżety
    - sso-users/           # tworzenie studentów
    - sso-groups/          # grupy studentów
    - permission-sets/     # ReadOnly + LAB Permission Sets
    - assignments/         # przypisania grup do kont i Permission Sets
- semester_reset/reset.sh # skrypt do resetu co 7 dni
- main.tf
- variables.tf
- terraform.tfvars
- outputs.tf

## Uruchomienie
1. `terraform init`
2. `terraform apply`

Po zakończeniu kursu:
`terraform destroy`