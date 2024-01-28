; 카운터 보어 규격
(defun counterBoreSpec (tapSize)
  (cond
    ((= tapSize 3) (list 3.4 6.5 3.3))
    ((= tapSize 4) (list 4.5 8 4.4))
    ((= tapSize 5) (list 5.5 9.5 5.4))
    ((= tapSize 6) (list 6.6 11 6.5))
    ((= tapSize 8) (list 9 14 8.6))
    ((= tapSize 10) (list 11 17.5 10.8))
    ((= tapSize 12) (list 14 20 13))
    ((= tapSize 14) (list 16 23 15.2))
    ((= tapSize 16) (list 18 26 17.5))
    ((= tapSize 18) (list 20 29 19.5))
    ((= tapSize 20) (list 22 32 21.5))
    ((= tapSize 22) (list 24 35 23.5))
    ((= tapSize 24) (list 26 39 25.5))
    ((= tapSize 27) (list 30 43 29))
    ((= tapSize 30) (list 33 48 32))
    ((= tapSize 33) (list 36 54 35))
  )
)

; 회전 변환 행렬
(defun rotationMatrix (ang coordinate)
  (setq x (car coordinate))
  (setq y (cadr coordinate))
  (setq returnX (- (* (cos ang) x) (* (sin ang) y)))
  (setq returnY (+ (* (sin ang) x) (* (cos ang) y)))
  (list returnX returnY)
)

; 평면도 만들기
(defun makeTopView (centerPoint drillDia counterBoreDia)
  (entmake (list (cons 0 "CIRCLE") (cons 10 centerPoint) (cons 40 (/ drillDia 2))))
  (entmake (list (cons 0 "CIRCLE") (cons 10 centerPoint) (cons 40 (/ counterBoreDia 2))))
)

