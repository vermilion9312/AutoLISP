;; c:명령어
;; s::startup 시작하면 자동실행함수
(defun c:myline()
    (command "line" "0, 0" "10, 10" "")
)