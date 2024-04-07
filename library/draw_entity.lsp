(defun draw_line (start_point end_polint color)
  (entmake (list (cons 0 "LINE") (cons 10 start_point) (cons 11 end_point) (cons 62 color)))
)

(defun draw_circle (center_point radius color)
  (entmake (list (cons 0 "CIRCLE") (cons 10 center_point) (cons 40 radius) (cons 62 color)))
)