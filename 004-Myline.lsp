;; 60p / 정말 쉬운 오토리습, 이제 나도 짜보자! 기초편

(defun c:myline()
    (setvar "cmdecho" 0)
    ;; "cmdecho" 설정값을 0으로 만들고 출력 결과를 보이지 않게 함

    (command "-layer" "m" "1" "")
    ;; 레이어 "1" 생성

    (command "line" "0, 0" "10, 10" "")
    ;; line 명령어로 선을 작도하는 작업 진행

    (command "chprop" (entlast) "" "c" 2 "")
    ;; 방금 생성한 라인 개체의 색상을 2번 노란색으로 변경
    ;; (entlast): 마지막 객체 선택

    (command "zoom" "e")
    ;; zoom -> e 명령으로 화면에 표시

    (princ)
    ;; 함수로 깔끔하게 코드 종결
)