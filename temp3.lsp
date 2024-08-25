(defun c:qq (/ center_point radius)
  (setq center_point (getpoint "\n중심점 입력: "))
  (setq radius (getint "\n 반지름 입력: "))
  
  (draw_circle)

  (princ)
)

(defun draw_circle ()
  (entmake (list (cons 0 "CIRCLE") (cons 10 center_point) (cons 40 radius)))
)

(defun draw_line ()
  (setq start_point (getpoint "\n시작점 입력: "))
  (setq end_point (getpoint "\n끝점 입력: "))
  (entmake (list (cons 0 "LINE") (cons 10 start_point) (cons 11 end_point)))
)

