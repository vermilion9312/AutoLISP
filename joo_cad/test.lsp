(load "math.lsp")
(load "drawCounterbore.lsp")


(defun c:qq ()
  
  (setq tap_size (getint "\n정수 입력: "))
  (setq start_point (getpoint "\n시작점 지정: "))
  (setq end_point (getpoint start_point "\n끝점 지정: " ))

  (setq theta (find_radian start_point end_point))
  
  

  
  (draw_counterbore_section start_point end_point tap_size theta)
)