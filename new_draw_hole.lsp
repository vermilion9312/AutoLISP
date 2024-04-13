(defun c:qq (/ hole_diameter counterbore_diameter center_point)

  (while (not (get_counterbore_standard (getint "\n탭 사이즈 입력: ")))  )
  
  (setq hole_diameter (car (get_counterbore_standard tap_size)))
  (setq counterbore_diameter (cadr (get_counterbore_standard tap_size)))

  (setq center_point (getpoint "\n 중심점 입력: "))
  (draw_circle center_point hole_diameter)
  (draw_circle center_point counterbore_diameter)
  
  (princ)
)


; 원을 그리는 함수
(defun draw_circle (center_point diameter)
  (entmake (list (cons 0 "CIRCLE") (cons 10 center_point) (cons 40 (* diameter 0.5))))
)

(defun get_counterbore_standard (tap_size)
  (cond
    ((or (= tap_size "M3") (= tap_size 3)) (list 3.4 6.5 3.3)) ; 순서대로 hole_diameter counterbore_diameter couterbore_depth
    ((or (= tap_size "M4") (= tap_size 4)) (list 4.5 8.0 4.4))
    ((or (= tap_size "M5") (= tap_size 5)) (list 5.5 9.5 5.4))
    ((or (= tap_size "M6") (= tap_size 6)) (list 6.6 11.0 6.5))
    ((or (= tap_size "M8") (= tap_size 8)) (list 9.0 14.0 8.6))
    
    ((or (= tap_size "M10") (= tap_size 10)) (list 11.0 17.5 10.8))
    ((or (= tap_size "M12") (= tap_size 12)) (list 14.0 20.0 13.0))
    ((or (= tap_size "M14") (= tap_size 14)) (list 16.0 23.0 15.2))
    ((or (= tap_size "M16") (= tap_size 16)) (list 18.0 26.0 17.5))
    ((or (= tap_size "M18") (= tap_size 18)) (list 20.0 29.0 19.5))
    
    ((or (= tap_size "M20") (= tap_size 20)) (list 22.0 32.0 21.5))
    ((or (= tap_size "M22") (= tap_size 22)) (list 24.0 35.0 23.5))
    ((or (= tap_size "M24") (= tap_size 24)) (list 26.0 39.0 25.5))
    ((or (= tap_size "M27") (= tap_size 27)) (list 30.0 43.0 29.0))
    ((or (= tap_size "M30") (= tap_size 30)) (list 33.0 48.0 32.0))
    
    ((or (= tap_size "M33") (= tap_size 33)) (list 36.0 54.0 35.0))
    
    (T nil)
  )
)