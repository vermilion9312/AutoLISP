(defun c:44 ()
  (setq firstPoint (getpoint))
  (setq secondPoint (getpoint firstPoint))
  
  (setq firstPointX (car firstPoint))
  (setq firstPointY (cadr firstPoint))

  (setq secondPointX (car secondPoint))
  (setq secondPointY (cadr secondPoint))
  
  (setq x1 (- firstPointX 3.25)) ;D/2
  (setq x2 (- firstPointX 1.7)) ;d/2
  (setq x3 (+ firstPointX 1.7))
  (setq x4 (+ firstPointX 3.25))
  
  (setq y1 firstPointY)
  (setq y2 (- firstPointY 3.3)) ;dp
  (setq y3 secondPointY)
  
  (entmake (list (cons 0 "LINE") (cons 10 (list x1 y1)) (cons 11 (list x1 y2))))
  (entmake (list (cons 0 "LINE") (cons 10 (list x4 y1)) (cons 11 (list x4 y2))))
  (entmake (list (cons 0 "LINE") (cons 10 (list x1 y2)) (cons 11 (list x4 y2))))
  (entmake (list (cons 0 "LINE") (cons 10 (list x2 y2)) (cons 11 (list x2 y3))))
  (entmake (list (cons 0 "LINE") (cons 10 (list x3 y2)) (cons 11 (list x3 y3))))
)