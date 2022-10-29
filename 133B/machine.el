                            ;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setf f1     "(acfg)(bcd)(aed)(fade)(bgfae)"
      f1-len  (length f1))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;_
(defun off (c)
  "Get c's 1-based offset from a"
  (- c ?`))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;:___
(defun get-max-off (formula)
  "Get the maximum character offset in formula"
  (let ((n 0))
    (defun update (c)
      "check c and update n if necessary"
      (let ((offset (off c)))
        (when (> offset n)
          (setf n offset))))
    (mapcar 'update formula)
    n))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setf n (get-max-off f1))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun cons-T (n)
  (let ((T (make-list n 0)))
    (dotimes (j n)
      (setf (nth j T) j))
    T ))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setf T (cons-T (1+ n)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setf j    0
      Z    0
      i    0
      temp 0)
(defun check (c)
  ""
  (if (= c ?\))
      (setf Z 0)
    (if (= c ?\()
        (setf (nth j T) Z)
      (progn
        (setf i         (off c)
              temp      (nth i T)
              (nth i T) Z
              Z         temp)
        (if (= (nth i T) 0)
            (setf j i))))))
(mapcar 'check (reverse f1))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
T ;; type C-x C-e here, after M-x eval-buffer
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; log: :)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;                                                ;;;;;;;;
