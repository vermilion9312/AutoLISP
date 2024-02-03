(defun rotationMatrix (refCrd ang coordinate)
  (setq a (car refCrd))
  (setq b (cadr refCrd))
  (setq x (car coordinate))
  (setq y (cadr coordinate))
  (setq returnX (+ (- (* (- x a) (cos ang)) (* (- y b) (sin ang))) a))
  (setq returnY (+ (+ (* (- x a) (sin ang)) (* (- y b) (cos ang))) b))
  (list returnX returnY)
)

; 카운터보어 단면도 만들기
(defun makeCounterBoreSectionView (startPoint endPoint drillDia counterBoreDia counterBoreDepth)
  ; 시작점과 끝점 사이의 거리
  (setq dis (distance startPoint endPoint))
  
  ; 시작점과 끝점의 x, y 좌표
  (setq startPointX (car startPoint))
  (setq startPointY (cadr startPoint))
  (setq endPointX (car endPoint))
  (setq endPointY (cadr endPoint))
  
  ; 각도 구하기
  (if (/= endPointX 0) (setq ang (atan (/ endPointY endPointX))))
  ;; 각도가 제2사분면이 제4사분면으로, 제3사분면이 제1사분면으로 처리되는 것을 방지
  (if (and (< endPointX 0) (> endPointY 0)) (setq ang (+ ang pi)))
  (if (and (< endPointX 0) (< endPointY 0)) (setq ang (+ ang pi)))
  ;; Y증가량이 0이라 각도가 0 나와서 180도 돌지 않을 것을 방지
  (if (and (= endPointY 0) (< endPointX 0)) (setq ang (+ ang pi)))
  ;; 90도 270도 각도에서 x증가량이 0이라 각도를 못 구하는 것을 방지
  (if (and (= endPointX 0) (> endPointY 0)) (setq ang (* pi 0.5)))
  (if (and (= endPointX 0) (< endPointY 0)) (setq ang (* pi 1.5)))
  
  ; 각도가 0일 때 카운터보어 좌표
  (setq x0 (- startPointX (* dis 0.15)))
  (setq x1 startPointX)
  (setq x2 (+ startPointX counterBoreDepth))
  (setq x3 (+ startPointX dis))
  (setq x4 (+ dis (* dis 0.15)))
  
  (setq y1 (- startPointY (* counterBoreDia 0.5)))
  (setq y2 (- startPointY (* drillDia 0.5)))
  (setq y3 (+ startPointY (* drillDia 0.5)))
  (setq y4 (+ startPointY (* counterBoreDia 0.5)))
  
  (setq crd1 (list x1 y1))
  (setq crd2 (list x2 y1))
  (setq crd3 (list x2 y2))
  (setq crd4 (list x3 y2))
  (setq crd5 (list x3 y3))
  (setq crd6 (list x2 y3))
  (setq crd7 (list x2 y4))
  (setq crd8 (list x1 y4))

  (setq crd1 (rotationMatrix startPoint ang crd1))
  (setq crd2 (rotationMatrix startPoint ang crd2))
  (setq crd3 (rotationMatrix startPoint ang crd3))
  (setq crd4 (rotationMatrix startPoint ang crd4))
  (setq crd5 (rotationMatrix startPoint ang crd5))
  (setq crd6 (rotationMatrix startPoint ang crd6))
  (setq crd7 (rotationMatrix startPoint ang crd7))
  (setq crd8 (rotationMatrix startPoint ang crd8))
   
  ; 라인 그리기
  (entmake (list (cons 0 "LINE") (cons 10 crd1) (cons 11 crd2)))
  (entmake (list (cons 0 "LINE") (cons 10 crd3) (cons 11 crd4)))
  (entmake (list (cons 0 "LINE") (cons 10 crd5) (cons 11 crd6)))
  (entmake (list (cons 0 "LINE") (cons 10 crd7) (cons 11 crd8)))
  (entmake (list (cons 0 "LINE") (cons 10 crd2) (cons 11 crd7)))
)
  
(defun c:test ()
  (setq startPoint (getpoint "\n 삽입점: "))
  (setq endPoint (getpoint startPoint "\n 관통점: "))
  (makeCounterBoreSectionView startPoint endPoint 3.4 6.5 3.3)
)