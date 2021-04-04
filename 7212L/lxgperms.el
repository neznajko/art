(defun dunf (a)
  "array dunfing"
  (setq buf "")
  (dolist (l a)
    (setq buf (concat buf (format "%d," l))))
  (aset buf (1- (length buf)) ?\])
  (insert "[" buf "\n"))

(defun next (a)
  "generate next permutation"
  (dunf (cdr a))
  ;; [find j]
  (setq n (- (length a) 1)
        j (- n 1))
  (while (>= (nth j a) (nth (1+ j) a))
    (cl-decf j))
  (if (= j 0)
      nil ; no moar
    ;; [increace j]
    (setq r n)
    (while (>= (nth j a) (nth r a))
      (cl-decf r))
    ;; swap j, r
    (setq temp (nth j a))
    (setf (nth j a) (nth r a)
          (nth r a) temp)
    ;; [reverse]
    (setq r n
          j (1+ j))
    (while (< j r)
      (setq temp (nth j a))
      (setf (nth j a) (nth r a)
            (nth r a) temp)
      (cl-incf j)
      (cl-decf r))
    t
    ))

(defun lxgperms ()
  "main function"
  (setq a (list 0 1 2 2 4))
  (while (next a)))

;; log:
;; 1) M-x eval-buffer
;; 2) Go to scratch
;; 3) Type (lxgperms)
;; 4) Hit Ctrl-J
