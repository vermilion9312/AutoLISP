; AutoLISP 확장 기능 불러오기
(defun load_extension ()
  (vl-load-com)
  (setq autocad_application_object (vlax-get-acad-object))
  (setq active_document (vla-get-activedocument autocad_application_object))
  (setq model_space_collection (vla-get-modelspace active_document))
)

; input_point가 circle 안에 있으면 T, 아니면 nil을 반환한다.
; 원을 그리는 선 위에 있는 input_point도 원 안에 있다.
(defun is_in_circle (input_point circle_center_point  circle_radius)
  (<= (distance input_point circle_center_point) circle_radius)
)

; color 상수
(setq RED 1)
(setq YELLOW 2)
(setq GREEN 3)
(setq CYAN 4)
(setq BLUE 5)
(setq MAGENTA 6)
(setq WHITE 7)

; conveyor 상수
(setq CONVEYOR_PITCH 76.47)
(setq CIRCLE_RADIUS (/ 45 2.0))

; 선을 그리는 함수
(defun draw_line (start_point end_polint)
  (entmake (list (cons 0 "LINE") (cons 10 start_point) (cons 11 end_point)))
)

; 색깔 있는 선을 그리는 함수
(defun draw_colored_line (start_point end_polint color)
  (entmake (list (cons 0 "LINE") (cons 10 start_point) (cons 11 end_point) (cons 62 color)))
)

; center2 선을 그리는 함수
(defun draw_center2_line (start_point end_point line_type_scale)
  (entmake (list (cons 0 "LINE") (cons 6 "CENTER2") (cons 10 crd5) (cons 11 crd6) (cons 48 line_type_scale) (cons 62 1)))
)

; 원을 그리는 함수
(defun draw_circle (center_point diameter)
  (entmake (list (cons 0 "CIRCLE") (cons 10 center_point) (cons 40 (* diameter 0.5))))
)
; 색깔 있는 원을 그리는 함수
(defun draw_colored_circle (center_point diameter color)
  (entmake (list (cons 0 "CIRCLE") (cons 10 center_point) (cons 40 (* diameter 0.5)) (cons 62 color)))
)


; datum_point를 기준으로 point를 radian 각도만큼 회전시키는 함수
; 행렬 일차변환 중 회전변환
(defun rotate_point (datum_point radian point / x y a b return_x return_y)
  (setq a (car datum_point))
  (setq b (cadr datum_point))
  (setq x (car point))
  (setq y (cadr point))
  
  (setq return_x (+ (- (* (- x a) (cos radian)) (* (- y b) (sin radian))) a))
  (setq return_y (+ (+ (* (- x a) (sin radian)) (* (- y b) (cos radian))) b))
  
  (list return_x return_y)
)

; 탄젠트 함수
(defun tan (radian)
  (/ (sin radian) (cos radian))
)

; 카운터 보어 규격 가져오는 함수
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

(defun draw_center_mark (circle_center_point circle_diameter)
  
  (setq pointX (car circle_center_point))
  (setq pointY (cadr circle_center_point))

  (setq circle_diameter (* circle_diameter (CONSTANT "CENTER_LINE_SCALE")))

  (setq crd1 (list (- pointX (* circle_diameter 0.5)) pointY))
  (setq crd2 (list (+ pointX (* circle_diameter 0.5)) pointY))
  (setq crd3 (list pointX (- pointY (* circle_diameter 0.5))))
  (setq crd4 (list pointX (+ pointY (* circle_diameter 0.5))))

  (entmake (list (cons 0 "LINE") (cons 10 crd1) (cons 11 crd2) (cons 62 1) (cons 6 "CENTER2") (cons 48 (* circle_diameter (CONSTANT "LINE_TYPE_SCALE")))))
  (entmake (list (cons 0 "LINE") (cons 10 crd3) (cons 11 crd4) (cons 62 1) (cons 6 "CENTER2") (cons 48 (* circle_diameter (CONSTANT "LINE_TYPE_SCALE")))))
)
