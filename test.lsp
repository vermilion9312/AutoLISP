(vl-load-com)

; (defun c:qq ()
  
;   (setq startPoint (getpoint))
;   (setq endPoint (getpoint))
;   (setq startPointX (car startPoint))
;   (setq startPointY (cadr startPoint))
;   (setq endPointX (car endPoint))
;   (setq endPointY (cadr endPoint))
;   (setq xDiff (- endPointX startPointX))
;   (setq yDiff (- endPointY startPointY))

;   (if (/= xDiff 0) (setq radian (atan (/ yDiff xDiff))))
;   (cond
;     ((and (< xDiff 0) (> yDiff 0)) (setq radian (+ radian pi)))
;     ((and (< xDiff 0) (< yDiff 0)) (setq radian (+ radian pi)))
;     ((and (= yDiff 0) (< xDiff 0)) (setq radian (+ radian pi)))
;     ((and (= xDiff 0) (> yDiff 0)) (setq radian (* pi 0.5)))
;     ((and (= xDiff 0) (< yDiff 0)) (setq radian (* pi 1.5)))
;   )
  
;   radian
  
; )