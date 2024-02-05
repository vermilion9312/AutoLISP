(defun c:xx ()
  
  (setq temp (ssget))
  
  (setq i 0)
  (while (< i (sslength temp))
    
    (princ i)
    
    (setq i (1+ i))
  )
)

; (princ (cdr (assoc 10 (entget (car (entsel))))))