#!/usr/bin/sbcl --script
(defparameter key '(503 87 512 61 908 170 897 275
		    653 426 154 509 612 677 765 703))
(defparameter n (length key))
(defparameter cnt ())
;; C1. [Clear COUNTs]
(do ()
    ((eq (length cnt) n))
    (setq cnt (append cnt (list 0))))
;; C2. [Loop on i]
(do ((i (1- n) (1- i)))
    ((eq i 0))
    ;; C3. [Loop on j]
    (do ((j (1- i) (1- j)))
	((eq j -1))
	;; C4. [Compare Ki:Kj]
	(if (< (nth i key) (nth j key))
	    (setf (nth j cnt) (1+ (nth j cnt)))
	  (setf (nth i cnt) (1+ (nth i cnt))))))
;;
(dolist (k cnt) (prin1 k) (princ " "))

