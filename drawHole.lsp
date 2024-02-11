; 메인 함수
(defun c:59 (/ returnArr returnView returnHole returnTapSize returnCenterLine returnSlot
             centerPoint startPoint endPoint
             tapSize drillDia counterBoreDia tapDia counterBoreDepth counterSinkDepth)
  
  (loadCenter2) 
  (loadDialog)
  
  (if (= returnArr nil) (setq returnArr "single"))
  (if (= returnView nil) (setq returnView "topView"))
  (if (= returnHole nil) (setq returnHole "tap"))
  (if (= returnTapSize nil) (setq returnTapSize "0"))
  (if (= returnCenterLine nil) (setq returnCenterLine "1"))
  (if (= returnSlot nil) (setq returnSlot "0"))
  
  (setq tapSize (nth (atoi returnTapSize) (tapSizeList)))
  
  (setq drillDia (car (counterBoreSpec tapSize)))
  (setq counterBoreDia (cadr (counterBoreSpec tapSize)))
  (setq counterBoreDepth (caddr (counterBoreSpec tapSize)))
  (setq counterSinkDepth (cadr (counterSinkSpec tapSize)))
  (setq counterSinkRadian (caddr (counterSinkSpec tapSize)))
  
  (if (= returnHole "tap")
    (progn
      (setq drillDia (cadr (car (tapSpec tapSize))))
      (setq tapDia (car (car (tapSpec tapSize))))
    )
  )

  (cond
    ((and (= returnArr "single") (= returnView "topView") (= returnSlot "0")) (setq centerPoint (getpoint "\n삽입점 지정:")))
    ((and (= returnArr "single") (= returnView "topView") (= returnSlot "1")) (progn (setq startPoint (getpoint "\n첫 번째 점 지정:")) (setq endPoint (getpoint startPoint "\n다음 점 지정:"))))
    ((and (= returnArr "single") (= returnView "sectionView")) (progn (setq startPoint (getpoint "\n첫 번째 점 지정:")) (setq endPoint (getpoint startPoint "\n다음 점 지정:"))))
    ((= returnArr "multiple") (setq selectionSet (ssget)))
  )
  
  (cond
    ((and (= returnHole "drillHole") (= returnView "topView") (= returnSlot "1")) (drawDrillHoleTopViewSlot startPoint endPoint drillDia (atoi returnCenterLine)))
    ((and (= returnHole "drillHole") (= returnView "topView")) (drawDrillHoleTopView centerPoint drillDia (atoi returnCenterLine)))
    ((and (= returnHole "drillHole") (= returnView "sectionView")) (drawDrillHoleSectionView startPoint endPoint drillDia (atoi returnCenterLine)))
    
    ((and (= returnHole "counterBore") (= returnView "topView") (= returnSlot "1")) (drawCounterBoreTopViewSlot startPoint endPoint drillDia counterBoreDia (atoi returnCenterLine)))
    ((and (= returnHole "counterBore") (= returnView "topView")) (drawCounterBoreTopView centerPoint drillDia counterBoreDia (atoi returnCenterLine)))
    ((and (= returnHole "counterBore") (= returnView "sectionView")) (drawCounterBoreSectionView startPoint endPoint drillDia counterBoreDia counterBoreDepth (atoi returnCenterLine)))
    
    ((and (= returnHole "counterSink") (= returnView "topView")) (drawCounterSinkTopView centerPoint drillDia counterSinkDepth counterSinkRadian (atoi returnCenterLine)))
    
    ((and (= returnHole "tap") (= returnView "topView")) (drawTapTopView centerPoint drillDia tapDia (atoi returnCenterLine)))
  )

  (princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 선종류 CENTER2 불러오는 함수
(defun loadCenter2 ()
  (if (= (tblsearch "ltype" "CENTER2") nil)
    (command "._-linetype" "load" "CENTER2" "" "")
  )
)

; 대화창 불러오는 함수
(defun loadDialog ()
   
  (setq dclId (load_dialog "holeDialog"))
  (if (not (new_dialog "holeDialog" dclId)) (exit))
  
  (action_tile "single" "(setq returnArr $key)")
  (action_tile "multiple" "(setq returnArr $key)")
  
  (action_tile "topView" "(setq returnView $key)")
  (action_tile "sectionView" "(setq returnView $key)")
  
  (action_tile "drillHole" "(setq returnHole $key)")
  (action_tile "tap" "(setq returnHole $key)")
  (action_tile "counterBore" "(setq returnHole $key)")
  (action_tile "counterSink" "(setq returnHole $key)")
  (action_tile "slot" "(setq returnHole $key)")
  
  (action_tile "tapSize" "(setq returnTapSize $value)")
  (action_tile "centerLine" "(setq returnCenterLine $value)")
  (action_tile "slot" "(setq returnSlot $value)")
  
  (start_list "tapSize")
  (mapcar 'add_list (tapSizeList))
  (end_list)
   
  (start_dialog)
  (unload_dialog dclId)
 )

; 축척 관련 상수
(defun CONSTANT (STRING)
  (cond
    ((= STRING "LINE_TYPE_SCALE") (setq RETURN 0.0262))
    ((= STRING "CENTER_LINE_SCALE") (setq RETURN 1.3))
    ((= STRING "CENTER_LINE_SCALE2") (setq RETURN (* 1.3 0.5)))
  )
  
  RETURN
)
; == 선종류 축척 ==
; 상한값: 0.0349
; 중간값: 0.0262
; 하한값: 0.0175

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ======================================================================== <기초 함수> ========================================================================
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun tan (radian)
 (setq return (/ (sin radian) (cos radian)))
  return
)

; 각도 구하기
(defun findRadian (startPoint endPoint)
  
  (setq startPointX (car startPoint))
  (setq startPointY (cadr startPoint))
  (setq endPointX (car endPoint))
  (setq endPointY (cadr endPoint))
  (setq xDiff (- endPointX startPointX))
  (setq yDiff (- endPointY startPointY))

  (if (/= xDiff 0) (setq radian (atan (/ yDiff xDiff))))
  (cond
    ((and (< xDiff 0) (> yDiff 0)) (setq radian (+ radian pi)))
    ((and (< xDiff 0) (< yDiff 0)) (setq radian (+ radian pi)))
    ((and (= yDiff 0) (< xDiff 0)) (setq radian (+ radian pi)))
    ((and (= xDiff 0) (> yDiff 0)) (setq radian (* pi 0.5)))
    ((and (= xDiff 0) (< yDiff 0)) (setq radian (* pi 1.5)))
  )
  
  radian
  
)

; 회전 변환 행렬
(defun rotateCoordinate (refCrd radian coordinate)
  (setq a (car refCrd))
  (setq b (cadr refCrd))
  (setq x (car coordinate))
  (setq y (cadr coordinate))
  (setq returnX (+ (- (* (- x a) (cos radian)) (* (- y b) (sin radian))) a))
  (setq returnY (+ (+ (* (- x a) (sin radian)) (* (- y b) (cos radian))) b))
  (list returnX returnY)
)

; 중심선 그리기
(defun drawCenterLine (point diameter)
  
  (setq pointX (car point))
  (setq pointY (cadr point))

  (setq diameter (* diameter (CONSTANT "CENTER_LINE_SCALE")))

  (setq crd1 (list (- pointX (* diameter 0.5)) pointY))
  (setq crd2 (list (+ pointX (* diameter 0.5)) pointY))
  (setq crd3 (list pointX (- pointY (* diameter 0.5))))
  (setq crd4 (list pointX (+ pointY (* diameter 0.5))))

  (entmake (list (cons 0 "LINE") (cons 10 crd1) (cons 11 crd2) (cons 62 1) (cons 6 "CENTER2") (cons 48 (* diameter (CONSTANT "LINE_TYPE_SCALE")))))
  (entmake (list (cons 0 "LINE") (cons 10 crd3) (cons 11 crd4) (cons 62 1) (cons 6 "CENTER2") (cons 48 (* diameter (CONSTANT "LINE_TYPE_SCALE")))))
)

(defun drawCircle (diameter)
  (entmake (list (cons 0 "CIRCLE") (cons 10 centerPoint) (cons 40 (* diameter 0.5))))
)

(defun drawLine (startPoint endPoint)
  (entmake (list (cons 0 "LINE") (cons 10 startPoint) (cons 11 endPoint)))
)

(defun drawSlot)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ======================================================================== <구멍 규격> ========================================================================
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 탭 리스트
(defun tapSizeList ()
  (list "M3" "M4" "M5" "M6" "M8" "M10" "M12" "M14" "M16" "M18" "M20" "M22" "M24" "M27" "M30" "M33")
)

; 탭 규격
(defun tapSpec (tapSize)
  (cond
    ((= tapSize "M3") (list (list 3 2.4 3 6) (list 3 2.4 4.5 7.5) (list 3 2.4 5.5 8.5)))
    ((= tapSize "M4") (list (list 4 3.25 4 7) (list 4 3.25 6 9) (list 4 3.25 7 10)))
    ((= tapSize "M5") (list (list 5 4.1 5 8.5) (list 5 4.1 8 11.5) (list 5 4.1 9 12.5))) 
    ((= tapSize "M6") (list (list 6 5 6 10) (list 6 5 9 13) (list 6 5 11 15)))
    ((= tapSize "M8") (list (list 8 6.8 8 12) (list 8 6.8 12 16) (list 8 6.8 14 18)))
    
    ((= tapSize "M10") (list (list 10 8.5 10 14) (list 10 8.5 15 19) (list 10 8.5 18 22)))
    ((= tapSize "M12") (list (list 12 10.2 12 17) (list 12 10.2 17 22) (list 12 10.2 22 27)))
    ((= tapSize "M14") (list (list 14 12 14 19) (list 14 12 20 25) (list 14 12 25 30)))
    ((= tapSize "M16") (list (list 16 14 16 21) (list 16 14 22 27) (list 16 14 28 33)))
    ((= tapSize "M18") (list (list 18 15.5 18 24) (list 18 15.5 25 31) (list 18 15.5 33 39)))
    
    ((= tapSize "M20") (list (list 20 17.5 20 26) (list 20 17.5 27 33) (list 20 17.5 36 42)))
    ((= tapSize "M22") (list (list 22 19.5 22 29) (list 22 19.5 30 37) (list 22 19.5 40 47)))
    ((= tapSize "M24") (list (list 24 21 24 32) (list 24 21 32 40) (list 24 21 44 52)))
    ((= tapSize "M27") (list (list 27 24 27 36) (list 27 24 36 45) (list 27 24 48 57)))
    ((= tapSize "M30") (list (list 30 26.5 30 39) (list 30 26.5 40 49) (list 30 26.5 54 63)))
    
    ((= tapSize "M33") (list (list 33 29.5 33 43) (list 33 29.5 43 53) (list 33 29.5 60 70)))

    (t (setq returnValue T))
  )
)

; 카운터 보어 규격
(defun counterBoreSpec (tapSize)
  (cond
    ((= tapSize "M3") (list 3.4 6.5 3.3))
    ((= tapSize "M4") (list 4.5 8 4.4))
    ((= tapSize "M5") (list 5.5 9.5 5.4))
    ((= tapSize "M6") (list 6.6 11 6.5))
    ((= tapSize "M8") (list 9 14 8.6))
    
    ((= tapSize "M10") (list 11 17.5 10.8))
    ((= tapSize "M12") (list 14 20 13))
    ((= tapSize "M14") (list 16 23 15.2))
    ((= tapSize "M16") (list 18 26 17.5))
    ((= tapSize "M18") (list 20 29 19.5))
    
    ((= tapSize "M20") (list 22 32 21.5))
    ((= tapSize "M22") (list 24 35 23.5))
    ((= tapSize "M24") (list 26 39 25.5))
    ((= tapSize "M27") (list 30 43 29))
    ((= tapSize "M30") (list 33 48 32))
    
    ((= tapSize "M33") (list 36 54 35))
    
    (t (setq returnValue T))
  )
)

; 카운터 싱크 규격
(defun counterSinkSpec (tapSize)
  (cond
    ((= tapSize "M3") (list 3.4 1.75 (* PI 0.5)))
    ((= tapSize "M4") (list 4.5 2.3 (* PI 0.5)))
    ((= tapSize "M5") (list 5.5 2.8 (* PI 0.5)))
    ((= tapSize "M6") (list 6.6 3.4 (* PI 0.5)))
    ((= tapSize "M8") (list 9 4.4 (* PI 0.5)))
    ((= tapSize "M10") (list 11 5.5 (* PI 0.5)))
    ((= tapSize "M12") (list 14 6.5 (* PI 0.5)))
    ((= tapSize "M14") (list 16 7 (* PI 0.5)))
    ((= tapSize "M16") (list 18 7.5 (* PI 0.5)))
    ((= tapSize "M18") (list 20 8 (* PI 0.5)))
    ((= tapSize "M20") (list 22 8.5 (* PI 0.5)))
    ((= tapSize "M22") (list 24 13.2 (/ PI 3)))
    ((= tapSize "M24") (list 26 14 (/ PI 3)))
    ((= tapSize "M27") (list 30 14 (/ PI 3)))
    ((= tapSize "M30") (list 33 16.6 (/ PI 3)))
    ((= tapSize "M33") (list 36 16.6 (/ PI 3)))
    (t (setq returnValue T))
  )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; =========================================================================== <탭> ===========================================================================
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 탭 / 평면도
(defun drawTapTopView (centerPoint drillDia tapDia centerLine)
  (entmake (list (cons 0 "CIRCLE") (cons 10 centerPoint) (cons 40 (* drillDia 0.5))))
  (entmake (list (cons 0 "ARC") (cons 10 centerPoint) (cons 40 (* tapDia 0.5)) (cons 50 (* -100 (/ PI 180))) (cons 51 (* 170 (/ PI 180))) (cons 62 1)))
  
  (if (= centerLine 1) (drawCenterLine centerPoint tapDia))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ======================================================================= <드릴 구멍> ========================================================================
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 드릴 구멍 / 평면도
(defun drawDrillHoleTopView (centerPoint drillDia centerLine)
  (entmake (list (cons 0 "CIRCLE") (cons 10 centerPoint) (cons 40 (* drillDia 0.5))))
  (if (= centerLine 1) (drawCenterLine centerPoint drillDia))
)

; 드릴 구멍 / 평면도 / 장공
(defun drawDrillHoleTopViewSlot (startPoint endPoint drillDia centerLine)

  (setq dis (distance startPoint endPoint))
  
  (setq x0 (- (car startPoint) (* drillDia (CONSTANT "CENTER_LINE_SCALE2"))))
  (setq x1 (car startPoint))
  (setq x2 (+ (car startPoint) dis))
  (setq x4 (+ x2 (* drillDia (CONSTANT "CENTER_LINE_SCALE2"))))
  
  (setq y0 (- (cadr startPoint) (* drillDia (CONSTANT "CENTER_LINE_SCALE2"))))
  (setq y1 (- (cadr startPoint) (* drillDia 0.5)))
  (setq y2 (+ (cadr startPoint) (* drillDia 0.5)))
  (setq y4 (+ (cadr startPoint) (* drillDia (CONSTANT "CENTER_LINE_SCALE2"))))
  
  (setq crd1 (list x1 y1))
  (setq crd2 (list x2 y1))
  (setq crd3 (list x1 y2))
  (setq crd4 (list x2 y2))
  (setq crd5 (list x0 (cadr startPoint)))
  (setq crd6 (list x4 (cadr startPoint)))
  (setq crd7 (list x1 y0))
  (setq crd8 (list x1 y4))
  (setq crd9 (list x2 y0))
  (setq crd10 (list x2 y4))
  
  (setq radian (findRadian startPoint endPoint))
  
  (setq crd1 (rotateCoordinate startPoint radian crd1))
  (setq crd2 (rotateCoordinate startPoint radian crd2))
  (setq crd3 (rotateCoordinate startPoint radian crd3))
  (setq crd4 (rotateCoordinate startPoint radian crd4))
  (setq crd5 (rotateCoordinate startPoint radian crd5))
  (setq crd6 (rotateCoordinate startPoint radian crd6))
  (setq crd7 (rotateCoordinate startPoint radian crd7))
  (setq crd8 (rotateCoordinate startPoint radian crd8))
  (setq crd9 (rotateCoordinate startPoint radian crd9))
  (setq crd10 (rotateCoordinate startPoint radian crd10))
  
  (entmake (list (cons 0 "LINE") (cons 10 crd1) (cons 11 crd2)))
  (entmake (list (cons 0 "LINE") (cons 10 crd3) (cons 11 crd4)))
  (entmake (list (cons 0 "ARC") (cons 10 startPoint) (cons 40 (* drillDia 0.5)) (cons 50 (+ radian (/ PI 2))) (cons 51 (- radian (/ PI 2)))))
  (entmake (list (cons 0 "ARC") (cons 10 endPoint) (cons 40 (* drillDia 0.5)) (cons 50 (- radian (/ PI 2))) (cons 51 (+ radian (/ PI 2)))))
  
  (if (= centerLine 1)
    (progn
      (entmake (list (cons 0 "LINE") (cons 10 crd5) (cons 11 crd6) (cons 62 1) (cons 6 "CENTER2") (cons 48 (* drillDia (CONSTANT "LINE_TYPE_SCALE")))))
      (entmake (list (cons 0 "LINE") (cons 10 crd7) (cons 11 crd8) (cons 62 1) (cons 6 "CENTER2") (cons 48 (* drillDia (CONSTANT "LINE_TYPE_SCALE")))))
      (entmake (list (cons 0 "LINE") (cons 10 crd9) (cons 11 crd10) (cons 62 1) (cons 6 "CENTER2") (cons 48 (* drillDia (CONSTANT "LINE_TYPE_SCALE")))))
    )
  )
)

; 드릴 구멍 / 단면도
(defun drawDrillHoleSectionView (startPoint endPoint drillDia centerLine)
  
  (setq dis (distance startPoint endPoint))
  
  (setq x0 (- (car startPoint) (* dis 0.15)))
  (setq x1 (car startPoint))
  (setq x2 (+ (car startPoint) dis))
  (setq x4 (+ x2 (* dis 0.15)))
  
  (setq y1 (- (cadr startPoint) (* drillDia 0.5)))
  (setq y2 (+ (cadr startPoint) (* drillDia 0.5)))
  
  (setq crd1 (list x1 y1))
  (setq crd2 (list x2 y1))
  (setq crd3 (list x1 y2))
  (setq crd4 (list x2 y2))
  (setq crd5 (list x0 (cadr startPoint)))
  (setq crd6 (list x4 (cadr startPoint)))
  
  (setq radian (findRadian startPoint endPoint))
  
  (setq crd1 (rotateCoordinate startPoint radian crd1))
  (setq crd2 (rotateCoordinate startPoint radian crd2))
  (setq crd3 (rotateCoordinate startPoint radian crd3))
  (setq crd4 (rotateCoordinate startPoint radian crd4))
  (setq crd5 (rotateCoordinate startPoint radian crd5))
  (setq crd6 (rotateCoordinate startPoint radian crd6))
  
  (entmake (list (cons 0 "LINE") (cons 10 crd1) (cons 11 crd2)))
  (entmake (list (cons 0 "LINE") (cons 10 crd3) (cons 11 crd4)))
  (if (= centerLine 1)
    (entmake (list (cons 0 "LINE") (cons 10 crd5) (cons 11 crd6) (cons 62 1) (cons 6 "CENTER2") (cons 48 (* counterBoreDia (CONSTANT "LINE_TYPE_SCALE")))))
  )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ======================================================================= <카운터보어> ========================================================================
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 카운터보어 / 평면도
(defun drawCounterBoreTopView (centerPoint drillDia counterBoreDia centerLine)
  (entmake (list (cons 0 "CIRCLE") (cons 10 centerPoint) (cons 40 (* drillDia 0.5))))
  (entmake (list (cons 0 "CIRCLE") (cons 10 centerPoint) (cons 40 (* counterBoreDia 0.5))))
  
  (if (= centerLine 1) (drawCenterLine centerPoint counterBoreDia))
)

; 카운트 보어 / 평면도 / 장공
(defun drawCounterBoreTopViewSlot (startPoint endPoint drillDia counterBoreDia centerLine)
  (drawDrillHoleTopViewSlot startPoint endPoint drillDia 0)
  (drawDrillHoleTopViewSlot startPoint endPoint counterBoreDia centerLine)
)


; 카운터보어 / 단면도
(defun drawCounterBoreSectionView (startPoint endPoint drillDia counterBoreDia counterBoreDepth centerLine)
  ; 시작점과 끝점 사이의 거리
  (setq dis (distance startPoint endPoint)) 
  (setq radian (findRadian startPoint endPoint))
  
  ; 시작점과 끝점의 x, y 좌표
  (setq startPointX (car startPoint))
  (setq startPointY (cadr startPoint))
  (setq endPointX (car endPoint))
  (setq endPointY (cadr endPoint))
  
  ; 각도가 0일 때 카운터보어 좌표
  (setq x0 (- startPointX (* dis 0.15)))
  (setq x1 startPointX)
  (setq x2 (+ startPointX counterBoreDepth))
  (setq x3 (+ startPointX dis))
  (setq x4 (+ x3 (* dis 0.15)))
  
  (setq y1 (- startPointY (* counterBoreDia 0.5)))
  (setq y2 (- startPointY (* drillDia 0.5)))
  (setq y3 (+ startPointY (* drillDia 0.5)))
  (setq y4 (+ startPointY (* counterBoreDia 0.5)))
  
  ; (setq crdList (list (list x1 y1) (list x2 y1) (list x2 y2) (list x3 y2) (list x3 y3) (list x2 y3) (list x2 y4) (list x1 y4)))
  
  (setq crd1 (list x1 y1))
  (setq crd2 (list x2 y1))
  (setq crd3 (list x2 y2))
  (setq crd4 (list x3 y2))
  (setq crd5 (list x3 y3))
  (setq crd6 (list x2 y3))
  (setq crd7 (list x2 y4))
  (setq crd8 (list x1 y4))
  (setq crd9 (list x0 startPointY))
  (setq crd10 (list x4 startPointY))
  
  ; (setq crdList (list crd1 crd2 crd3 crd4 crd5 crd6 crd7 crd8 crd9 crd10))

  ; 회전 변환
  (setq crd1 (rotateCoordinate startPoint radian crd1))
  (setq crd2 (rotateCoordinate startPoint radian crd2))
  (setq crd3 (rotateCoordinate startPoint radian crd3))
  (setq crd4 (rotateCoordinate startPoint radian crd4))
  (setq crd5 (rotateCoordinate startPoint radian crd5))
  (setq crd6 (rotateCoordinate startPoint radian crd6))
  (setq crd7 (rotateCoordinate startPoint radian crd7))
  (setq crd8 (rotateCoordinate startPoint radian crd8))
  (setq crd9 (rotateCoordinate startPoint radian crd9))
  (setq crd10 (rotateCoordinate startPoint radian crd10))
  
  ; 라인 그리기
  (entmake (list (cons 0 "LINE") (cons 10 crd1) (cons 11 crd2)))
  (entmake (list (cons 0 "LINE") (cons 10 crd3) (cons 11 crd4)))
  (entmake (list (cons 0 "LINE") (cons 10 crd5) (cons 11 crd6)))
  (entmake (list (cons 0 "LINE") (cons 10 crd7) (cons 11 crd8)))
  (entmake (list (cons 0 "LINE") (cons 10 crd2) (cons 11 crd7)))
  (if (= centerLine 1)
    (entmake (list (cons 0 "LINE") (cons 10 crd9) (cons 11 crd10) (cons 62 1) (cons 6 "CENTER2") (cons 48 (* counterBoreDia (CONSTANT "LINE_TYPE_SCALE")))))
  )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ======================================================================= <카운터싱크> ========================================================================
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 카운터싱크 / 평면도
(defun drawCounterSinkTopView (centerPoint drillDia counterSinkDepth counterSinkRadian centerLine)
  
  (setq counterSinkRadius (+ (* drillDia 0.5) (* counterSinkDepth (tan (* counterSinkRadian 0.5)))))
  
  (entmake (list (cons 0 "CIRCLE") (cons 10 centerPoint) (cons 40 (* drillDia 0.5))))
  (entmake (list (cons 0 "CIRCLE") (cons 10 centerPoint) (cons 40 counterSinkRadius)))
  
  (if (= centerLine 1) (drawCenterLine centerPoint (* counterSinkRadius 2)))
)

; 카운터싱크 / 평면도 / 장공
(defun drawCounterSinkTopViewSlot (centerPoint drillDia counterSinkDepth counterSinkRadian centerLine)
  
  (setq counterSinkRadius (+ (* drillDia 0.5) (* counterSinkDepth (tan (* counterSinkRadian 0.5)))))
  
  (entmake (list (cons 0 "CIRCLE") (cons 10 centerPoint) (cons 40 (* drillDia 0.5))))
  (entmake (list (cons 0 "CIRCLE") (cons 10 centerPoint) (cons 40 counterSinkRadius)))
  
  (if (= centerLine 1) (drawCenterLine centerPoint (* counterSinkRadius 2)))
)