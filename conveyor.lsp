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
  (while (< i 400)
    
    (entmake (list (cons 0 "CIRCLE") (cons 10 circle_center_point) (cons 40 CIRCLE_RADIUS)))
    (entmake (list (cons 0 "CIRCLE") (cons 10 circle_center_point) (cons 40 CONVEYOR_PITCH)))
    
    (setq circle_entity_name (entlast))
    
    (setq variant_polyline_object (vlax-ename->vla-object polyline_entity_name))
    (setq variant_circle_object (vlax-ename->vla-object circle_entity_name))
    
    (setq intersection_points (vla-IntersectWith variant_polyline_object variant_circle_object acExtendNone))
    
    (setq temporary_points (vlax-safearray->list (vlax-variant-value intersection_points)))
    
    (setq x1_coordinate (nth 0 temporary_points))
    (setq y1_coordinate (nth 1 temporary_points))
    (setq x2_coordinate (nth 3 temporary_points))
    (setq y2_coordinate (nth 4 temporary_points))
    
    (setq intersection_point1 (list x1_coordinate y1_coordinate))
    (setq intersection_point2 (list x2_coordinate y2_coordinate))
    
    (if (/= previous_center_point intersection_point1)
      (progn
        (setq previous_center_point center_point)
        (setq circle_center_point intersection_point1)
      )
    )
    (if (/= previous_center_point intersection_point2)
      (progn
        (setq previous_center_point center_point)
        (setq circle_center_point intersection_point2)
      )
    )
  


    (setq i (1+ i))
  )
  
  
  (princ)
)