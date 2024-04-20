; AutoLISP 확장 기능 불러오기
(vl-load-com)

(defun c:qq (/ polyline_entity_name polyline_entity_data polyline_entity_type
             previous_center_point circle_center_point 
             polyline_vla_object cicle_vla_object
             once)
  
  ; 시스템 변수 조작
  (setq default_cmdecho (getvar 'CMDECHO))
  (setvar 'CMDECHO 0)
  
  ; 컨베이어 관련 상수
  (setq CONVEYOR_PITCH 76.47) ; 컨베이어 피치
  (setq CIRCLE_RADIUS (* 45.0 0.5)) ; 그릴 원의 반지름
  
  ; 초록원을 한 번만 그리기 위한 boolean 변수
  (setq once T)
  
  ; 폴리선만 선택하도록 예외 처리
  (while (not (= polyline_entity_type "LWPOLYLINE"))
    (setq polyline_entity_name (car (entsel "\n폴리선 선택: ")))
    (setq polyline_entity_data (entget polyline_entity_name))
    (setq polyline_entity_type (cdr (assoc 0 polyline_entity_data)))
  )
  
  ; 선택한 폴리선의 끝점 중 하나를 원의 중심점으로 정한다
  (setq circle_center_point (cdr (assoc 10 polyline_entity_data)))
  ; (setq vla_object (vlax-ename->vla-object entity_name))
  ; (setq coordinates (vlax-get vla_object 'COORDINATES))
  
  (while T
    (draw_conveyor)
  )

  ; 시스템 변수 복구
  (setvar 'CMDECHO default_cmdecho)
  
  (princ)
)

; 색깔 번호를 반환하는 함수
(defun get_color_number (color)
  (cond
    ((= color 'RED) 1)
    ((= color 'YELLOW) 2)
    ((= color 'GREEN) 3)
    ((= color 'CYAN) 4)
    ((= color 'BLUE) 5)
    ((= color 'MAGENTA) 6)
    ((= color 'WHITE) 7)
    (T nil)
  )
)

; 원을 그리는 함수
(defun draw_circle (center_point radius)
  (entmake (list (cons 0 "CIRCLE") (cons 10 center_point) (cons 40 radius)))
)

; 색깔 있는 원을 그리는 함수
(defun draw_colored_circle (center_point radius color)
  (entmake (list (cons 0 "CIRCLE") (cons 10 center_point) (cons 40 radius) (cons 62 color)))
)

; 두 엔티티 이름을 매개변수로 받아서 교차점을 리스트로 반환하는 함수
(defun get_intersection_point (entity_name1 entity_name2 / vla_object1 vla_object2 intersection_point_safearray)
  ; 엔티티 이름을 vla-object로 변환
  (setq vla_object1 (vlax-ename->vla-object entity_name1))
  (setq vla_object2 (vlax-ename->vla-object entity_name2))

  ; 두 vla-object에서 교차점을 배열로 리턴 받음
  (setq intersection_point_safearray (vla-IntersectWith vla_object1 vla_object2 acExtendNone))
    
  ; 배열을 리스트로 변경
  (vlax-safearray->list (vlax-variant-value intersection_point_safearray))
)

; 실수 좌표를 정수 좌표로 변환
(defun convert_to_integer_list (real_list) 
  (list (atoi (rtos (* (car real_list) 100) 2 0)) (atoi (rtos (* (cadr real_list) 100) 2 0)))
)

; 컨베이어 그리는 함수
(defun draw_conveyor (/ circle_entity_name intersection_point_list
                      first_intersection_point second_intersection_point)
  
  (if once
    ; 중심점에 초록색 원을 그린다
    (progn
      (draw_colored_circle circle_center_point CIRCLE_RADIUS (get_color_number 'GREEN))
      (setq once nil)
    )
    ; 중심점에 그냥 원을 그린다
    (progn
      (draw_circle circle_center_point CIRCLE_RADIUS)
    )
  )
  
  ; 중심점에 컨베이어 피치원을 그린다
  (draw_circle circle_center_point CONVEYOR_PITCH)
  (setq circle_entity_name (entlast))
  
  (setq intersection_point_list (get_intersection_point polyline_entity_name circle_entity_name))

  ; 교차점 좌표
  (setq first_intersection_point (list (nth 0 intersection_point_list) (nth 1 intersection_point_list)))
  (setq second_intersection_point (list (nth 3 intersection_point_list) (nth 4 intersection_point_list)))

  (princ first_intersection_point)
  ; 다음 원을 그리기 위한 판단
  ; (setq last_point circle_center_point)
  
  (if (not (= previous_center_point (convert_to_integer_list first_intersection_point))) ; 첫 번째 교차점이 이전 중심점과 같지 않으면
    ; 첫 번째 교차점이 원을 그릴 중심점이 된다
    (progn
      (setq previous_center_point (convert_to_integer_list circle_center_point))
      (setq circle_center_point first_intersection_point)
    )
    ; 첫 번째 교차점이 이전 중심점과 같으면, 두 번째 교차점이 원을 그릴 중심점이 된다
    (progn
      (setq previous_center_point (convert_to_integer_list circle_center_point))
      (setq circle_center_point second_intersection_point)
    )
  )
)

; (defun *error* (msg)
;   (princ "error: ")
;   (princ msg)
;  (princ)
; )



; input_point가 circle 안에 있으면 T, 아니면 nil을 반환하는 함수
; 선 위에 있는 input_point도 원 안에 있다고 친다.
; (defun is_in_circle (input_point circle_center_point circle_radius)
;   (<= (distance input_point circle_center_point) circle_radius)
; )

  
;   (setq first_point circle_center_point) ; 시작점 따로 저장
;   (setq previous_center_point nil)
  
;   (setq i 0)
  
;   ; do-while 일단 첫 체인 먼저 그림
;   (draw_chain)
;   (setq circle_count 1)

;   (setq is_true T)
;   (while is_true
;     (draw_chain)
;     (setq circle_count (1+ circle_count))
;     (setq is_true (not (is_in_circle circle_center_point first_point CONVEYOR_PITCH))) ; 그릴려는 중심점이 처음 시작하는 피치원 안에 있으면 종료
;   )
  
;   (setq last_pitch (distance first_point last_point))
;   (princ "\n마지막 피치: ")
;   (princ last_pitch)
;   (princ ", 체인 개수: ")
;   (princ circle_count)
  
;   (entmake (list (cons 0 "TEXT") (cons 10 last_point) (cons 40 20.0) (cons 1 (rtos last_pitch 2 3)))) 
;   (command "TEXT" "TL" last_point 20.0 0 circle_count)
  
;   (setvar "cmdecho" default_cmdecho)

;   (princ)
; )


; (defun convert_to_integer_number (real_number)
;   (atoi (rtos real_number 2 0))
; )

; ; 원 안에 존재하는지 여부 판단
; (defun is_in_circle (input_point circle_center_point radius)
;   (<= (distance input_point circle_center_point) radius)
; )


; ; 체인 그리기
; (defun draw_chain ()
  
;     ; 처음에만 초록원 그리기
;     (if (= i 0)
;       (progn
;         (draw_circle circle_center_point CIRCLE_RADIUS GREEN)
;         (setq i (1+ i))
;       )
;       (draw_circle circle_center_point CIRCLE_RADIUS WHITE)
;     )

;     ; 피치원 그리기
;     (draw_circle circle_center_point CONVEYOR_PITCH WHITE)
    
;     ; 마지막으로 그린 피치원의 엔티티 네임 가져오기
;     (setq circle_entity_name (entlast))
    
;     ; vl요소로 변경
;     (setq variant_polyline_object (vlax-ename->vla-object polyline_entity_name))
;     (setq variant_circle_object (vlax-ename->vla-object circle_entity_name))
    
;     ; 피치원과 폴리라인의 교차점을 배열로 리턴 받음
;     (setq intersection_point_safearray (vla-IntersectWith variant_polyline_object variant_circle_object acExtendNone))
    
;     ; 배열을 리스트로 변경
;     (setq intersection_point_list (vlax-safearray->list (vlax-variant-value intersection_point_safearray)))
    
;     ; 교차점 좌표
;     (setq first_intersection_point (list (nth 0 intersection_point_list) (nth 1 intersection_point_list)))
;     (setq second_intersection_point (list (nth 3 intersection_point_list) (nth 4 intersection_point_list)))

;     ; 다음 원을 그리기 위한 판단
;     (setq last_point circle_center_point)
;     (if (not (equal previous_center_point (convert_to_integer_list first_intersection_point)))
;       (progn
;         (setq previous_center_point (convert_to_integer_list circle_center_point))
;         (setq circle_center_point first_intersection_point)
;       )
;       (progn
;         (setq previous_center_point (convert_to_integer_list circle_center_point))
;         (setq circle_center_point second_intersection_point)
;       )
      
;     )
  
;   ; 피치원 삭제
;   (entdel (entlast))
; )

; (defun c:qq ()
;   (setq polyline_entity_name (car (entsel)))
  
;   (setq variant_polyline_object (vlax-ename->vla-object polyline_entity_name))
  
  
;   (setq coordinates (vlax-get variant_polyline_object "coordinates"))
  
;   (vlax-put variant_polyline_object "coordinates" (list 0.0 10.0 10.0 10.0 10.0 0.0 0.0 0.0))
  
  
;   (princ)
; )