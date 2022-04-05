#! /bin/sh
#|
exec racket -e '(printf "Running...\n")' -u "$0" ${1+"$@"}
|#

#lang racket

(require racket/system)

(system "curl https://getsubstrate.io -sSf | bash -s -- --fast")
(system "source ~/.cargo/env ")
(system "curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain none")
(system "rustup default nightly-2021-10-19")
(system "rustup target add wasm32-unknown-unknown")
