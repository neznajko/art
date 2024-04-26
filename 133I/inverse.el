;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 帰
(defun invert-in-place (X);                                      る
  "invert permutation X in place";
  (let ((prev 0);                                                か
        (curr (- (length X) 1)));                                え
    (while (> curr 0);                                           る
      (cond ((< (aref X curr) 0)
             (progn; s                                    volver
               (aset X curr (- (aref X curr))); u         зворот  
               (setq curr (1- curr))))
            (t (catch 'abc; i                            ritorno
                 (while t
                   (let ((next (aref X curr)))
                     (aset X curr (- prev))
                     (cond ((= next 0); f                rentrer
                            (progn
                              (setq prev 0)
                              (throw 'abc nil))))
                     (setq prev curr); g             zurückgeben
                     (setq curr next))))))))
  (message "%s" X))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                 0 1 2 3 4 5 6 7 
(invert-in-place [0 5 4 1 7 6 2 3])
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; log: I have one enemy                                  myself
