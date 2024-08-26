(defun c:77 ()
  (vl-load-com)
  
  (setq default_cmdecho (getvar "CMDECHO"))
  (setvar "CMDECHO" 0)

  (setq default_osmode (getvar "OSMODE"))
  (setvar "OSMODE" 1)
  

  
  (setq entity_name (car (entsel "\n선택하셈: ")))
  (setq object (vlax-ename->vla-object entity_name))
  (setq bounding_box (vla-getboundingbox object 'min_point 'max_point))
  (setq lower_left_corner (vlax-safearray->list min_point))
  (setq upper_right_corner (vlax-safearray->list max_point))
  
  (plot_sheet)
  
  ; (setq filter (list (cons 0 "LWPOLYLINE,INSERT")))
  ; (ssget filter)
  
  (setvar "CMDECHO" default_cmdecho)
  (setvar "OSMODE" default_osmode)
  
  (princ)
)

(defun plot_sheet ()
  (setq detailed_plot_configuration "Yes")
  (setq layout_name "Model")
  (setq output_device_name "Samsung CLX-6240 Series PS")
  (setq paper_size "A4")
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

  ; (setq filter (list (cons -4 "<AND")
  ;                    (cons 0 "LWPOLYLINE")
  ;                    (cons -4 "<NOT")
  ;                    (cons 62 7)
  ;                    (cons -4 "NOT>")
  ;                    (cons "AND>")
  ;              ))
  ; (ssget filter)


; (defun plot ()

;   (setvar "osmode" 1)

;   (setvar "cmdecho" 0)


;   (setq firstPoint (getpoint "\n윈도우 왼쪽 위 좌표를 입력하십시오"))
;   (setq secondPoint (getcorner firstPoint "\n윈도우 오른쪽 아래 좌표를 입력하십시오"))


;   (command "-PLOT" "yes" "model" "FF K505p for ApeosPort C3570" "A4(210x297mm)" "millimeter" "landscape" "no" "window"
;   firstPoint
;   secondPoint
;   "fit" "center" "yes" "monochrome.ctb" "yes" "a" "no" "no" "yes")


; )