ARG RUST_VERSION=1.46
FROM rust:${RUST_VERSION} as builder
RUN git clone https://github.com/newrelic/rusty-hog.git
WORKDIR /rusty-hog
RUN cargo build --release

FROM debian:buster-slim
RUN apt-get update && apt-get install -y openssl openssh-client ca-certificates
COPY --from=builder /build/target/release/*_hog /usr/local/bin/
ENV PATH=/usr/local/bin:$PATH
COPY ./entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/entrypoint.sh
RUN mkdir -p /toscan
COPY . /toscan/
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
