(defun c:myline()
    (setvar "cmdecho" 0)
    (command "-layer" "m" "1" "")

    (setq *P1 (getpoint "\n 1 위치점 입력: "))
    (setq *P2 (getpoint *P1 "\n 2 위치점 입력: "))
    ;; (getpoint [좌표] [메시지])
    ;; (setq <심볼 - 표현식> [심볼-표현식]...)
    ;; (setq a 10) 변수 a에 정수 10을 저장함
    ;; (setq b 1.5 c 4.8) 변수 a에 정수 10을 저장함
    ;; (setq d "Acad") 변수 d에 문자 "Acad"르
    (command "line" "0, 0" "10, 10" "")
    (command "chprop" (entlast) "" "c" 2 "")
    (command "zoom" "e")
    (princ)
)