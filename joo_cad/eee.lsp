(defun rotation_vertor ()
  (setq rotation_matrix (list
                          (list (cos theta) (- (sin theta)) 0.0)
                          (list (sin theta)     (cos theta) 0.0)
                          (list         0.0             0.0 1.0)
                        )
  )
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