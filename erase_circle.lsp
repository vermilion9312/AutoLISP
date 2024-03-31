(defun c:aa ()
  (setq selection_set (ssget (list (cons 0 "CIRCLE,TEXT"))))
    
  (foreach item (ssnamex selection_set)
    (entdel (cadr item))
  )
  
  (princ)
)