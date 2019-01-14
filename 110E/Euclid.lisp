#!/usr/bin/sbcl --script
(defparameter argv (list "2166" "6099")) ;; m and n
;; update default values from command line
(let ((p argv))
  (dolist (q (cdr sb-ext:*posix-argv*))
    (setf (car p) q)
    (setf p (cdr p))))
(defparameter m (parse-integer (first argv)))
(defparameter n (parse-integer (second argv)))
(defun gcd-alg ()
  "greatest common divisor algorithm"
  (format t "m = ~A, n = ~A~%" m n)
  (let ((r (mod m n)))
    (if (eq r 0)
	n
	(progn (setf m n n r) (gcd-alg)))))
(gcd-alg)
