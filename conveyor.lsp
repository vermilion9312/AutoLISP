(vl-load-com)

(defun c:qq ()
  (setq CONVEYOR_PITCH 76.47)
  (setq CIRCLE_RADIUS (/ 45 2.0))
  
  (setq polyline_entity_name (car (entsel))) ; 폴리 라인 도면요소이름 가져오기
  (setq polyline_object (entget polyline_entity_name)) ; 객체 데이터 가져오기ㅏ
  (setq circle_center_point (cdr (assoc 10 polyline_object))) ; dxf 10번 좌표 가져오기
  (setq first_point circle_center_point) ; 시작점 따로 저장
  (setq previous_center_point nil)
  
  (setq i 0)
  
  ; do-while 일단 첫 체인 먼저 그림
  (draw_chain)

  (setq boolean nil)
  (while (= boolean nil)
    (draw_chain)
    (setq boolean (is_in_circle circle_center_point first_point CONVEYOR_PITCH)) ; 그릴려는 중심점이 처음 시작하는 피치원 안에 있으면 종료
  )
  
  (setq last_pitch (distance first_point last_point))
  (princ "\n마지막 피치: ")
  (princ last_pitch)
  
  (entmake (list (cons 0 "TEXT") (cons 10 last_point) (cons 40 20.0) (cons 1 (rtos last_pitch 2 3)))) 

  (princ)
)

; 실수 좌표를 정수 좌표로 변환
(defun convert_to_integer_list (real_list) 
  (list (atoi (rtos (* (car real_list) 100) 2 0)) (atoi (rtos (* (cadr real_list) 100) 2 0)))
)

(defun convert_to_integer_number (real_number)
  (atoi (rtos real_number 2 0))
)

; 원 안에 존재하는지 여부 판단
(defun is_in_circle (input_point circle_center_point radius)
  (<= (distance input_point circle_center_point) radius)
)

; 원 그리기
(defun draw_circle (center_point radius)
  (entmake (list (cons 0 "CIRCLE") (cons 10 center_point) (cons 40 radius)))
)

; 체인 그리기
(defun draw_chain ()
  
    ; 처음에만 초록원 그리기
    (if (= i 0)
      (progn
        (entmake (list (cons 0 "CIRCLE") (cons 10 circle_center_point) (cons 40 CIRCLE_RADIUS) (cons 62 3)))
        (setq i (1+ i))
      )
      (draw_circle circle_center_point CIRCLE_RADIUS)
    )

    ; 피치원 그리기
    (draw_circle circle_center_point CONVEYOR_PITCH)
    
    ; 마지막으로 그린 피치원의 엔티티 네임 가져오기
    (setq circle_entity_name (entlast))
    
    ; vl요소로 변경
    (setq variant_polyline_object (vlax-ename->vla-object polyline_entity_name))
    (setq variant_circle_object (vlax-ename->vla-object circle_entity_name))
    
    ; 피치원과 폴리라인의 교차점을 배열로 리턴 받음
    (setq intersection_point_safearray (vla-IntersectWith variant_polyline_object variant_circle_object acExtendNone))
    
    ; 배열을 리스트로 변경
    (setq intersection_point_list (vlax-safearray->list (vlax-variant-value intersection_point_safearray)))
    
    ; 교차점 좌표
    (setq first_intersection_point (list (nth 0 intersection_point_list) (nth 1 intersection_point_list)))
    (setq second_intersection_point (list (nth 3 intersection_point_list) (nth 4 intersection_point_list)))

    ; 다음 원을 그리기 위한 판단
    (setq last_point circle_center_point)
    (if (not (equal previous_center_point (convert_to_integer_list first_intersection_point)))
      (progn
        (setq previous_center_point (convert_to_integer_list circle_center_point))
        (setq circle_center_point first_intersection_point)
      )
      (progn
        (setq previous_center_point (convert_to_integer_list circle_center_point))
        (setq circle_center_point second_intersection_point)
      )
      
    )
  
  ; 피치원 삭제
  (entdel (entlast))
)