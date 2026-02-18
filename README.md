### Terraform з використанням Local Backend
### Web Server: Доступний по портах 80/443 для всього світу.
### App Server: Порт 8080 відкритий виключно для трафіку від web_server


## Розгортання
Створити файл terraform.tfvars.

Вказати в ньому cloudflare_token, cloudflare_account_id та свій my_ip.

В AWS регіоні eu-north-1 створити SSH-ключ з іменем robert_key.

Після цього зробити:
```
terraform init

terraform plan

terraform apply -auto-approve
```
