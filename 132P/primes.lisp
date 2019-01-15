#!/usr/bin/sbcl --script
;; P1. [Start table]
(defparameter prime (list 2)) ;; prime list
(defparameter n 3)            ;; prime candidate
(defparameter mx 500)         ;; number of primes
(tagbody start
 ;; P2. [N is prime]
 (setq prime (append prime (list n)))
 ;; P3. [500 found?]
 (if (eq (length prime) mx)
     (go end))
 (do () (nil) ;; infinite loop
     ;; P4. [Advance N]
     (setq n (+ 2 n)) 
     ;; P5. [K <- 2]
     ;; P8. [Advance K]
     (dolist (k (cdr prime))
       ;; P6. [PRIME[K]\N?]
       (if (eq 0 (mod n k))
	   (return))
       ;; P7. [PRIME[K] large?]
       (if (<= (floor (/ n k)) k)
	   (go start))))
 (go start)
 end)
;; spit
(defparameter linez 50) ;; number of lines
(do ((i 0 (+ 1 i)) (buf) (ascii))
    ((>= i linez))
    (setq buf "")
    (do ((j i (+ linez j)))
	((>= j mx))
	(setq ascii (format nil " ~4,'0d" (nth j prime)))
	(setq buf (concatenate 'string buf ascii)))
    (progn (setq buf (concatenate 'string buf (format nil "~%")))
	   (format t "~A" buf)))

