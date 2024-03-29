(vl-load-com)
(setq autocad_application_object (vlax-get-acad-object))
(setq active_document_object (vla-get-activedocument autocad_application_object))
(setq model_space_object  (vla-get-modelspace active_document_object))

(defun c:qq ()
  (setq CONVEYOR_PITCH 76.47)
  (setq CIRCLE_RADIUS (/ 45 2.0))
  
  (setq polyline_entity_name (car (entsel)))
  (setq polyline_object (entget polyline_entity_name))
  (setq circle_center_point (cdr (assoc 10 polyline_object)))
  (setq previous_center_point nil)
  
  (setq i 0)
  (while (< i 35)
    
    (entmake (list (cons 0 "CIRCLE") (cons 10 circle_center_point) (cons 40 CIRCLE_RADIUS)))
    (entmake (list (cons 0 "CIRCLE") (cons 10 circle_center_point) (cons 40 CONVEYOR_PITCH)))
    
    (setq circle_entity_name (entlast))
    
    (setq variant_polyline_object (vlax-ename->vla-object polyline_entity_name))
    (setq variant_circle_object (vlax-ename->vla-object circle_entity_name))
    
    (setq intersection_point_safearray (vla-IntersectWith variant_polyline_object variant_circle_object acExtendNone))
    
    (setq intersection_point_list (vlax-safearray->list (vlax-variant-value intersection_point_safearray)))
    
    
    (setq first_intersection_point (list (nth 0 intersection_point_list) (nth 1 intersection_point_list)))
    (setq second_intersection_point (list (nth 3 intersection_point_list) (nth 4 intersection_point_list)))

    (if (not (equal previous_center_point (convert_to_integer first_intersection_point)))
      (progn
        (setq previous_center_point (convert_to_integer circle_center_point))
        (setq circle_center_point first_intersection_point)
      )
      (progn
        (setq previous_center_point (convert_to_integer circle_center_point))
        (setq circle_center_point second_intersection_point)
      )
    )
    

  


    (setq i (1+ i))
  )
  
  
  (princ)
)


(defun convert_to_integer (real_list) 
  (list (atoi (rtos (* (car real_list) 100) 2 0)) (atoi (rtos (* (cadr real_list) 100) 2 0)))
)