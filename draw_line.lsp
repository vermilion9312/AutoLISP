(defun c:qq ()
  (draw_line (getpoint) (getpoint))
  (princ)
)


(defun draw_line (list:start_point list:end_point)
  (entmake (list (cons 0 "LINE") (cons 10 list:start_point) (cons 11 list:end_point)))
)


(defun rotate_coordinate (list:reference_coordinate list:coordinate real:radian
                          / real:x real:y real:a real:b real:return_x real:return_y)
  (setq real:a (car list:reference_coordinate))
  (setq real:b (cadr list:reference_coordinate))
  (setq real:x (car list:coordinate))
  (setq real:y (cadr list:coordinate))
  (setq real:return_x (+ (- (* (- real:x real:a) (cos real:radian)) (* (- real:y real:b) (sin real:radian))) real:a))
  (setq real:return_y (+ (+ (* (- real:x real:a) (sin real:radian)) (* (- real:y real:b) (cos real:radian))) real:b))
  (list return_x return_y)
)