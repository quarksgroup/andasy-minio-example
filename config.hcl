# config.hcl app configuration file generated for minio-test on Tuesday, 15-Jul-25 10:55:38 SAST
#
# See https://github.com/quarksgroup/andasy-cli for information about how to use this file.

app_name = "minio-test"

app {

  env = {}

  port = 9001

  compute {
    cpu      = 1
    memory   = 1024
    cpu_kind = "shared"
  }

  process {
    name = "minio-test"
  }

  storage {
    name = "minio_data"
    destination = "/data"
  }

}
