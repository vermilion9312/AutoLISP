(defun c:qq ()
  (setq entity_name (car (entsel)))
  (setq entity_object (entget entity_name))
  (setq center_point (cdr (assoc 10 entity_object)))
  (setq radius (cdr (assoc 40 entity_object)))
  (princ radius)
  (setq input_point (getpoint "\n점을 입력하세요"))

  (if (is_in_circle input_point center_point radius)
    (princ "\n원 안에 있습니다")
    (princ "\n원 밖에 있습니다")
  )
  
  (princ)
)


(defun is_in_circle (input_point circle_center_point radius)
  (<= (distance input_point circle_center_point) radius)
)