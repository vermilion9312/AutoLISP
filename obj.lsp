(defun c:qq ()
  (vl-load-com)
  (setq autocad_application_object (vlax-get-acad-object))
  (setq active_document (vla-get-activedocument autocad_application_object))
  (setq model_space_collection (vla-get-modelspace active_document))
  (setq polyline_entity_name (car (entsel)))
  ; (setq polyline_entity_object (entget polyline_entity_name))
  ; (princ polyline_entity_object)
  
  (setq variant_polyline_object (vlax-ename->vla-object polyline_entity_name))
  
  (vlax-dump-object variant_polyline_object)

  
  
  
  
  (princ)
)

