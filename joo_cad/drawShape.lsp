(defun draw_line (start_point end_point)
  (entmake (list (cons 0 "LINE") (cons 10 start_point) (cons 11 end_point)))
)

(defun draw_circle_diameter (center_point diameter)
  (draw_circle_radius center_point (/ diameter 2))
)

(defun draw_circle_radius (center_point radius)
  (entmake (list (cons 0 "CIRCLE") (cons 10 center_point) (cons 40 radius)))
)