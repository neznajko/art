;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun getprimes ()
  ;; P1. [Start table]
  (setq prime (list 2)) ;; prime list
  (setq n 3)            ;; next candidate
  (setq x 500)          ;; table size
  (setq j 1)            ;; number of primes found
  (catch 'break
    (while t
      (catch 'continue
        ;; P2. [N is prime]
        (setq prime (append prime (list n)))
        (setq j (1+ j))
        ;; P3. [500 found?]
        (when (equal j x) (throw 'break nil))
        (while t
          (catch 'advance
            ;; P4. [Advance N]
            (setq n (+ 2 n)) 
            ;; P5. [K <- 2]
            ;; P8. [Advance K]
            (dolist (p (cdr prime))
              ;; P6. [PRIME[K]\N?]
              (if (not (equal 0 (mod n p)))
                  ;; P7. [PRIME[K] large?]
                  (when (<= (floor (/ n p)) p) (throw 'continue nil))
                (throw 'advance nil))
              )))
        )))
  prime)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun spit ()
  (setq linez 50
        prime (getprimes))
  (dotimes (i linez)
    (setq buf ""
          j i)
    (while (< j x)
      (setq buf (concat buf (format " %04d" (nth j prime)))
            j (+ j linez)))
    (insert buf "\n")))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; log:
;; 1. Load file into Emacs.
;; 2. Type M-x eval-buffer.
;; 3. Go to the scratch buffer.
;; 4. Type (spit), and hit Ctrl-J.
