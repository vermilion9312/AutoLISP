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
  ; (setq x_coordinate (car circle_center_point))
  ; (setq y_coordinate (cadr circle_center_point))
  (setq previous_center_point nil)
  ; (setq previous_x_coordinate x_coordinate)
  ; (setq previous_y_coordinate y_coordinate)
  
  (setq i 0)
  (while (< i 100)
    
    (entmake (list (cons 0 "CIRCLE") (cons 10 circle_center_point) (cons 40 CIRCLE_RADIUS)))
    (entmake (list (cons 0 "CIRCLE") (cons 10 circle_center_point) (cons 40 CONVEYOR_PITCH)))
    
    (setq circle_entity_name (entlast))
    
    (setq variant_polyline_object (vlax-ename->vla-object polyline_entity_name))
    (setq variant_circle_object (vlax-ename->vla-object circle_entity_name))
    
    (setq intersection_point_safearray (vla-IntersectWith variant_polyline_object variant_circle_object acExtendNone))
    
    (setq intersection_point_list (vlax-safearray->list (vlax-variant-value intersection_point_safearray)))
    
    (princ "\n")
    (princ (nth 0 intersection_point_list))
    (princ "\n")
    (princ (* (nth 0 intersection_point_list) 1000))
    (princ "\n")
    (princ (atoi (rtos (* (nth 0 intersection_point_list) 1000) 2 0)))
    
    

    ; (setq first_intersection_point (list (nth 0 intersection_point_list) (atof (rtos (nth 1 intersection_point_list) 2 opt))))
    ; (setq second_intersection_point (list (atof (rtos (nth 3 intersection_point_list) 2 opt)) (atof (rtos (nth 4 intersection_point_list) 2 opt))))
    ; (princ "\n--------------------------------------------")
    ; (princ "\nprevious_center_point: ")
    ; (princ previous_center_point)
    ; (princ "\nfirst_intersection_point: ")
    ; (princ first_intersection_point)
    ; (princ "\nsecond_intersection_point: ")
    ; (princ second_intersection_point)
    ; (princ "\ncircle_center_point: ")
    ; (princ circle_center_point)

    


    ; (princ (strcat "\n" (rtos (+ i 1))))
    ; (if (not (equal previous_center_point first_intersection_point))
    ;   (progn
    ;     (setq previous_center_point circle_center_point)
    ;     (setq circle_center_point first_intersection_point)
    ;   )
    ;   (progn
    ;     (setq previous_center_point circle_center_point)
    ;     (setq circle_center_point second_intersection_point)
    ;   )
    ; )
    

  


    (setq i (1+ i))
  )
  
  
  (princ)
)