# Changelog

## 1.0.0 (2024-04-21)


### Features

* add workflow ([0244b43](https://github.com/beholdenkey/kubedoom/commit/0244b4326f9324c3bd91efa648344fdf93140c87))
* optimize project ([#1](https://github.com/beholdenkey/kubedoom/issues/1)) ([82969ba](https://github.com/beholdenkey/kubedoom/commit/82969ba4c2b0e2695814225b660a2b333acd1477))
* update workflow ([0deed0b](https://github.com/beholdenkey/kubedoom/commit/0deed0b0fa35da84d96c7d2d521231a8e2f39168))
* update workflows ([#2](https://github.com/beholdenkey/kubedoom/issues/2)) ([133e4ba](https://github.com/beholdenkey/kubedoom/commit/133e4bacdb5cbfb33887235ed36c8ede66a892f5))

## 0.6.0

- New image ghcr.io/storax/kubedoom:0.6.0
- Latest image available as ghcr.io/storax/kubedoom:latest.
- Add support for building on different architectures.
- Update kubernetes to 1.23.2
- Update to Ubuntu 21.10
- Github Actions for building the image.
- VNC password can be configured during build via the `VNCPASSWORD` build argument.

## 0.5.0

- New image storaxdev/kubedoom:1.0.0
- New default VNC password is `idbehold`.
- Update kubernetes to 1.19.1
- Update to Ubuntu 20.10

## 0.4.0

- New image storadev/kubedoom:0.4.0
- New `-mode` flag to switch between killing pods or namespaces.
- Update kubernetes to 1.18.2

## 0.3.0

- New image storadev/kubedoom:0.3.0
- Update kubernetes to 1.18.1

## 0.2.0

- New image storadev/kubedoom:0.2.0
- Update kubernetes to 1.17.3

## 0.1.0

- Initial release
