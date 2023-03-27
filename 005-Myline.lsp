;; 68p / 정말 쉬운 오토리습, 이제 나도 짜보자! 기초편

(defun c:myline()
    (setvar "cmdecho" 0)
    (command "-layer" "m" "1" "")

    (setq *P1 (getpoint "\n Click a point: "))
    (setq *P2 (getpoint *P1 "\n Click the other point: "))
    ;; (getpoint [좌표] [메시지])
    ;; (setq <심볼 - 표현식> [심볼-표현식]...)
    ;; (setq a 10) 변수 a에 정수 10을 저장함
    ;; (setq b 1.5 c 4.8) 변수 a에 정수 10을 저장함
    ;; (setq d "Acad") 변수 d에 문자 "Acad"를 저장함
    ;; (setq e d) 변수 e에 변수 d를 저장함
    ;; (setq f '(0 0)) 변수 f에 좌표 (0, 0)을 저장함
    ;; (setq g (F:Sub_Draw_Line))
    ;; 변수 g에 사용자가 임의로 만든 서브함수
    ;; (F:Sub_Draw_Line)를 실행하고 나오는 결과 값을 저장함
    ;; (setq h nil) 변수 h에 아무것도 없는 빈 값(nil)을 저장함

    (command "line" *P1 *P2 "")
    (command "chprop" (entlast) "" "c" 2 "")
    (command "zoom" "e")
    (princ)
)