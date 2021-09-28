;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; formula 1
(setf f1 "(acfg)(bcd)(aed)(fade)(bgfae)="); = is guard
(setf n (length f1))
(setf tag (make-string n ?-)); v----vv-----vv--------vv-
(setf n (1- n)); n is guard's position
(setf out (make-string n ?=)); output buffer
(setf k 0); output buffer's pointer
(setf start 0); cycle starting position
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun dmp () (insert f1 ?\n tag ?\n)); debug
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun first-pass ()
  (let ((fst)); first character after ( parenthesis
    (dotimes (j n)
      (when (= (aref f1 j) ?\(); (
        (aset tag j ?v)
        (setf fst (aref f1 (1+ j))));
      (when (= (aref f1 j) ?\)); )
        (aset tag j ?v)
        (aset f1 j fst)))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun insert-coin (c)
  "push character into out"
  (aset out k c)
  (setf k (1+ k)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun rewind ()
  "find first un-tagged f1 symbol"
  (while (= (aref tag start) ?v)
    (setf start (1+ start))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun scan (u);                                     {1}
  " scan from u onwards, the key is at f1@n ";       {_}
  (while (not (= (aref f1 u) (aref f1 n)));          [2]
    (setf u (1+ u)));                                [3]
  ;; we have found it!!                              (*)
  (when (not (= u n)); if not the guardian           [4]
    (aset tag u ?v); tag uth element                 [5]
    (aset f1 n (aref f1 (1+ u))); set new key        (6)
    (scan (+ 2 u)))); again                          {7}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun cycle ();                                     {0}
  (insert-coin ?\();                                 {1}
  (aset tag start ?v); tag the start                 {2}
  (insert-coin (aref f1 start)); push to out buffer  {3}
  (aset f1 n (aref f1 (1+ start))); set search key   {4}
  (catch 'break; do the loop                         {5}
    (while t; thats                                  {6}
      (scan (+ 2 start)); make a scan                {7}
      (when (= (aref f1 start) (aref f1 n)); rwd?    {8}        
        (throw 'break nil)); we are done!            {9}
      (insert-coin (aref f1 n))));continuer à répéter[a)
  (insert-coin ?\)));                                (b}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun main ();                                      {0}
  (first-pass);                                      {1}
  (catch 'done;                                      {2}
    (while t;                                        {3}
      (rewind);                                      {4}
      (when (= start n) (throw 'done nil));          [5]
      (cycle)));                                     {6}
  (insert (substring out 0 k)));                     {7)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; log: - check this out                             {)
