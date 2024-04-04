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

; IAcadLWPolyline: AutoCAD Lightweight Polyline 인터페이스
; 특성 값:
;   Application (RO) = #<VLA-OBJECT IAcadApplication 00007ff711ce9080>
;   Area (RO) = 295870.0
;   Closed = -1
;   ConstantWidth = 0.0
;   Coordinate = ...색인화된 내용이 표시되지 않음...
;   Coordinates = (2268.04 1797.51 2876.39 1797.51 2876.39 1311.17 ... )
;   Document (RO) = #<VLA-OBJECT IAcadDocument 00000219f6f6e6e8>
;   Elevation = 0.0
;   EntityTransparency = "ByLayer"
;   Handle (RO) = "2B8"
;   HasExtensionDictionary (RO) = 0
;   Hyperlinks (RO) = #<VLA-OBJECT IAcadHyperlinks 00000219cb75b208>
;   Layer = "0"
;   Length (RO) = 2189.4
;   Linetype = "ByLayer"
;   LinetypeGeneration = 0
;   LinetypeScale = 1.0
;   Lineweight = -1
;   Material = "ByLayer"
;   Normal = (0.0 0.0 1.0)
;   ObjectID (RO) = 44
;   ObjectName (RO) = "AcDbPolyline"
;   OwnerID (RO) = 42
;   PlotStyleName = "ByLayer"
;   Thickness = 0.0
;   TrueColor = #<VLA-OBJECT IAcadAcCmColor 00000219cb75a780>
;   Visible = -1