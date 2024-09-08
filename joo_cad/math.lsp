(defun rotate_vertor (vector theta / rotation_matrix)
  (setq rotation_matrix (list
                          (list (cos theta) (- (sin theta)))
                          (list (sin theta)    (cos theta))
                        )
  )
  
  (liner_transformation rotation_matrix vector)
)

(defun liner_transformation (matrix vector)
  (mapcar
    (function
      (lambda (matrix_row) (apply '+ (dot_product matrix_row vector)))
    )
    matrix
  )
)

(defun dot_product (vector1 vector2)
  (mapcar '* vector1 vector2)
)

(defun find_radian (startPoint endPoint)
  
  (setq startPointX (car startPoint))
  (setq startPointY (cadr startPoint))
  (setq endPointX (car endPoint))
  (setq endPointY (cadr endPoint))
  (setq xDiff (- endPointX startPointX))
  (setq yDiff (- endPointY startPointY))

  (if (/= xDiff 0) (setq radian (atan (/ yDiff xDiff))))
  (cond
    ((and (< xDiff 0) (> yDiff 0)) (setq radian (+ radian pi)))
    ((and (< xDiff 0) (< yDiff 0)) (setq radian (+ radian pi)))
    ((and (= yDiff 0) (< xDiff 0)) (setq radian (+ radian pi)))
    ((and (= xDiff 0) (> yDiff 0)) (setq radian (* pi 0.5)))
    ((and (= xDiff 0) (< yDiff 0)) (setq radian (* pi 1.5)))
  )
  
  radian
  
)