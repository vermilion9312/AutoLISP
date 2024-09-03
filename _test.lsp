(defun C:qq (/ pt1 pt2 radius numRollers spacing angle delta x y i)
  ;; 기본 변수 설정
  (setq radius 2.0)          ;; 롤러의 반지름
  (setq numRollers 10)       ;; 롤러의 개수
  (setq spacing 10.0)        ;; 롤러 사이의 거리

  ;; 시작점 및 끝점 입력
  (setq pt1 (getpoint "\n첫 번째 점을 지정하세요: "))
  (setq pt2 (getpoint pt1 "\n두 번째 점을 지정하세요: "))

  ;; 두 점 사이의 각도 계산
  (setq angle (angle pt1 pt2))
  
  ;; 두 점 사이의 거리 계산
  (setq delta (distance pt1 pt2))

  ;; 롤러 체인의 반복적인 원과 선 그리기
  (setq i 0)
  (while (< i numRollers)
    ;; 롤러의 중심점 계산
    (setq x (+ (car pt1) (* i spacing (cos angle))))
    (setq y (+ (cadr pt1) (* i spacing (sin angle))))
    
    ;; 원(롤러) 그리기
    (command "CIRCLE" (list x y) radius)
    
    ;; 롤러 간의 선(체인 링크) 그리기
    (if (< i (1- numRollers))
      (command "LINE" (list x y) (list (+ x spacing (cos angle)) (+ y spacing (sin angle))) "")
    )
    
    ;; 인덱스 증가
    (setq i (1+ i))
  )
  (princ)
)
