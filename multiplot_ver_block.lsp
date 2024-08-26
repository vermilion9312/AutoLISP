(defun c:77 ()
  (setq output_device_name "FF K505p for ApeosPort C3570") ; 프린터 이름
  (setq paper_size "A4(210x297mm)") ; 용지 크기
  
  (vl-load-com)
  
  (setq default_cmdecho (getvar "CMDECHO"))
  (setvar "CMDECHO" 0)

  (setq filter (list (cons 0 "INSERT,LWPOLYLINE")))
  (setq selection_set (ssget filter))
  
  (setq my_list '())
  (setq i 0)
  (repeat (sslength selection_set)
    (setq entity_name (ssname selection_set i))
    
    (setq vla_object (vlax-ename->vla-object entity_name))
    (setq bounding_box (vla-getboundingbox vla_object 'min_point 'max_point))
    (setq lower_left_corner (vlax-safearray->list min_point))
    (setq upper_right_corner (vlax-safearray->list max_point))

    (setq x1 (car lower_left_corner))
    (setq x2 (car upper_right_corner))
    (setq y1 (cadr lower_left_corner))
    (setq y2 (cadr upper_right_corner))
    
    (setq sheet_length (- x2 x1))
    (setq sheet_width (- y2 y1))
    (if (= sheet_width 0) (setq sheet_width 1))

    (setq sheet_ratio (/ sheet_length sheet_width))
    (setq sheet_ratio (fix (* sheet_ratio 1000)))
    
    (if (or (= sheet_ratio 1408) (= sheet_ratio 1428) (= sheet_ratio 1438))
      (progn
        (setq some_list (list (car lower_left_corner) (cadr lower_left_corner) (list lower_left_corner upper_right_corner)))
        (setq my_list (cons some_list my_list))
      )
    )
    
    (setq i (1+ i))
  )
  
(setq sorted_list (vl-sort my_list '(lambda (a b) 
(cond
    ((< (cadr a) (cadr b)) T)   ; 두 번째 요소를 기준으로 오름차순 비교
    ((> (cadr a) (cadr b)) nil)
    ((< (car a) (car b)) T)     ; 두 번째 요소가 같을 경우, 첫 번째 요소를 기준으로 오름차순 비교
    (T nil)))
  )
                             )
  
  ; (princ sorted_list)
  
  (setq i 0)
  (repeat (length sorted_list)
    (setq temp_list (nth i sorted_list))
    (setq temp_list (caddr temp_list))

    (setq lower_left_corner (car temp_list))
    (setq upper_right_corner (cadr temp_list))

    (plot_sheet)
    (entmake (list (cons 0 "LINE") (cons 10 lower_left_corner) (cons 11 upper_right_corner) (cons 62 1)))

    (setq i (1+ i))
  )
  
  
  (setvar "CMDECHO" default_cmdecho)
  
  (princ)
)

(defun plot_sheet ()
  (setq detailed_plot_configuration "Yes")
  (setq layout_name "Model")
  ; (setq output_device_name "Samsung CLX-6240 Series PS")
  ; (setq paper_size "A4")
  (setq paper_units "Millimeters")
  (setq drawing_orientation "Landscape")
  (setq plot_upside_down "No")
  (setq plot_area "Window")
  ; (setq lower_left_corner (getpoint "\n첫 번째 구석 지정: "))
  ; (setq upper_right_corner (getcorner lower_left_corner "\n반대 구석 지정: "))
  (setq plot_scale "Fit")
  (setq plot_offset "Center")
  (setq plot_style "Yes")
  (setq plot_style_table_name "monochrome.ctb")
  (setq plot_with_lineweights "Yes")
  (setq shade_plot_setting "As displayed")
  (setq plot_to_file "No")
  (setq is_page_setup_saved "No")
  (setq proceed_with_plot "Yes")

  (command "-PLOT"
          detailed_plot_configuration ; 상세한 플롯 구성
          layout_name                 ; 배치 이름
          output_device_name          ; 출력 장치 이름
          paper_size                  ; 용지 크기
          paper_units                 ; 용지 단위 입력
          drawing_orientation         ; 용지 방향
          plot_upside_down            ; 위 아래를 뒤집어 플롯?
          plot_area                   ; 플롯 영역
          lower_left_corner           ; 윈도우 왼쪽 아래
          upper_right_corner          ; 윈도우 오른쪽 위
          plot_scale                  ; 플롯 축척
          plot_offset                 ; 플롯 간격 띄우기
          plot_style                  ; 플롯 스타일
          plot_style_table_name       ; 플롯 테이블 이름
          plot_with_lineweights       ; 선 가중치로 플롯
          shade_plot_setting          ; 음역 플롯 설정 입력
          plot_to_file                ; 플롯 출력을 파일로
          is_page_setup_saved         ; 페이지 설정 저장
          proceed_with_plot           ; 플롯 진행
  )
)


; ((-10753.0 -14948.0 ((-10753.0 -14948.0 0.0) (5646.96 -3300.94 1.3734e-56)))
;  (9334.6 -14948.0 ((9334.6 -14948.0 0.0) (25734.6 -3300.94 1.3734e-56)))
;  (25984.6 -14864.5 ((25984.6 -14864.5 0.0) (34184.6 -9040.94 6.86699e-57)))
;  (5896.96 -14780.9 ((5896.96 -14780.9 0.0) (8334.6 -13086.0 0.0)))
;  (5896.96 -12880.9 ((5896.96 -12880.9 0.0) (8334.6 -11186.0 0.0)))
;  (5896.96 -10980.9 ((5896.96 -10980.9 0.0) (8334.6 -9285.96 0.0))))

