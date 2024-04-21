target "image-amd64" {
  inherits = ["_common"]
  dockerfile = "Dockerfile"
  target = "final"
  platforms = ["linux/amd64"]
  output = ["type=docker, push=true"]
}

target "image-arm64" {
  inherits = ["_common"]
  dockerfile = "Dockerfile"
  target = "final"
  platforms = ["linux/arm64"]
  output = ["type=docker, push=true"]
}
