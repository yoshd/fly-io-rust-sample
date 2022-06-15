FROM rust:1.61 as builder

WORKDIR /work

COPY ./Cargo.lock ./Cargo.lock
COPY ./Cargo.toml ./Cargo.toml

COPY ./src ./src

RUN cargo build --release

FROM gcr.io/distroless/cc

COPY --from=builder /work/target/release/fly-io-rust-sample .

CMD ["./fly-io-rust-sample"]
