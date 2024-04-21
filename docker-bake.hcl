target "_common" {
  args = {
    BUILDKIT_CONTEXT_KEEP_GIT_DIR = 1
  }
}

target "base" {
  inherits = ["_common"]
  target = "base"
  output = ["type=cacheonly"]
}

target "image" {
  inherits = ["_common"]
  dockerfile = "Dockerfile"
  target = "final-stage"
  output = ["type=docker, push=false"]
}

target "image-local" {
  inherits = ["image"]
}

group "default" {
  targets = ["image"]
}
