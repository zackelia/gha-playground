FROM ubuntu:jammy AS builder

RUN apt update && \
    DEBIAN_FRONTEND=noninteractive apt install -y \
        clang

ADD main.cpp /main.cpp

RUN clang++ /main.cpp -o /main

FROM ubuntu:jammy

COPY --from=builder /main /main
