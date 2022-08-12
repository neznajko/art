;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun ee (m n)
  "f** news"
  (if (= 0 n)
      (list 1 0 m)
    (let* ((y (ee n (% m n)))
           (a (nth 0 y))
           (b (nth 1 y))
           (d (nth 2 y)))
      (list b (- a (* b (/ m n))) d))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; log: -Not big specialist, but it seems Functional Programming
;; nowadays is more attractive than the good old OØP for writing
;; clean and maintainable code, again not very sure, but I think
;; it's based, historically, at Lisp Language, and relies mainly
;; on functions as first class citizens, lambda functions and so
;; forth. For example, if you see a JavaScript construction like
;; dat.select("haha").filter(p => p.x() < 50).add(8).text("baz")
;; than you know that this is a functional programming paradigm.

