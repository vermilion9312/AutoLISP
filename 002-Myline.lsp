(defun c:myline()
    (command "line" "0, 0" "10, 10" "")
    (command "zoom" "e")
    (princ) ;; 캐드 명령창 빈 칸 처리
)