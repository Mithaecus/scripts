#lang racket

(require net/http-client json)

(for ([i (in-range 1 1000)])
    (define-values (status header response)
    (http-sendrecv 
        "cosylab.iiitd.edu.in" 
        (string-append "/flavordb/entities_json?id=" (number->string i))
         #:ssl? #t))
    (define data (read-json response))

    (jsexpr->string	data)

    (define (write-json-wrapper jsexpr filename)
    (call-with-output-file filename
        (λ (x) (write-json jsexpr x))
        #:exists 'replace))

    (write-json-wrapper data (string-append "./" (number->string i) ".json")))