; 단면도 만들기
(defun makeSectionView (startPoint endPoint drillDia counterBoreDia counterBoreDepth)
  ; 시작점과 끝점 사이의 거리
  (setq dis (distance startPoint endPoint))
  
  ; 시작점과 끝점의 x, y 좌표
  (setq startPointX (car startPoint))
  (setq startPointY (cadr startPoint))
  (setq endPointX (car endPoint))
  (setq endPointY (cadr endPoint))
  
  ; 평행 이동 이전에 값 저장
  (setq pastStartPointX startPointX)
  (setq pastStartPointY startPointY)
  
  ; 시작점 기준 0, 0 좌표로 평행이동
  (setq startPointX (- startPointX pastStartPointX))
  (setq startPointY (- startPointY pastStartPointY))
  (setq endPointX (- endPointX pastStartPointX))
  (setq endPointY (- endPointY pastStartPointY))
  
  ; 각도 구하기
  (setq ang (atan (/ endPointY endPointX)))
  (princ ang)
  
  ; 각도가 0 라디안일 때 카운터보어 좌표
  (setq x1 startPointX)
  (setq x2 (+ startPointX counterBoreDepth))
  (setq x3 (+ startPointX dis))
  
  (setq y1 (- startPointY (/ counterBoreDia 2)))
  (setq y2 (- startPointY (/ drillDia 2)))
  (setq y3 (+ startPointY (/ drillDia 2)))
  (setq y4 (+ startPointY (/ counterBoreDia 2)))
  
  (setq crd1 (list x1 y1))
  (setq crd2 (list x2 y1))
  (setq crd3 (list x2 y2))
  (setq crd4 (list x3 y2))
  (setq crd5 (list x3 y3))
  (setq crd6 (list x2 y3))
  (setq crd7 (list x2 y4))
  (setq crd8 (list x1 y4))

  (setq crd1 (rotationMatrix ang crd1))
  (setq crd2 (rotationMatrix ang crd2))
  (setq crd3 (rotationMatrix ang crd3))
  (setq crd4 (rotationMatrix ang crd4))
  (setq crd5 (rotationMatrix ang crd5))
  (setq crd6 (rotationMatrix ang crd6))
  (setq crd7 (rotationMatrix ang crd7))
  (setq crd8 (rotationMatrix ang crd8))

  ; (setq crd1 (list (+ (car crd1) pastStartPointX) (+ (cadr cr1) pastStartPointY)))
  ; (setq crd2 (list (+ (car crd2) pastStartPointX) (+ (cadr cr2) pastStartPointY)))
  ; (setq crd3 (list (+ (car crd3) pastStartPointX) (+ (cadr cr3) pastStartPointY)))
  ; (setq crd4 (list (+ (car crd4) pastStartPointX) (+ (cadr cr4) pastStartPointY)))
  ; (setq crd5 (list (+ (car crd5) pastStartPointX) (+ (cadr cr5) pastStartPointY)))
  ; (setq crd6 (list (+ (car crd6) pastStartPointX) (+ (cadr cr6) pastStartPointY)))
  ; (setq crd7 (list (+ (car crd7) pastStartPointX) (+ (cadr cr7) pastStartPointY)))
  ; (setq crd8 (list (+ (car crd8) pastStartPointX) (+ (cadr cr8) pastStartPointY)))

  
  (entmake (list (cons 0 "LINE") (cons 10 crd1) (cons 11 crd2)))
  (entmake (list (cons 0 "LINE") (cons 10 crd3) (cons 11 crd4)))
  (entmake (list (cons 0 "LINE") (cons 10 crd5) (cons 11 crd6)))
  (entmake (list (cons 0 "LINE") (cons 10 crd7) (cons 11 crd8)))
  (entmake (list (cons 0 "LINE") (cons 10 crd2) (cons 11 crd7)))
  
  
  ; (setq xDiffA (- startPointX endPointX))
  ; (setq yDiffA (- startPointY endPointY))
  
  ; (setq ang1 (if (= xDiff 0) 0 (atan (/ yDiff xDiff))))
  ; (setq ang2 (- (/ PI 2) ang1))
  
  ; (setq drillDiaX (* (cos ang2) (/ drillDia 2)))
  ; (setq drillDiaY (* (sin ang2) (/ drillDia 2)))
  ; (setq counterBoreDiaX (* (cos ang2) (/ counterBoreDia 2)))
  ; (setq counterBoreDiaY (* (sin ang2) (/ counterBoreDia 2)))
  ; (setq counterBoreDepthX (* (sin ang2) counterBoreDepth))
  ; (setq counterBoreDepthY (* (cos ang2) counterBoreDepth))
 
  ; (if (> startPointX endPointX)
  ;   (setq midPointX (- startPointX counterBoreDepthX))
  ;   (setq midPointX (+ startPointX counterBoreDepthX))
  ; )
  
  ; (if (> startPointY endPointY)  
  ;   (setq midPointY (- startPointY counterBoreDepthY))
  ;   (setq midPointY (+ startPointY counterBoreDepthY))
  ; )
 
  ; (setq x1 (- startPointX counterBoreDiaX))
  ; (setq x2 (- midPointX counterBoreDiaX))
  ; (setq x3 (- midPointX drillDiaX))
  ; (setq x4 (- endPointX drillDiaX))
  ; (setq x5 (+ endPointX drillDiaX))
  ; (setq x6 (+ midPointX drillDiaX))
  ; (setq x7 (+ midPointX counterBoreDiaX))
  ; (setq x8 (+ startPointX counterBoreDiaX))
  
  ; (setq y1 (- startPointY counterBoreDiaY))
  ; (setq y2 (- midPointY counterBoreDiaY))
  ; (setq y3 (- midPointY drillDiaY))
  ; (setq y4 (- endPointY drillDiaY))
  ; (setq y5 (+ endPointY drillDiaY))
  ; (setq y6 (+ midPointY drillDiaY))
  ; (setq y7 (+ midPointY counterBoreDiaY))
  ; (setq y8 (+ startPointY counterBoreDiaY))
  
  ; (if (> (/ yDiffA xDiffA) 0) (setq y1 (+ startPointY counterBoreDiaY)))
  ; (if (> (/ yDiffA xDiffA) 0) (setq y2 (+ midPointY counterBoreDiaY)))
  ; (if (> (/ yDiffA xDiffA) 0) (setq y3 (+ midPointY drillDiaY)))
  ; (if (> (/ yDiffA xDiffA) 0) (setq y4 (+ endPointY drillDiaY)))
  ; (if (> (/ yDiffA xDiffA) 0) (setq y5 (- endPointY drillDiaY)))
  ; (if (> (/ yDiffA xDiffA) 0) (setq y6 (- midPointY drillDiaY)))
  ; (if (> (/ yDiffA xDiffA) 0) (setq y7 (- midPointY counterBoreDiaY)))
  ; (if (> (/ yDiffA xDiffA) 0) (setq y8 (- startPointY counterBoreDiaY)))
  
  ; (setq y1 (+ startPointY counterBoreDiaY))
  ; (setq y2 (+ midPointY counterBoreDiaY))
  ; (setq y3 (+ midPointY drillDiaY))
  ; (setq y4 (+ endPointY drillDiaY))
  ; (setq y5 (- endPointY drillDiaY))
  ; (setq y6 (- midPointY drillDiaY))
  ; (setq y7 (- midPointY counterBoreDiaY))
  ; (setq y8 (- startPointY counterBoreDiaY))
  
  ; (entmake (list (cons 0 "LINE") (cons 10 (list x1 y1)) (cons 11 (list x2 y2))))
  ; (entmake (list (cons 0 "LINE") (cons 10 (list x3 y3)) (cons 11 (list x4 y4))))
  ; (entmake (list (cons 0 "LINE") (cons 10 (list x5 y5)) (cons 11 (list x6 y6))))
  ; (entmake (list (cons 0 "LINE") (cons 10 (list x7 y7)) (cons 11 (list x8 y8))))
  ; (entmake (list (cons 0 "LINE") (cons 10 (list x2 y2)) (cons 11 (list x7 y7))))
)

(defun c:66 ()
  
  (setq tapSize (getint "\n 탭 사이즈를 입력하세요: "))
  (setq drillDia (car (counterBoreSpec tapSize)))
  (setq counterBoreDia (cadr (counterBoreSpec tapSize)))
  (setq counterBoreDepth (caddr (counterBoreSpec tapSize)))
  
  (setq view (getstring "\n 카운터보어 뷰 선택 [T(평면도)/S(단면도)]: "))
  
  (while (and (/= view "t") (/= view "T") (/= view "s") (/= view "S"))
    (princ "\n 옵션 키워드를 입력하세요")
    (setq view (getstring "\n 카운터보어 뷰 선택 [T(평면도)/S(단면도)]: "))
  )
  
  
  (if (or (= view "t") (= view "T"))
    (makeTopView (getpoint "\n 중심점을 입력하세요") drillDia counterBoreDia)
  )
  
  (setq startPoint (getpoint "\n 삽입면을 클릭하세요"))
  (setq endPoint (getpoint startPoint "\n 관통면을 클릭하세요"))
  
  (if (or (= view "s") (= view "S"))
    (makeSectionView startPoint endPoint drillDia counterBoreDia counterBoreDepth)
  )
)