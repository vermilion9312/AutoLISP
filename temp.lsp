(defun c:qq ()
  (vl-load-com)
  (setq polyline_entity_name (car (entsel)))
  (setq variant_polyline_object (vlax-ename->vla-object polyline_entity_name))
  ; (vlax-dump-object variant_polyline_object T)
  (setq coordinates (vlax-get variant_polyline_object 'Coordinates))
  ; (princ)
)

; (defun c:qq ()
;   (vl-load-com)
;   (setq polyline_entity_name (car (entsel)))
;   (setq variant_polyline_object (vlax-ename->vla-object polyline_entity_name))
;   (setq coordinates (vla-get-coordinates variant_polyline_object))
;   (setq flattened_coordinates (apply 'append coordinates))
;   (princ flattened_coordinates)
; )

; (setq coords(vlax-get (vlax-ename->vla-object (car (entsel "\nSelect lwpolyline >"))) 'Coordinates))

(-2220.44 -18050.1
  -2109.04 -17938.7
  3468.16 -17938.7
  3579.56 -18050.1
  3579.56 -19627.3
  3468.16 -19738.7
  -2085.44 -19738.7
  -2220.44 -19603.7)

(defun find_largest_y_coordinate (coordinate_list / i largest_y_coordinate)
  (setq largest_y_coordinate nil)
  
  (setq i 0)
  (while (< i (/ (length coordinate_list) 2))
    
    
    (setq i (1+ i))
  )
)

(defun define_constant ()
  (setq MIN_VALUE)
)