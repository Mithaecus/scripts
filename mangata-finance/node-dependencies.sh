#! /bin/sh
#|
exec racket -e '(printf "Running...\n")' -u "$0" ${1+"$@"}
|#

#lang racket

(require racket/system)


(if 
    (and (equal?
            (system/exit-code 
                "curl https://getsubstrate.io -sSf | bash -s -- --fast") 
                0)
        (equal?
            (system/exit-code 
                "source ~/.cargo/env") 
                0)
        (equal?
            (system/exit-code 
                "curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain none") 
                0)
        (equal?
            (system/exit-code 
                "rustup default nightly-2021-10-19") 
                0)
        (equal?
            (system/exit-code 
                "rustup target add wasm32-unknown-unknown") 
                0))
    (displayln "Installed successfully")
    (raise-user-error "Installation failed."))
