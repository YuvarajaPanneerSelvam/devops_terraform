
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {
  host    = "npipe:////.//pipe//docker_engine"
}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}


resource "docker_container" "nginx_80" {
  image = docker_image.nginx.image_id
  name  = "${var.env_name}_${var.container_name}_nginx_80"
  ports {
    internal = 80
    external = 8080
  }
}

resource "docker_container" "nginx_81" {
  image = docker_image.nginx.image_id
  name  = "${var.env_name}_${var.container_name}_nginx_81"
  ports {
    internal = 80
    external = 8081
  }
}

resource "docker_container" "nginx_82" {
  image = docker_image.nginx.image_id
  name  = "${var.env_name}_${var.container_name}_nginx_82"
  ports {
    internal = 80
    external = 8082
  }
}



resource "docker_plugin" "sample-volume-plugin" {
  name                  = "tiborvass/sample-volume-plugin"
  alias                 = "sample-volume-plugin"
  enabled               = true
  grant_all_permissions = true
  force_destroy         = true
  enable_timeout        = 60
  force_disable         = true
  env = [
    "DEBUG=1"
  ]
}