target "_common" {
  args = {
    BUILDKIT_CONTEXT_KEEP_GIT_DIR = 1
  }
}

target "base" {
  inherits = ["_common"]
  target = "build-essentials"
  output = ["type=cacheonly"]
}

target "image" {
  inherits = ["_common"]
  dockerfile = "Dockerfile"
  target = "final"
  platforms = ["linux/amd64", "linux/arm64"]
  output = ["type=docker, push=true"]
}

target "image-local" {
  inherits = ["image"]
  output = ["type=docker, push=false"]
}

group "default" {
  targets = ["image"]
}
