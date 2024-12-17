# Материалы для вебинара "Деплой Yandex Cloud с помощью Terraform и Gitlab"

Для настройки пайплайна в Gitlab необходимо:

1. [Создать сервисный аккаунт](https://yandex.cloud/ru/docs/iam/operations/sa/create) с правами для деплоя в облко

2. [Создать авторизационный ключ](https://yandex.cloud/ru/docs/iam/operations/authorized-key/create) для сервисного аккаунта

3. Создать переменную в Gitlab с содержимым ключа и именем YC_KEY

4. [Создать S3 бакет](https://yandex.cloud/ru/docs/tutorials/infrastructure-management/terraform-state-storage) и [таблицу YDB](https://yandex.cloud/ru/docs/tutorials/infrastructure-management/terraform-state-lock) для хранения Terraform state

5. Оредактировать файл versions.tf, указать в нем параметры для подключения к облаку, S3 и YDB

6. Закомитить изменения и запустить пайплайн
