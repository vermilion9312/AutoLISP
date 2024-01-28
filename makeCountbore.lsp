(defun rotationMatrix (ang coordinate)
  (setq x (car coordinate))
  (setq y (cadr coordinate))
  (setq returnX (- (* (cos ang) x) (* (sin ang) y)))
  (setq returnY (+ (* (sin ang) x) (* (cos ang) y)))
  (list returnX returnY)
)



(defun c:555 ()
  (princ (1+ (list 2 2)))
)