FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y fio && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

CMD ["fio", "--help"]
