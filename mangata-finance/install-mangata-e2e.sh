#! /bin/sh
#|
exec racket -e '(printf "Running...\n")' -u "$0" ${1+"$@"}
|#

#lang racket

(require racket/system)

(if 
    (and (equal?
            (system/exit-code 
                "rm -fr mangata-e2e") 
                0)
         (equal?
            (system/exit-code 
                "git clone https://github.com/mangata-finance/mangata-e2e") 
                0)
         (equal?
            (system/exit-code 
                "cd mangata-e2e && yarn") 
                0))
    (displayln "Installed successfully")
    (raise-user-error "Installation failed."))
