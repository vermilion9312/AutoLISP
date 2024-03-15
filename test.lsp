(defun c:qq (/ center_point i)
  (get_system_variables)
  (set_system_variables)
  
  (setq i (getint "\n시작 숫자 입력(기본값 1): "))
  ; (if (= i nil) (setq i 1))
  ; (while T
  ;   (setq center_point (getpoint "\n중심점 지정: "))
  ;   (draw_circle center_point)
  ;   (type_number center_point i)
  ;   (setq i (1+ i))
  ; )
  
  (return_system_variables)
  (princ)
)

(defun get_system_variables ()
  (setq default_cmdecho (getvar "cmdecho"))
)

(defun set_system_variables ()
  (setvar "cmdecho" 0)
)

(defun return_system_variables ()
  (setvar "cmdecho" default_cmdecho)
)

(defun draw_circle (point)
  (entmake (list (cons 0 "CIRCLE") (cons 10 point) (cons 40 3)))
)

(defun type_number (point number)
  (command "text" "mc" point 2.5 0 number)
)