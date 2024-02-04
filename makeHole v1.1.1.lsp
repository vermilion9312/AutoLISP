; ���� �Լ�
(defun c:59 (/ returnArr)
  
  (loadDialog)
  
  (princ returnArr)
  (setq tapSize (requestTapSize))
  
  (setq drillDia (car (counterBoreSpec tapSize)))
  (setq counterBoreDia (cadr (counterBoreSpec tapSize)))
  (setq counterBoreDepth (caddr (counterBoreSpec tapSize)))
  
  
  ; ���� �ɼ� �޴�
  (setq holeOption (getstring (strcat "\n ���� ���� ���� [��(T)/ī��Ʈ����(2)]: ")))
  (cond
    ((= holeOption "2") (makeCounterBore tapSize drillDia counterBoreDepth))
    ((= holeOption "t") (makeTap ))
  )
  
  (princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun loadDialog ()
   
   (setq dclId (load_dialog "holeDialog"))
   
   (if (not (new_dialog "holeDialog" dclId))
     (exit)
   )
  
  (action_tile "single" "(setq returnArr \"single\")")
  (action_tile "multiple" "(setq returnArr $key)")
   
   (setq returnDialog (start_dialog))
   (unload_dialog dclId)
  
 )

(defun makeCenter2 ()
  (if (= (tblsearch "ltype" "CENTER2") nil)
    (command "._-linetype" "load" "CENTER2" "" "")
  )
)

; ���� �ɼ� Ű
; (defun holeOptionKey (key)
;   (cond
;     ((= key 0) (set returnKey "h"))
;     ((= key 1) (set returnKey "t"))
;     ((= key 2) (set returnKey "b"))
;     ((= key 3) (set returnKey "s"))
;   )
;   returnKey
; )

; �� �ɼ�Ű
(defun viewOptionKey (key)
  (cond
    ((= key 0) (setq returnKey "8"))
    ((= key 1) (setq returnKey "4"))
  )
  returnKey
)

; ���� �ɼ� �޴�
; (defun holeOptionMenu (opt1 opt2)
;   (setq returnView (getstring (strcat "\n ���� ���� ���� [" opt1 "(��)/" opt2 "(ī��Ʈ����)]: ")))
;   returnView
; )

; �� �ɼ� �޴�
(defun viewOptionMenu (opt1 opt2)
  (setq returnView (getstring (strcat "\n ī���ͺ��� �� ���� [��鵵(" opt1 ")/�ܸ鵵(" opt2 ")]: ")))
  returnView
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; �߽ɼ� �׸���
(defun makeCenterMark (point diameter)
  
  (setq pointX (car point))
  (setq pointY (cadr point))
  
  (setq diameter (* diameter 1.3))
  
  (setq crd1 (list (- centerPointX (* counterBoreDia 0.5)) pointY))
  (setq crd2 (list (+ centerPointX (* counterBoreDia 0.5)) pointY))
  (setq crd3 (list centerPointX (- centerPointY (* counterBoreDia 0.5))))
  (setq crd4 (list centerPointX (+ centerPointY (* counterBoreDia 0.5))))

  (entmake (list (cons 0 "LINE") (cons 10 crd1) (cons 11 crd2) (cons 62 1) (cons 6 "CENTER2") (cons 48 (* counterBoreDia 0.0262))))
  (entmake (list (cons 0 "LINE") (cons 10 crd3) (cons 11 crd4) (cons 62 1) (cons 6 "CENTER2") (cons 48 (* counterBoreDia 0.0262))))
)
; == ������ ��ô ==
; ���Ѱ�: 0.0349
; �߰���: 0.0262
; ���Ѱ�: 0.0175


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ======================================================================== <���� �԰�> ========================================================================
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; �� �԰�
(defun tapSpec (tapSize)
  (cond
    ((= tapSize 3) (list (list tapSize 2.4 3 6) (list tapSize 2.4 4.5 7.5) (list tapSize 2.4 5.5 8.5)))
    ; ((= tapSize 3.5) (list (list tapSize 2.9 3.5 6.5) (list tapSize 2.9 5.5 8.5) (list tapSize 2.9 6.5 9.5)))
    ((= tapSize 4) (list (list tapSize 3.25 4 7) (list tapSize 3.25 6 9) (list tapSize 3.25 7 10)))
    ; ((= tapSize 4.5) (list (list tapSize 3.75 4.5 7.5) (list tapSize 3.75 7 10) (list tapSize 3.75 8 11)))
    ((= tapSize 5) (list (list tapSize 4.1 5 8.5) (list tapSize 4.1 8 11.5) (list tapSize 4.1 9 12.5)))
    
    ; ((= tapSize 5.5) (list (list tapSize 4.6 5.5 9) (list tapSize 4.6 8 11.5) (list tapSize 4.6 10 13.5)))
    ((= tapSize 6) (list (list tapSize 5 6 10) (list tapSize 5 9 13) (list tapSize 5 11 15)))
    ; ((= tapSize 7) (list (list tapSize 6 7 11) (list tapSize 6 11 15) (list tapSize 6 13 17)))
    ((= tapSize 8) (list (list tapSize 6.8 8 12) (list tapSize 6.8 12 16) (list tapSize 6.8 14 18)))
    ; ((= tapSize 9) (list (list tapSize 7.8 9 13) (list tapSize 7.8 13 17) (list tapSize 7.8 16 20)))
    
    ((= tapSize 10) (list (list tapSize 8.5 10 14) (list tapSize 8.5 15 19) (list tapSize 8.5 18 22)))
    ((= tapSize 12) (list (list tapSize 10.2 12 17) (list tapSize 10.2 17 22) (list tapSize 10.2 22 27)))
    ((= tapSize 14) (list (list tapSize 12 14 19) (list tapSize 12 20 25) (list tapSize 12 25 30)))
    ((= tapSize 16) (list (list tapSize 14 16 21) (list tapSize 14 22 27) (list tapSize 14 28 33)))
    ((= tapSize 18) (list (list tapSize 15.5 18 24) (list tapSize 15.5 25 31) (list tapSize 15.5 33 39)))
    
    ((= tapSize 20) (list (list tapSize 17.5 20 26) (list tapSize 17.5 27 33) (list tapSize 17.5 36 42)))
    ((= tapSize 22) (list (list tapSize 19.5 22 29) (list tapSize 19.5 30 37) (list tapSize 19.5 40 47)))
    ((= tapSize 24) (list (list tapSize 21 24 32) (list tapSize 21 32 40) (list tapSize 21 44 52)))
    ((= tapSize 27) (list (list tapSize 24 27 36) (list tapSize 24 36 45) (list tapSize 24 48 57)))
    ((= tapSize 30) (list (list tapSize 26.5 30 39) (list tapSize 26.5 40 49) (list tapSize 26.5 54 63)))
    
    ((= tapSize 33) (list (list tapSize 29.5 33 43) (list tapSize 29.5 43 53) (list tapSize 29.5 60 70)))
    ; ((= tapSize 36) (list (list tapSize 32 36 47) (list tapSize 32 47 58) (list tapSize 32 65 76)))
    ; ((= tapSize 39) (list (list tapSize 35 39 51) (list tapSize 35 52 64) (list tapSize 35 70 82)))
    ; ((= tapSize 42) (list (list tapSize 37.5 42 54) (list tapSize 37.5 55 67) (list tapSize 37.5 75 87)))
    ; ((= tapSize 45) (list (list tapSize 40.5 45 58) (list tapSize 40.5 58 71) (list tapSize 40.5 80 93)))
    (t (setq returnValue T))
  )
)

; ī���� ���� �԰�
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
    (t (setq returnValue T))
  )
)

