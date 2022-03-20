;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; For running the program load topsort.el in emacs and type
;; M-x eval-buffer, scroll to the bottom to see the result.
(defun file-to-string (file) ;; from https://gnu.support/
  "File to string function"
  (with-temp-buffer
    (insert-file-contents file)
    (buffer-string)))
;; with-temp-buffer
;;   Macro: Create a temporary buffer, and evaluate BODY there
;;   like ‘progn’.
;; insert-file-contents
;;   Function: Insert contents of file FILENAME after point.
;; buffer-string
;;   Function: Return the contents of the current buffer as a
;; string.
(setf buf (file-to-string "./paper.dev"))
(setf MIXWRD 5) ;; No. bytes in a MIX word
(setf j 0) ;; buffer position
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun getnext ()
  "get next input"
  (setf c (aref buf j))  ;; chck if character upon j is new line
  (if (char-equal c ?\n) ;; if so, skip it
      (setf j (1+ j)))   ;;
  (setf end (+ j MIXWRD))           ;; extract 5 byte word as
  (setf subs (substring buf j end)) ;; [j, end) substring
  (setf j end) ;; update j
  (string-to-number subs)) ;; convyort to number and return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(getnext) ;; skip dummy record
(setf n (1+ (getnext))) ;; no. vertices + 1
(setf vec (make-vector n t)) ;; fill temporary with t
(dotimes (k n)                  ;; set up the data structure
  (setf (aref vec k) (list 0))) ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Until sentinels 0 0, the remaining buf entries u v represent
;; u -> v relations. For each pair we must increment the counter
;; for v and insert link node at u. So make this operations
;; available as functions.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun inc (v)
  "inc COUNT"
  (cl-incf (car (aref vec v))))
(defun insert-coin (u v)
  "insert v-link to u-th vec"
  (setf node (list v))
  (setf head (aref vec u))
  (setf (cdr node) (cdr head))
  (setf (cdr head) node))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Now everything is ready for building the data structure
(catch 'break
  (while t
    (setf u (getnext))
    (setf v (getnext))
    (when (= u v) (throw 'break nil))
    (inc v)
    (insert-coin u v)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Fill the queue
(setf r 0) ;; rear pointer
(setf j (1- n)) ;; reverse loop
(while (> j 0)
  (if (= (car (aref vec j)) 0) ;; chck if sorce node
      (progn ;; THATS the weird trick
        (setf (car (aref vec r)) j)
        (setf r j)))
  (setf j (1- j))) ;; decrement
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Start popping
(defun dec (u)
  "dec COUNT"
  (cl-decf (car (aref vec u))))
;;
(setf f 0) ;; queue front 
(while (> (car (aref vec f)) 0)
  (setf f (car (aref vec f)))
  (insert (format "%d" f) " ")
  ;; loop over SUCCs and decrement their counts, if they become
  ;; zero, add them to the queue
  (setf node (cdr (aref vec f)))
  (while node
    (setf u (car node))
    (dec u)
    (if (= (car (aref vec u)) 0)
        (progn
          (setf (car (aref vec r)) u)
          (setf r u)))
    (setf node (cdr node))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;
