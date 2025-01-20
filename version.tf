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

    bucket     = "tf-state-bravina"
    key        = "tf.state"

    skip_region_validation      = true
    skip_credentials_validation = true

    dynamodb_endpoint = "grpcs://ydb.serverless.yandexcloud.net:2135/?database=/ru-central1/b1gg6kegpjk3v90bl84u/etnq0sdeg5bcons0645a"
    dynamodb_table = "tf-state-bravina"
  }
}

provider "yandex" {
  cloud_id                 = "b1gg6kegpjk3v90bl84u"
  folder_id                = "b1gqci1d3053iild8bbb"
}
