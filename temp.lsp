(defun c:xx ( / )

 (drawLine (getpoint) (getpoint) 1)
  
)

(defun drawLine (startPoint endPoint color)
  (entmake (list (cons 0 "LINE") (cons 10 startPoint) (cons 11 endPoint)
           (if (/= color nil) (cons 62 color))))
)
