(defun c:qq ()
  (vl-load-com)
  (setq autocad_application_object (vlax-get-acad-object))
  (setq active_document_object (vla-get-activedocument autocad_application_object))
  (setq model_space_object  (vla-get-modelspace active_document_object))


  (setq entity_name01 (car (entsel)))
  (setq entity_name02 (car (entsel)))
  
  (setq variant_entity_object01 (vlax-ename->vla-object entity_name01))
  (setq variant_entity_object02 (vlax-ename->vla-object entity_name02))
  
  (setq intersection_points (vla-IntersectWith variant_entity_object01 variant_entity_object02 acExtendNone))
  
  (setq I 0
      j 0
      k 0)
  (if (/= (type intersection_points) vlax-vbEmpty)
      (while (>= (vlax-safearray-get-u-bound (vlax-variant-value intersection_points) 1) I)
          (setq tempPoint (vlax-safearray->list (vlax-variant-value intersection_points)))
          (setq str (strcat "Intersection Point[" (itoa k) "] is: " (rtos (nth j tempPoint) 2) ","
                                                                    (rtos (nth (1+ j) tempPoint) 2) ","
                                                                    (rtos (nth (+ j 2) tempPoint) 2)))
          (alert str)
          (setq str ""
                I (+ I 2)
                j (+ j 3)
                k (1+ k))
      )
  )
  
  
  ; (setq start_point (getpoint "\n시작점: "))
  ; (setq end_point (getpoint start_point "\n끝점: ")) 
  

  (princ)
)