; ī���� ��ũ �԰�
(defun counterSinkSpec (tapSize)
  (cond
    ((= tapSize 3) (list 3.4 1.75 (* PI 0.5)))
    ((= tapSize 4) (list 4.5 2.3 (* PI 0.5)))
    ((= tapSize 5) (list 5.5 2.8 (* PI 0.5)))
    ((= tapSize 6) (list 6.6 3.4 (* PI 0.5)))
    ((= tapSize 8) (list 9 4.4 (* PI 0.5)))
    ((= tapSize 10) (list 11 5.5 (* PI 0.5)))
    ((= tapSize 12) (list 14 6.5 (* PI 0.5)))
    ((= tapSize 14) (list 16 7 (* PI 0.5)))
    ((= tapSize 16) (list 18 7.5 (* PI 0.5)))
    ((= tapSize 18) (list 20 8 (* PI 0.5)))
    ((= tapSize 20) (list 22 8.5 (* PI 0.5)))
    ((= tapSize 22) (list 24 13.2 (/ PI 3)))
    ((= tapSize 24) (list 26 14 (/ PI 3)))
    ((= tapSize 27) (list 30 14 (/ PI 3)))
    ((= tapSize 30) (list 33 16.6 (/ PI 3)))
    ((= tapSize 33) (list 36 16.6 (/ PI 3)))
    (t (setq returnValue T))
  )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; ȸ�� ��ȯ ���
(defun rotateCoordinate (refCrd radian coordinate)
  (setq a (car refCrd))
  (setq b (cadr refCrd))
  (setq x (car coordinate))
  (setq y (cadr coordinate))
  (setq returnX (+ (- (* (- x a) (cos radian)) (* (- y b) (sin radian))) a))
  (setq returnY (+ (+ (* (- x a) (sin radian)) (* (- y b) (cos radian))) b))
  (list returnX returnY)
)

(defun rotateCoordinate (refCrd radian coordinate)
  (setq a (car refCrd))
  (setq b (cadr refCrd))
  (setq x (car coordinate))
  (setq y (cadr coordinate))
  (setq returnX (+ (- (* (- x a) (cos radian)) (* (- y b) (sin radian))) a))
  (setq returnY (+ (+ (* (- x a) (sin radian)) (* (- y b) (cos radian))) b))
  (list returnX returnY)
)

(defun rotateCoordinates (refCrd radian crdList)
  (mapcar (lambda (coordinate) rotateCoordinate(refCrd radian coordinate)) crdList)
)

; �� ��鵵 �����
(defun makeTapTopView (centerPoint tapDrillDia tapDia)
  (entmake (list (cons 0 "CIRCLE") (cons 10 centerPoint) (cons 40 (* drillDia 0.5))))
  (entmake (list (cons 0 "CIRCLE") (cons 10 centerPoint) (cons 40 (* tapDia 0.5)) (cons 62 1)))
  (makeCenterMark centerPoint counterBoreDia)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; �� ������ ��û
(defun requestTapSize ()
  (setq returnTapSize (getint "\n �� ����� �Է��ϼ���: "))
  (while (= (counterBoreSpec returnTapSize) T)
    (princ "\n ��ȿ�� �� ����� �ƴմϴ�.")
    (setq returnTapSize (getint "\n �� ����� �Է��ϼ���: "))
  )
  returnTapSize
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; ī���ͺ��� ��鵵 �����
(defun makeCountBoreTopView (centerPoint drillDia counterBoreDia)
  (entmake (list (cons 0 "CIRCLE") (cons 10 centerPoint) (cons 40 (* (* drillDia 1.0) 2))))
  (entmake (list (cons 0 "CIRCLE") (cons 10 centerPoint) (cons 40 (* (* counterBoreDia 1.0) 2))))
  (makeCenterMark centerPoint counterBoreDia)
)

; ī���ͺ��� �ܸ鵵 �����
(defun makeCounterBoreSectionView (startPoint endPoint drillDia counterBoreDia counterBoreDepth)
  ; �������� ���� ������ �Ÿ�
  (setq dis (distance startPoint endPoint))
  
  ; �������� ������ x, y ��ǥ
  (setq startPointX (car startPoint))
  (setq startPointY (cadr startPoint))
  (setq endPointX (car endPoint))
  (setq endPointY (cadr endPoint))
  (setq xDiff (- endPointX startPointX))
  (setq yDiff (- endPointY startPointY))
  
  ; ���� ���ϱ�
  (if (/= xDiff 0) (setq radian (atan (/ yDiff xDiff))))
  (cond
    ((and (< xDiff 0) (> yDiff 0)) (setq radian (+ radian pi)))
    ((and (< xDiff 0) (< yDiff 0)) (setq radian (+ radian pi)))
    ((and (= yDiff 0) (< xDiff 0)) (setq radian (+ radian pi)))
    ((and (= xDiff 0) (> yDiff 0)) (setq radian (* pi 0.5)))
    ((and (= xDiff 0) (< yDiff 0)) (setq radian (* pi 1.5)))
  )
  
  ; ������ 0�� �� ī���ͺ��� ��ǥ
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
  
  (setq crdList (list crd1 crd2 crd3 crd4 crd5 crd6 crd7 crd8 crd9 crd10))

  ; ȸ�� ��ȯ
  
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
  
  
  ; ���� �׸���
  (entmake (list (cons 0 "LINE") (cons 10 crd1) (cons 11 crd2)))
  (entmake (list (cons 0 "LINE") (cons 10 crd3) (cons 11 crd4)))
  (entmake (list (cons 0 "LINE") (cons 10 crd5) (cons 11 crd6)))
  (entmake (list (cons 0 "LINE") (cons 10 crd7) (cons 11 crd8)))
  (entmake (list (cons 0 "LINE") (cons 10 crd2) (cons 11 crd7)))
  (entmake (list (cons 0 "LINE") (cons 10 crd9) (cons 11 crd10) (cons 62 1) (cons 6 "CENTER2") (cons 48 (* counterBoreDia 0.0262))))
)

; ī���� ���� �����
(defun makeCounterBore (tapSize drillDia counterBoreDepth)
  (setq viewOption (viewOptionMenu (strcase (viewOptionKey 0) nil) (strcase (viewOptionKey 1) nil)))
  
  (while (and (/= viewOption (viewOptionKey 0)) (/= viewOption (strcase (viewOptionKey 0) nil)) (/= viewOption (viewOptionKey 1)) (/= viewOption (strcase (viewOptionKey 1) nil)))
    (princ "\n �ɼ� Ű���带 �Է��ϼ���.")
    (setq viewOption (viewOptionMenu (strcase (viewOptionKey 0) nil) (strcase (viewOptionKey 1) nil)))
  ) 
  
  (if (or (= viewOption (viewOptionKey 0)) (= viewOption (strcase (viewOptionKey 0) nil)))
    (makeCountBoreTopView (getpoint "\n �߽����� �Է��ϼ���: ") drillDia counterBoreDia)
  )

  (if (or (= viewOption (viewOptionKey 1)) (= viewOption (strcase (viewOptionKey 1) nil)))
    (progn
      (setq startPoint (getpoint "\n ���Ը��� Ŭ���ϼ���: "))
      (setq endPoint (getpoint startPoint "\n ������� Ŭ���ϼ���: "))
      (setq dis (distance startPoint endPoint))
      (while (<= dis counterBoreDepth)
        (princ "\n ��ȿ���� ���� ���� �Դϴ�.")
        (setq startPoint (getpoint "\n ���Ը��� Ŭ���ϼ���: "))
        (setq endPoint (getpoint startPoint "\n ������� Ŭ���ϼ���: "))
        (setq dis (distance startPoint endPoint))
      )
      (makeCounterBoreSectionView startPoint endPoint drillDia counterBoreDia counterBoreDepth)
    )
  )
)

(defun makeTap (centerPoint drillDia tapDia)
  (setq centerPoint (getpoint))
  (entmake (list (cons 0 "CIRCLE") (cons 10 centerPoint) (cons 40 (* 4.1 0.5))))
  (entmake (list (cons 0 "ARC") (cons 10 centerPoint) (cons 40 (* 5 0.5)) (cons 50 (* -100 (/ PI 180))) (cons 51 (* 170 (/ PI 180)))))

)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
