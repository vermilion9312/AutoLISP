  (vl-load-com)
  (setq autocad_application_object (vlax-get-acad-object))
  (setq active_document (vla-get-activedocument autocad_application_object))
  (setq model_space_collection (vla-get-modelspace active_document))