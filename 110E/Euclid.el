(defun gcd (m n)
  ""
  (setq s "START\n")
  (defun _gcd (m n)
    "greatest common divisor"
    (setq s (concat s (format "(%d, %d)\n" m n)))
    (if (> n 0)
        (let ((r (mod m n)))
          (_gcd n r))))
  (_gcd m n)
  (princ s)
  'FINISH)
(gcd 2166 6099)
