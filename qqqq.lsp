(defun c:77 ()
  (vl-load-com)

  (setq entity_name (car (entsel "\n선택하셈: ")))
  (setq object (vlax-ename->vla-object entity_name))
  (setq bounding_box (vla-getboundingbox object 'min_point 'max_point))
  (setq lower_left_corner (vlax-safearray->list min_point))
  (setq upper_right_corner (vlax-safearray->list max_point))
  
  (princ lower_left_corner)
  (princ upper_right_corner)
  
  (princ)
)


