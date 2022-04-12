;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; FOR R
(setf m (list 0 3 4 4));            this is the mixed radix base UNNIN
(setf n (1- (length m)));         that will be the back position G THE
(setf a (make-list (1+ n) 0));                       t h e Tuple PROGR
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; AM TY
(setf s "");                                       output string PE M-
(defun vzit ();                                                  x eva
  " append current value of the tuple to s ";                    l-buf
  (setf s (format "%s\n%s" s (cdr a))));                         fer,
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; AND C
(catch 'thus;                                                    HECK
  (while t;                                                      OUT F
    (vzit);                                                      ILE C
    (setf j n);                                             d¾ei ONTEN
    (while (= (nth j a) (1- (nth j m)));                         T AFT
      (progn;                                                    ER TH
        (setf (nth j a) 0);                                      E LAS
        (setf j (1- j))));                                       T INS
    (when (= j 0) (throw 'thus nil));                            TRUCT
    (cl-incf (nth j a))));                                       ION.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(insert s)                                                      
