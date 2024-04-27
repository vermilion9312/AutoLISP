(defun c:qq ()
  (vl-load-com)
  (setq autocad_application_object (vlax-get-acad-object))
  (setq active_document (vla-get-activedocument autocad_application_object))
  (setq model_space_collection (vla-get-modelspace active_document))
  (setq polyline_entity_name (car (entsel)))
  
  (setq variant_polyline_object (vlax-ename->vla-object polyline_entity_name))
  
  
  
  ; (setq coordinates (vlax-safearray->list (vlax-variant-value (vla-get-Coordinates variant_polyline_object))))
  
  (setq coordinates (vlax-get variant_polyline_object "coordinates"))
  (princ coordinates)
  
  (vlax-put variant_polyline_object "coordinates" (list 0.0 10.0 10.0 10.0 10.0 0.0 0.0 0.0))
  
  ; (setq new_coordinates (vlax-make-safearray vlax-vbDouble (cons 0 8)))

  ; (vlax-safearray-fill new_coordinates (list 0 10 10 10 10 0 0 0))
  
  ; (setq new_coordinates (vlax-make-safearray vlax-vbDouble (cons 0 7)))
  ; (vlax-safearray-fill new_coordinates '(0.0 10.0 10.0 10.0 10.0 0.0 0.0 0.0))

  
  ; (vla-put-Coordinate variant_polyline_object 0 new_coordinates)
  ; (vla-Update variant_polyline_object)
  

 
  ; (princ coordinates)
  
  (princ)
)
; (0.700323 3.14073 3.24514 3.14073 3.24514 1.51791 0.700323 1.51791)

  ; (setq polyline_entity_object (entget polyline_entity_name))
  ; (princ polyline_entity_object)
  
  ; (vlax-dump-object coordinates)
    ;   (setq newCoord (vlax-make-safearray vlax-vbDouble '(0 . 2)))
    ; (vlax-safearray-fill newCoord (list (+ (nth 0 coord) 1)
		; 		        (nth 1 coord)
		; 		        (nth 2 coord)))

; IAcadLWPolyline: AutoCAD Lightweight Polyline 인터페이스
; 특성 값:
;   Application (RO) = #<VLA-OBJECT IAcadApplication 00007ff7efc39080>
;   Area (RO) = 217973.0
;   Closed = -1
;   ConstantWidth = 0.0
;   Coordinate = ...색인화된 내용이 표시되지 않음...
;   Coordinates = (2381.99 1660.2 3055.48 1660.2 3055.48 1336.55 ... )
;   Document (RO) = #<VLA-OBJECT IAcadDocument 000001328b00f3c8>
;   Elevation = 0.0
;   EntityTransparency = "ByLayer"
;   Handle (RO) = "2B9"
;   HasExtensionDictionary (RO) = 0
;   Hyperlinks (RO) = #<VLA-OBJECT IAcadHyperlinks 0000013295ca0b78>
;   Layer = "0"
;   Length (RO) = 1994.27
;   Linetype = "ByLayer"
;   LinetypeGeneration = 0
;   LinetypeScale = 1.0
;   Lineweight = -1
;   Material = "ByLayer"
;   Normal = (0.0 0.0 1.0)
;   ObjectID (RO) = 42
;   ObjectName (RO) = "AcDbPolyline"
;   OwnerID (RO) = 43
;   PlotStyleName = "ByLayer"
;   Thickness = 0.0
;   TrueColor = #<VLA-OBJECT IAcadAcCmColor 0000013295ca0570>
;   Visible = -1