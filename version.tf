terraform {
  required_version = ">= 1.0.0"

  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "> 0.8"
    }
  }
  backend "s3" {
    endpoint   = "storage.yandexcloud.net" 
    region     = "ru-central1"

    bucket     = "<>"
    key        = "tf.state"

    skip_region_validation      = true
    skip_credentials_validation = true

    dynamodb_endpoint = "<>"
    dynamodb_table = "<>"
  }
}

provider "yandex" {
  cloud_id                 = "<>"
  folder_id                = "<>"
}
