# syntax=docker/dockerfile:1

FROM golang:1.17-alpine AS build-kubedoom
WORKDIR /go/src/kubedoom
COPY go.mod .
COPY kubedoom.go .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o kubedoom .

FROM ubuntu:23.04 AS build-essentials
ARG TARGETARCH
ARG KUBECTL_VERSION=1.30.0
RUN apt-get update && apt-get install -y wget ca-certificates --no-install-recommends \
    && wget http://distro.ibiblio.org/pub/linux/distributions/slitaz/sources/packages/d/doom1.wad \
    && wget -O /usr/bin/kubectl "https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/${TARGETARCH}/kubectl" \
    && chmod +x /usr/bin/kubectl \
    && rm -rf /var/lib/apt/lists/*

FROM ubuntu:23.04 AS build-doom
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y build-essential libsdl-mixer1.2-dev libsdl-net1.2-dev gcc --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*
COPY /dockerdoom /dockerdoom
WORKDIR /dockerdoom/trunk
RUN ./configure && make && make install

FROM ubuntu:23.04 AS build-converge
COPY --from=build-essentials /doom1.wad /root
COPY --from=build-essentials /usr/bin/kubectl /usr/bin
COPY --from=build-kubedoom /go/src/kubedoom/kubedoom /usr/bin
COPY --from=build-doom /usr/local/games/psdoom /usr/local/games

FROM ubuntu:23.04 AS final
ARG VNCPASSWORD=idbehold
RUN apt-get update && apt-get install -y libsdl-mixer1.2 libsdl-net1.2 x11vnc xvfb netcat-openbsd --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /root/.vnc \
    && echo "${VNCPASSWORD}" | x11vnc -storepasswd /root/.vnc/passwd

COPY --from=build-converge / /

WORKDIR /root

ENTRYPOINT ["exec", "/usr/bin/kubedoom"]
