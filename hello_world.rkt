#lang racket

(require web-server/servlet)
(require web-server/servlet-env)
(require racket/date)

(define (current-datetime)
  (current-seconds))

(define (format-datetime seconds)
  (date->string (seconds->date seconds)))

(define (start request)
  (let ([now (current-datetime)]) ; Get the current time in seconds
    (response/xexpr
     `(html
       (head (title "Hello World Mr.Pape"))
       (body
        (h1 "Hello, World! Mr. Pape")
        (p ,(format "Current day and time: ~a" (format-datetime now))))))))

(define (launch)
  (serve/servlet start
                 #:port 8080
                 #:listen-ip #f
                 #:servlet-path "/"))

(launch)