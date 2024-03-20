(vl-load-com)
(defun c:qq()
    ;; This example creates a line and circle and finds the points at
    ;; which they intersect.
    (setq acadObj (vlax-get-acad-object))
    (setq doc (vla-get-ActiveDocument acadObj))

    ;; Create the line
    (setq startPt (vlax-3d-point 1 1 0)
          endPt (vlax-3d-point 5 5 0))  

    (setq modelSpace (vla-get-ModelSpace doc))  
    (setq lineObj (vla-AddLine modelSpace startPt endPt))
        
    ;; Create the circle
    (setq centerPt (vlax-3d-point 1 1 0)
          radius 1)
    (setq circleObj (vla-AddCircle modelSpace centerPt radius))
    (vla-ZoomAll acadObj)
      
    ;; Find the intersection points between the line and the circle
    (setq intPoints (vla-IntersectWith lineObj circleObj acExtendNone))
    
    ;; Print all the intersection points
    (setq I 0
          j 0
          k 0)
    (if (/= (type intPoints) vlax-vbEmpty)
        (while (>= (vlax-safearray-get-u-bound (vlax-variant-value intPoints) 1) I)
            (setq tempPoint (vlax-safearray->list (vlax-variant-value intPoints)))
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
)