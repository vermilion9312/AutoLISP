(defun c:qq (/ past_cmdecho bool tap_size drill_radius counterbore_radius center_point)
    (setq past_cmdecho (getvar "cmdecho"))
    (setvar "cmdecho" 0)

    (setq bool nil)
    (while (not bool)
      (setq tap_size (getint "\n탭 사이즈를 입력하세요: "))
      (setq bool (get_counterbore_size tap_size))
    )

    (setq drill_radius (/ (car (get_counterbore_size tap_size)) 2))
    (setq counterbore_radius (/ (cadr (get_counterbore_size tap_size)) 2))
  
    (setq bool nil)
    (while (not bool)
      (setq center_point (getpoint "\n중심점을 입력하세요: "))
      (setq bool center_point)
    )
  
    (draw_two_circles center_point drill_radius counterbore_radius)

    (setvar "cmdecho" past_cmdecho)
    (princ)
)

(defun draw_two_circles (center_point first_radius second_radius)
    (entmake (list (cons 0 "CIRCLE") (cons 10 center_point) (cons 40 first_radius)))
    (entmake (list (cons 0 "CIRCLE") (cons 10 center_point) (cons 40 second_radius)))
)

(defun get_counterbore_size (tap_size)
  (cond
    ((= tap_size 3) (list 3.4 6.5 3.3))
    ((= tap_size 4) (list 4.5 8.0 4.4))
    ((= tap_size 5) (list 5.5 9.5 5.4))
    ((= tap_size 6) (list 6.6 11.0 6.5))
    ((= tap_size 8) (list 9.0 14.0 8.6))
    
    ((= tap_size 10) (list 11.0 17.5 10.8))
    ((= tap_size 12) (list 14.0 20.0 13.0))
    ((= tap_size 14) (list 16.0 23.0 15.2))
    ((= tap_size 16) (list 18.0 26.0 17.5))
    ((= tap_size 18) (list 20.0 29.0 19.5))
    
    ((= tap_size 20) (list 22.0 32.0 21.5))
    ((= tap_size 22) (list 24.0 35.0 23.5))
    ((= tap_size 24) (list 26.0 39.0 25.5))
    ((= tap_size 27) (list 30.0 43.0 29.0))
    ((= tap_size 30) (list 33.0 48.0 32.0))
    
    ((= tap_size 33) (list 36.0 54.0 35.0))
    
    (T nil)
  )
)

()