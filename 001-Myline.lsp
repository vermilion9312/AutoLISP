;; 42p / 정말 쉬운 오토리습, 이제 나도 짜보자! 기초편

;; c:명령어
;; s::startup 시작하면 자동실행함수
(defun c:myline()
    (command "line" "0, 0" "10, 10" "")
)