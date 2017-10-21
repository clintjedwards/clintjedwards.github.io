job "personal" {
  datacenters = ["production-east1"]
  type = "service"

  update {
    stagger      = "2m"
    max_parallel = 1
  }

  group "default" {
    count = 3

    task "app" {
      driver = "docker"
      config {
        image = "cje3295/personal_website:app"
        force_pull = true
        port_map {
            http = 8080
        }
      }
      env {
        DEBUG = false
        SECRET_KEY = "[redacted]"
      }

      service {
        port = "http"
        name = "personal"

        check {
          type     = "http"
          path     = "/"
          interval = "1m"
          timeout  = "10s"
        }
      }

      resources {
        memory = 50
        network {
          port "http" {}
        }
      }
    }
  }
}
