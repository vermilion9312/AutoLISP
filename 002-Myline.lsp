;; 56p / 정말 쉬운 오토리습, 이제 나도 짜보자! 기초편

(defun c:myline()
    (command "line" "0, 0" "10, 10" "")
    (command "zoom" "e")
    (princ) ;; 캐드 명령창 빈 칸 처리
)