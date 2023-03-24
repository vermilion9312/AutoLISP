(defun c:myline()

    (setvar "cmdecho" 0)
    ;; setvar: 캐드의 내부 시스템 설정 값을 다루는 함수\
    ;; (setvar <시스템변수> <설정값>)
    ;; (setvar "cmdecho" 0): 진행과정 미출력
    ;; (setvar "cmdecho" 1): 진행과정 출력

    ;; (setvar "osmode" 0): 오스냅 전부 해제하기
    ;; (setvar "filedia" 0): 파일 대화상자 나타내지 않기
    ;; (setvar "cmddia" 0): 일부 명령어 대화상자 나타내지 않기
    ;; 위의 코드는 다음과 같이 쓸 수도 있다
    ;; (setvar 'osmode 0)
    ;; (setvar 'filedia 0)
    ;; (setvar 'cmddia 0)

    ;; 캐드 명령창에 setvar 명령을 입력하고
    ;; 변경할 변수를 묻는 과정에서 "?"를 입력하고
    ;; 변수의 리스트를 입력하는 부분에서 "*"를 입력하면
    ;; 현재 캐드 버전의 전체 시스템 변수명들을 볼 수 있다
    (command "line" "0, 0" "10, 10" "")
    (command "zoom" "e")

    (princ)

)