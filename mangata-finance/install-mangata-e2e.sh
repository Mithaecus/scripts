#! /bin/sh
#|
exec racket -e '(printf "Running...\n")' -u "$0" ${1+"$@"}
|#

#lang racket

(require racket/system)

(system "rm -fr mangata-e2e")
(system "git clone https://github.com/mangata-finance/mangata-e2e")
(system "cd mangata-e2e && yarn")
