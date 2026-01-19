# AWS Students Terraform Project

## Założenia (domyślne)
1. Tworzysz IAM users w jednym koncie AWS (management lub member), a nie osobne konta AWS per student. 
2. Studenci mają:
   - tylko odczyt (read-only),
   - dostęp do usług związanych z aplikacją webową i skalowaniem.
3. Logowanie przez AWS Console.
4. Hasła generowane automatycznie (do rozdania studentom).

## Opcjonalnie: oddzielne konta AWS per student (Organizations + SCP)
- Dostęp przez AWS SSO / IAM Identity Center.
- Dostęp tylko do jednego regionu.
- SCP blokujące inne regiony.
- Grupy studentów zamiast user-per-assignment.
- Automatyczne wygasanie dostępu (np. 7 dni).
- Drugi Permission Set (LAB / WRITE).
- CloudTrail tylko do podglądu.
- Budżety i alarmy kosztowe.
- Automatyczne tworzenie kont per student.

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

## Uruchomienie krok po kroku
1. `terraform fmt -recursive` – formatowanie plików `.tf`.
2. `terraform validate` – szybka walidacja konfiguracji.
3. `terraform init` – pobranie providerów i modułów.
4. `terraform plan -out plan.tfplan` – podgląd zmian.
5. `terraform apply plan.tfplan` – wdrożenie zatwierdzonego planu.
