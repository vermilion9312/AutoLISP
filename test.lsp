(defun c:qq (/ center_point i global_default_cmdecho)
  (get_system_variables)
  (set_system_variables)
  
  (setq text_filter_list (list (cons 0 "text") (cons 1 "~*[a-A-z-Z]*")))
  (setq text_selection_set (ssget text_filter_list))
  (princ (sslength text_selection_set))
  
  (princ "\n제거 영역 선택: ")
  (setq selection_set_to_remove (ssget text_filter_list))
  
  (setq i 0)
  (while (< i (sslength selection_set_to_remove))
    (setq entity_name (ssname selection_set_to_remove i))
    (ssdel entity_name text_selection_set)
    (setq i (1+ i))
  )
  (princ (sslength text_selection_set))
  
  ;;================================================================
  (setq ss (ssget)) ; 사용자로부터 선택 집합을 받음
  (setq obj_list '()) ; 정렬할 객체를 담을 리스트

  ; 선택 집합에 속한 객체를 반복하여 리스트에 추가
  (if ss
    (progn
      (setq i 0)
      (while (< i (sslength ss))
        (setq obj (entget (ssname ss i)))
        (setq obj_list (cons obj obj_list))
        (setq i (1+ i))
      )
    )
  )

  ; Z 좌표 값을 기준으로 객체를 정렬
  (setq sorted_list (vl-sort obj_list (function (lambda (a b) (< (cdr (assoc 10 a)) (cdr (assoc 10 b)))))))
  
  ; 정렬된 객체를 화면에 표시
  (foreach obj sorted_list
    (entmake obj)
  )
  (princ)
)

  ;;================================================================
  

  ; (foreach entity (ssnamex selection_set_to_remove)
  ;   (setq entity_name (cadr entity))
  ;   (princ entity_name)
  ;   ; (ssdel entity_name text_selection_set)
  ; )
  
  ; (princ (sslength text_selection_set))
  ; (setq i (getint "\n시작 숫자 입력(기본값 1): "))
  ; (if (= i nil) (setq i 1))
  ; (while T
  ;   (setq center_point (getpoint "\n중심점 지정: "))
  ;   (draw_circle center_point)
  ;   (type_number center_point i)
  ;   (setq i (1+ i))
  ; )
  
  (restore_system_variables)
  (princ)
)

(defun get_system_variables ()
  (setq global_default_cmdecho (getvar "cmdecho"))
)

(defun set_system_variables ()
  (setvar "cmdecho" 0)
)

(defun restore_system_variables ()
  (setvar "cmdecho" global_default_cmdecho)
)

(defun draw_circle (point)
  (entmake (list (cons 0 "CIRCLE") (cons 10 point) (cons 40 3)))
)

(defun type_number (point number)
  (command "text" "mc" point 2.5 0 number)
)

(defun *ERROR* (message)
  (restore_system_variables)
  
  (princ "\n오류: ")
  (princ message)
)