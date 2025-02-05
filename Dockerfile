FROM ubuntu:jammy

RUN apt update && \
    DEBIAN_FRONTEND=noninteractive apt install -y \
        clang

ADD main.cpp /main.cpp

RUN clang++ /main.cpp -o /main
