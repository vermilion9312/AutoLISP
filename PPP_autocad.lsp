;;==================================================================
;;    ���� �� ���� �� �����Ͽ� ������ �°� �ڵ� �÷� �ϱ�
;;    BLOG http://kimhyunchul.co.kr , blog.naver.com/iagapeu
;;    2017. 01. 05. A3���� �����Ͽ� ���� ����ϵ��� ������Ʈ 
;;    2018. 07. 24. ����/���ο� ���� ���� �ڵ� �����ϰ� ����
;;    2018. 11. 02. ������ �÷� �� PDF ��� ����
;;    2018. 11. 08. ���� ����
;;    2018. 11. 13. ������ ��� �߰� ������� mmm, pdf���� pdfm
;;    2019. 07. 29. osnap Ǯ���� ���� ������ (osmode 4335)
;;    2019. 11. 18. ��ġ�ǿ��� ������ġ(CTB) �����Ϸ� ���� �Ǵ� �κ� ���� (������ġ�÷� ��ô�� ������ Y ���� N����)
;;    2019. 11. 19. A4���� ��� �ǵ��� (�߰���� ppp4, pdf4, mmmm4, pdfm4)
;;    2020. 03. 26. ��ġ�� ���� �ܰ��� ���̴� ���� ���� (���������ü����� N���� ����)
;;    2020. 12. 28. UCS �ٲ� ��� �����ϵ��� ���� (��������� ��) 
;;    2022. 02. 09. �ɼ� �߰� ������ ����������(f) �ɼ�, ������ ������� ���� �÷� ���ÿ��� �� ���� ���� ��ü����� �ɼ� ����, PLOTTRANSPARENCYOVERRIDE �� �ɼ�
;;    2022. 03. 27. ��ġ�� A4 ��� FIT ���� �κ� ��Ÿ ���� 
;;    2023. 12. 28. zw CAD, Gstar CAD ȣȯ �߰� / A4 �μ� ���� ���� / ����ϱ� �޴� (��ɾ� pppp) �߰�
;;    2024. 02. 01. Adobe PDF ������ �����ϵ��� ���� (filedia ����)
;;    2024. 02. 27. A4 ���� FIT ���� ����
;;==================================================================

;;�� ���� ������ ���� ��ġ �⺻���� c:\PDF\PPP ���� �Դϴ�.

;;�Ʒ��� ���̷� ����ϴ� �뵵�� �����Դϴ�.
 (setq plotername "DLA(���)"); ����� �������̸�
 (setq ctbname "a3.ctb") ; A3 ����� CTB ����
 (setq ctbnameA4 "a3.ctb") ; A4 ����� CTB ����
 (setq papername "A3") ; ���� ũ��� A3 ���� ���� ����, �����͸��� ���� �ٸ��� Ȯ�ιٶ�. ex A3 , A3(297x420mm)
 (setq papernamea4 "A4") ; ���� ũ��� A4 ���� ���� ����, �����͸��� ���� �ٸ��� Ȯ�ιٶ�. ex A4, A4(210x297mm)
			 ;��) ISO ��ü������ A3(420.00 x 297.00 mm) ������ ������
 (setq pdgsccpaper 514.4016); ���� �밢�� ���� A3������(���� �� ũ�� Ʋ�� ��� ���⸦ �����ָ� ��)
 (setq pdgsccpapera4 363.7430); ���� �밢�� ���� A4������(���� �� ũ�� Ʋ�� ��� ���⸦ �����ָ� ��)

 ;;�Ʒ��� PDF�� ����ϴ� �뵵�� �����Դϴ�. CTB�� ���� ��� �뵵�� �����ϰ� ���󰩴ϴ�.
 (setq P_plotername "DWG to PDF.pc3");PDF����� �÷��� �̸� (Adobe PDF.pc3�� ���� ���� ������ �� �ȵ˴ϴ�.)
 (setq P_papername "ISO Ȯ�� A3 (420.00 x 297.00 MM)") ; ���� ũ��� A3 ���� ���� ����, �����͸��� ���� �ٸ��� Ȯ�ιٶ�. 
 (setq P_papernamea4 "ISO Ȯ�� A4 (297.00 x 210.00 MM)") ; ���� ũ��� A3 ���� ���� ����, �����͸��� ���� �ٸ��� Ȯ�ιٶ�. 
			 ;��) ISO ��ü������ A3(420.00 x 297.00 mm) ������ ������
 (setq PATH (getvar "c:\\pdf\\"))	;;; pdf���� ���� ��ġ ����� c:\pdf ������. ���� ���� ���� ���弼��.
 (setq PDFdelay 3000) ;PDF������ ��Ǯ�� �ȵǹǷ� 3�� ������ ����. �������� ���� ���� �ȵ� ��� �ð��� �ø�����. 10�ʴ� 10000��
;;������� �⺻ ����


;;���뼼��
 (setq pppscaleonfit "on"); �ɼ�(on/fit) on�� ������ ������ �ڵ� ����, fit�� ������ ����
 (setq pltovrd 1); PLOTTRANSPARENCYOVERRIDE ���� 1 �Ǵ� 2�� �����մϴ� 1�� ��� ��ġ ������ ���� ĳ������ ��������, 2�� ��ġ�� �����ϰ� �ٲߴϴ�. �÷� �ӵ�������. �⺻���� 1��


;;������ ����
 (setq mmmvorder "N"); ������� ���� �÷� �ɼ� Y �Ǵ� N 
 (setq mmmvhide "N"); ������� ��ü����� Y �Ǵ� N (�ɼ� ���� �ܰ����� ���� ��� N)


;; ������� ���� ����


;; ���⿡������ A3 ���
 (defun c:ppp( / ent pwgs ss1  ppw1 ppw2 vpw1 vpw2 pwwsel pdgscc1 pdgscc pdgscc wlp) 
 (defun *error* (msg)(princ "error: ")(princ msg)
 (setvar "osmode" 0)
 (princ))
 (vl-load-com)
 (setq ent nil)

 (prompt "\n ����Ʈ �� ������ �����ϼ���(������ε� ����ܰ�) !!" ) 
 (setq pwgs (ssget (list (cons 0 "LWPOLYLINE"))))

	;; Doug C. Broad, Jr.
	;; can be used with vla-transformby to
	;; transform objects from the UCS to the WCS
	(defun UCS2WCSMatrix ()
	(vlax-tmatrix
	(append
	(mapcar
	'(lambda (vector origin)
	(append (trans vector 1 0 t) (list origin))
	)
	(list '(1 0 0) '(0 1 0) '(0 0 1))
	(trans '(0 0 0) 0 1)
	)
	(list '(0 0 0 1))
	)
	)
	)
	;; transform objects from the WCS to the UCS
	(defun WCS2UCSMatrix ()
	(vlax-tmatrix
	(append
	(mapcar
	'(lambda (vector origin)
	(append (trans vector 0 1 t) (list origin))
	)
	(list '(1 0 0) '(0 1 0) '(0 0 1))
	(trans '(0 0 0) 1 0)
	)
	(list '(0 0 0 1))
	)
	)
	)


  (if pwgs
   (progn
    (setq ss1 pwgs)
    (setq n 0)
    (repeat (sslength ss1)
    (setq ent (ssname ss1 n))


	(vla-TransformBy (vlax-ename->vla-object ent) (UCS2WCSMatrix))
	(vla-getboundingbox (vlax-ename->vla-object ent) 'MinPt 'MaxPt)
	(vla-TransformBy (vlax-ename->vla-object ent) (WCS2UCSMatrix))
	;### ��������� ���� UCS ������ ���� ��� 
	;(vla-GetBoundingBox (vlax-ename->vla-object ent) 'MinPt 'MaxPt)

  (setq ppw1 (vlax-safearray->list MinPt)) 
  (setq ppw2 (vlax-safearray->list MaxPt))

  (setq vpw1 (list (car ppw2) (cadr ppw1)));������
  (setq vpw2 (list (car ppw1) (cadr ppw2))) ;�»���

  (setq wx (- (car ppw2) (car ppw1)) ) ;������
  (setq wy (- (cadr ppw2) (cadr ppw1)) );����
  (if (> wx wy) (setq wlp "L") (setq wlp "P"))

  (setq pwwsel (ssget "W" ppw1 ppw2 ));��ü����
  (setq pdgscc1 (distance ppw1 ppw2))

; lt������ �����Ϸ��� ���� �ּ� �����ϸ� ��. ���� �׸��� ���鿡���� �ʿ� ��� �ּ� ó����.
;  (setq pdgscc4 (* pdgscc 4 )) ;ltscale ��������4��
;  (setvar "ltscale"  pdgscc4) ; ġ�������� ������ô�� ���� 

  (setvar "osmode" 4335)

; �Ʒ� ���� �߰���. ������ ������ ���缭 ����ϵ��� ����ϱ�
  (setq PLOTSCALE (STRCAT "1=" (rtos (/ pdgscc1 pdgsccpaper) 2 0)))


; scale �������� _ fit  ��������, on ������ ����
  (if (= pppscaleonfit "fit") (setq PLOTSCALE "fit") (setq PLOTSCALE PLOTSCALE))



; (command "zoom" ppw1 ppw2) ; ������ ��������

      (command "-PLOT"  
               "Y" 
               "model"                        
               "FF K505p for ApeosPort C3570"               ;�������̸�
               "A4(210x297mm)"                  ;���� ũ��
               "millimeter"                   ;����
               "landscape"                   ;������ ���� ���� �Ǵ��� L, P ����
               "N" 
               "W"
               ppw2 ppw1
               "fit"
               "C"
               "Y"   
               "monochrome.ctb"
               "Y"                    ;������ġ�÷�
               "A"                    ;�����÷Լ��� / ǥ�õǴ� ���(A)/���̾�������(W)/����(H)/�� ��Ÿ��(V)/����(R)
               "N"                    ;�÷������ ���Ϸ�
               "N"                    ;���������� ����
               "Y"                    ;�÷�����
       )                     
	(command "osmode" "4335")
       (setq n (1+ n))
    )
   )
  ) 

  (prompt "\n ��¿Ϸ�!")
)



;; ���⿡������ A3 PDF�����
 (defun c:pdf( / ent pwgs ss1 ppw1 ppw2 vpw1 vpw2 pwwsel pdgscc1 pdgscc pdgscc4 wlp) 

 (defun *error* (msg)(princ "error: ")(princ msg)
  (setvar "osmode" 0)
 (princ))
 (vl-load-com)
 (setq ent nil)

 (prompt "\n ����Ʈ �� ������ �����ϼ���(������ε� ����ܰ�) !!" ) 
 (setq pwgs (ssget (list (cons 0 "insert"))))

	;; Doug C. Broad, Jr.
	;; can be used with vla-transformby to
	;; transform objects from the UCS to the WCS
	(defun UCS2WCSMatrix ()
	(vlax-tmatrix
	(append
	(mapcar
	'(lambda (vector origin)
	(append (trans vector 1 0 t) (list origin))
	)
	(list '(1 0 0) '(0 1 0) '(0 0 1))
	(trans '(0 0 0) 0 1)
	)
	(list '(0 0 0 1))
	)
	)
	)
	;; transform objects from the WCS to the UCS
	(defun WCS2UCSMatrix ()
	(vlax-tmatrix
	(append
	(mapcar
	'(lambda (vector origin)
	(append (trans vector 0 1 t) (list origin))
	)
	(list '(1 0 0) '(0 1 0) '(0 0 1))
	(trans '(0 0 0) 1 0)
	)
	(list '(0 0 0 1))
	)
	)
	)


  (if pwgs
   (progn
    (setq ss1 pwgs)
    (setq n 0)
    (repeat (sslength ss1)
    (setq ent (ssname ss1 n))


	(vla-TransformBy (vlax-ename->vla-object ent) (UCS2WCSMatrix))
	(vla-getboundingbox (vlax-ename->vla-object ent) 'MinPt 'MaxPt)
	(vla-TransformBy (vlax-ename->vla-object ent) (WCS2UCSMatrix))
	;### ��������� ���� UCS ������ ���� ��� 
	;(vla-GetBoundingBox (vlax-ename->vla-object ent) 'MinPt 'MaxPt)

  (setq ppw1 (vlax-safearray->list MinPt)) 
  (setq ppw2 (vlax-safearray->list MaxPt))

  (setq vpw1 (list (car ppw2) (cadr ppw1)));������
  (setq vpw2 (list (car ppw1) (cadr ppw2))) ;�»���

  (setq wx (- (car ppw2) (car ppw1)) ) ;������
  (setq wy (- (cadr ppw2) (cadr ppw1)) );����
  (if (> wx wy) (setq wlp "l") (setq wlp "p"))

  (setq pwwsel (ssget "W" ppw1 ppw2 ));��ü����
  (setq pdgscc1 (distance ppw1 ppw2))
  (setq pdgscc (/ pdgscc1 pdgsccpaper )) ; ����ô�� �밢���̷� ������ A3����(���� �� ũ�� Ʋ�� ��� ���⸦ �����ָ� ��)

; lt������ �����Ϸ��� ���� �ּ� �����ϸ� ��. ���� �׸��� ���鿡���� �ʿ� ��� �ּ� ó����.
;  (setq pdgscc4 (* pdgscc 4 )) ;ltscale ��������4��
;  (setvar "ltscale"  pdgscc4) ; ġ�������� ������ô�� ���� 

  (setvar "osmode" 4335)

; �Ʒ� ���� �߰���. ������ ������ ���缭 ����ϵ��� ����ϱ�
  (setq PLOTSCALE (STRCAT "1=" (rtos (/ pdgscc1 pdgsccpaper) 2 0)))

; scale �������� _ fit  ��������, on ������ ����
  (if (= pppscaleonfit "fit") (setq PLOTSCALE "fit") (setq PLOTSCALE PLOTSCALE))

 (setq filetime (rtos (getvar "cdate") 2 6)) ; �̸��� ���� �ð�

; PDF���� �̸��� ���� ĳ������_����ð�.pdf��
 (setq fname (getvar "dwgname"))
 (setq fname (substr fname 1 (- (strlen fname) 4)))
 (setq sffx (rtos (getvar "cdate") 2 6));;; �ð� �ҷ�����
; (setq fname (strcat PATH fname sffx ".pdf")) 
 (setq fname (strcat "c:\\pdf\\" fname "_" sffx ".pdf")) 


; scale �������� _ fit  ��������, on ������ ����
  (if (= pppscaleonfit "fit") (setq PLOTSCALE "fit") (setq PLOTSCALE PLOTSCALE))


; (command "zoom" P_ppw1 P_ppw2) ; ������ ��������
 (command "filedia" "0"); ���� â �Ⱥ��̰�, ���̰��Ϸ��� fildia ��� �� 1 �Է�

      (command "-PLOT"  
               "Y" 
               "model"                        
               P_plotername               ;�������̸�
               P_papername                   ;���� ũ��
               "M"                   ;����
               wlp                    ;������ ���� ���� �Ǵ��� L, P ����
               "N" 
               "W"
               ppw2 ppw1
               PLOTSCALE
               "C"
               "Y"   
               ctbname
               "Y"                    ;������ġ�÷�
               "A"                    ;�����÷Լ��� / ǥ�õǴ� ���(A)/���̾�������(W)/����(H)/�� ��Ÿ��(V)/����(R)
	       fname			;���� �̸� c:\pdf ���� �ȿ� ����ð�.pdf�� ����
	       "Y"                    ;�÷� ��������
               "Y"                    ;�÷�����
       )                     
	 (command "delay"		;PDF������ ��Ǯ�� �ȵǹǷ� 5�� ������ ����. ���� ���� �ȵ� ��� �ð��� �ø�����. 10�ʴ� 10000�� 
	 PDFdelay
	 )
	(command "osmode" "4335")
       (setq n (1+ n))
    )
   )
  ) 

(command "filedia" "1"); ���� â ���̰�

  (prompt "\n ��¿Ϸ�!")
)



;;������� ������ A3 ���
 (defun c:mmm( / ent pwgs ss1  ppw1 ppw2 vpw1 vpw2 pwwsel pdgscc1 pdgscc pdgscc4 ) 
 (defun *error* (msg)(princ "error: ")(princ msg)
 (setvar "osmode" 0)
 (princ))
 (vl-load-com)
 (setq ent nil)

 (prompt "\n ����Ʈ �� ������ �����ϼ���(������ε� ����ܰ�) !!" ) 
 (setq pwgs (ssget (list (cons 0 "insert"))))

	;; Doug C. Broad, Jr.
	;; can be used with vla-transformby to
	;; transform objects from the UCS to the WCS
	(defun UCS2WCSMatrix ()
	(vlax-tmatrix
	(append
	(mapcar
	'(lambda (vector origin)
	(append (trans vector 1 0 t) (list origin))
	)
	(list '(1 0 0) '(0 1 0) '(0 0 1))
	(trans '(0 0 0) 0 1)
	)
	(list '(0 0 0 1))
	)
	)
	)
	;; transform objects from the WCS to the UCS
	(defun WCS2UCSMatrix ()
	(vlax-tmatrix
	(append
	(mapcar
	'(lambda (vector origin)
	(append (trans vector 0 1 t) (list origin))
	)
	(list '(1 0 0) '(0 1 0) '(0 0 1))
	(trans '(0 0 0) 1 0)
	)
	(list '(0 0 0 1))
	)
	)
	)


  (if pwgs
   (progn
    (setq ss1 pwgs)
    (setq n 0)
    (repeat (sslength ss1)
    (setq ent (ssname ss1 n))


	(vla-TransformBy (vlax-ename->vla-object ent) (UCS2WCSMatrix))
	(vla-getboundingbox (vlax-ename->vla-object ent) 'MinPt 'MaxPt)
	(vla-TransformBy (vlax-ename->vla-object ent) (WCS2UCSMatrix))
	;### ��������� ���� UCS ������ ���� ��� 
	;(vla-GetBoundingBox (vlax-ename->vla-object ent) 'MinPt 'MaxPt)

  (setq ppw1 (vlax-safearray->list MinPt)) 
  (setq ppw2 (vlax-safearray->list MaxPt))

  (setq vpw1 (list (car ppw2) (cadr ppw1)));������
  (setq vpw2 (list (car ppw1) (cadr ppw2))) ;�»���

  (setq wx (- (car ppw2) (car ppw1)) ) ;������
  (setq wy (- (cadr ppw2) (cadr ppw1)) );����
  (if (> wx wy) (setq wlp "l") (setq wlp "p"))

  (setq pwwsel (ssget "W" ppw1 ppw2 ));��ü����
  (setq pdgscc1 (distance ppw1 ppw2))

; lt������ �����Ϸ��� ���� �ּ� �����ϸ� ��. ���� �׸��� ���鿡���� �ʿ� ��� �ּ� ó����.
;  (setq pdgscc4 (* pdgscc 4 )) ;ltscale ��������4��
;  (setvar "ltscale"  pdgscc4) ; ġ�������� ������ô�� ���� 

  (setvar "osmode" 4335)

; �Ʒ� ���� �߰���. ������ ������ ���缭 ����ϵ��� ����ϱ�
  (setq PLOTSCALE (STRCAT "1=" (rtos (/ pdgscc1 pdgsccpaper) 2 0)))

; scale �������� _ fit  ��������, on ������ ����
  (if (= pppscaleonfit "fit") (setq PLOTSCALE "fit") (setq PLOTSCALE PLOTSCALE))


; (command "zoom" ppw1 ppw2) ; ������ ��������

      (command "-PLOT"  
               "Y" 
               ""                        
               plotername               ;�������̸�
               papername                   ;���� ũ��
               "M"                   ;�и����� ��ġ
               wlp                    ;������ ���� ���� �Ǵ��� L, P ����
               "N" 
               "W"
               ppw2 ppw1
               PLOTSCALE
               "C"
               "Y"   
               ctbname
               "Y"                    ;������ġ�÷�
               "N"                    ;������ġ�÷� ��ô�� ����
	       mmmvorder              ;������������÷�
               mmmvhide               ;���������ü����� 20200326 N���� ���� (���� �ܰ��� ������ ������)
	       "N"                    ;�÷� ��������
	       "N"                    ;�÷� ��������
               "Y"                    ;�÷�����
       )                     
	(command "osmode" "4335")
       (setq n (1+ n))
    );repeat end
    (princ)
   )
  ) 

  (prompt "\n ��¿Ϸ�!")
)



;; ���⿡������ ��ġ�� A3 PDF�����
 (defun c:pdfm( / ent pwgs ss1 ppw1 ppw2 vpw1 vpw2 pwwsel pdgscc1 pdgscc pdgscc4 wlp) 

 (defun *error* (msg)(princ "error: ")(princ msg)
  (setvar "osmode" 0)
 (princ))
 (vl-load-com)
 (setq ent nil)

 (prompt "\n ����Ʈ �� ������ �����ϼ���(������ε� ����ܰ�) !!" ) 
 (setq pwgs (ssget (list (cons 0 "insert"))))

	;; Doug C. Broad, Jr.
	;; can be used with vla-transformby to
	;; transform objects from the UCS to the WCS
	(defun UCS2WCSMatrix ()
	(vlax-tmatrix
	(append
	(mapcar
	'(lambda (vector origin)
	(append (trans vector 1 0 t) (list origin))
	)
	(list '(1 0 0) '(0 1 0) '(0 0 1))
	(trans '(0 0 0) 0 1)
	)
	(list '(0 0 0 1))
	)
	)
	)
	;; transform objects from the WCS to the UCS
	(defun WCS2UCSMatrix ()
	(vlax-tmatrix
	(append
	(mapcar
	'(lambda (vector origin)
	(append (trans vector 0 1 t) (list origin))
	)
	(list '(1 0 0) '(0 1 0) '(0 0 1))
	(trans '(0 0 0) 1 0)
	)
	(list '(0 0 0 1))
	)
	)
	)


  (if pwgs
   (progn
    (setq ss1 pwgs)
    (setq n 0)
    (repeat (sslength ss1)
    (setq ent (ssname ss1 n))


	(vla-TransformBy (vlax-ename->vla-object ent) (UCS2WCSMatrix))
	(vla-getboundingbox (vlax-ename->vla-object ent) 'MinPt 'MaxPt)
	(vla-TransformBy (vlax-ename->vla-object ent) (WCS2UCSMatrix))
	;### ��������� ���� UCS ������ ���� ��� 
	;(vla-GetBoundingBox (vlax-ename->vla-object ent) 'MinPt 'MaxPt)

  (setq ppw1 (vlax-safearray->list MinPt)) 
  (setq ppw2 (vlax-safearray->list MaxPt))

  (setq vpw1 (list (car ppw2) (cadr ppw1)));������
  (setq vpw2 (list (car ppw1) (cadr ppw2))) ;�»���

  (setq wx (- (car ppw2) (car ppw1)) ) ;������
  (setq wy (- (cadr ppw2) (cadr ppw1)) );����
  (if (> wx wy) (setq wlp "l") (setq wlp "p"))

  (setq pwwsel (ssget "W" ppw1 ppw2 ));��ü����
  (setq pdgscc1 (distance ppw1 ppw2))
  (setq pdgscc (/ pdgscc1 pdgsccpaper )) ; ����ô�� �밢���̷� ������ A3����(���� �� ũ�� Ʋ�� ��� ���⸦ �����ָ� ��)

; lt������ �����Ϸ��� ���� �ּ� �����ϸ� ��. ���� �׸��� ���鿡���� �ʿ� ��� �ּ� ó����.
;  (setq pdgscc4 (* pdgscc 4 )) ;ltscale ��������4��
;  (setvar "ltscale"  pdgscc4) ; ġ�������� ������ô�� ���� 

  (setvar "osmode" 4335)

; �Ʒ� ���� �߰���. ������ ������ ���缭 ����ϵ��� ����ϱ�
  (setq PLOTSCALE (STRCAT "1=" (rtos (/ pdgscc1 pdgsccpaper) 2 0)))

; scale �������� _ fit  ��������, on ������ ����
  (if (= pppscaleonfit "fit") (setq PLOTSCALE "fit") (setq PLOTSCALE PLOTSCALE))

 (setq filetime (rtos (getvar "cdate") 2 6)) ; �̸��� ���� �ð�

; PDF���� �̸��� ���� ĳ������_����ð�.pdf��
 (setq fname (getvar "dwgname"))
 (setq fname (substr fname 1 (- (strlen fname) 4)))
 (setq sffx (rtos (getvar "cdate") 2 6));;; �ð� �ҷ�����
; (setq fname (strcat PATH fname sffx ".pdf")) 
 (setq fname (strcat "c:\\pdf\\" fname "_" sffx ".pdf")) 



; (command "zoom" P_ppw1 P_ppw2) ; ������ ��������
 (command "filedia" "0"); ���� â �Ⱥ��̰�, ���̰��Ϸ��� fildia ��� �� 1 �Է�

      (command "-PLOT"  
               "Y" 
               ""                         ;��ġ���� �����
               P_plotername               ;�������̸�
               P_papername                   ;���� ũ��
               "M"                   ;�и�����
               wlp                    ;������ ���� ���� �Ǵ��� L, P ����
               "N" 
               "W"
               ppw2 ppw1
               PLOTSCALE
               "C"
               "Y"   
               ctbname
               "Y"                    ;������ġ�÷�
               "N"                    ;������ġ�÷� ��ô�� ����
	       mmmvorder              ;������������÷�
               mmmvhide               ;���������ü����� 20200326 N���� ���� (���� �ܰ��� ������ ������)
	       fname			;���� �̸� c:\pdf ���� �ȿ� ����ð�.pdf�� ����
	       "N"                    ;�÷� ��������
               "Y"                    ;�÷�����
       )                     
	 (command "delay"		;PDF������ ��Ǯ�� �ȵǹǷ� 5�� ������ ����. ���� ���� �ȵ� ��� �ð��� �ø�����. 10�ʴ� 10000�� 
	 PDFdelay
	 )
	(command "osmode" "4335")
       (setq n (1+ n))
    )
   )
  ) 

(command "filedia" "1"); ���� â ���̰�

  (prompt "\n ��¿Ϸ�!")
)








;; �Ʒ����ʹ� A4���� ��� �ǵ��� �߰� �߽��ϴ�. �߰���� ppp4, pdf4, mmmm4, pdfm4)

;; ���⿡������ A4 ������ ���
 (defun c:ppp4( / ent pwgs ss1  ppw1 ppw2 vpw1 vpw2 pwwsel pdgscc1 pdgscc pdgscc4 ) 
 (defun *error* (msg)(princ "error: ")(princ msg)
 (setvar "osmode" 0)
 (princ))
 (vl-load-com)
 (setq ent nil)

 (prompt "\n ����Ʈ �� ������ �����ϼ���(������ε� ����ܰ�) !!" ) 
 (setq pwgs (ssget (list (cons 0 "insert"))))

	;; Doug C. Broad, Jr.
	;; can be used with vla-transformby to
	;; transform objects from the UCS to the WCS
	(defun UCS2WCSMatrix ()
	(vlax-tmatrix
	(append
	(mapcar
	'(lambda (vector origin)
	(append (trans vector 1 0 t) (list origin))
	)
	(list '(1 0 0) '(0 1 0) '(0 0 1))
	(trans '(0 0 0) 0 1)
	)
	(list '(0 0 0 1))
	)
	)
	)
	;; transform objects from the WCS to the UCS
	(defun WCS2UCSMatrix ()
	(vlax-tmatrix
	(append
	(mapcar
	'(lambda (vector origin)
	(append (trans vector 0 1 t) (list origin))
	)
	(list '(1 0 0) '(0 1 0) '(0 0 1))
	(trans '(0 0 0) 1 0)
	)
	(list '(0 0 0 1))
	)
	)
	)


  (if pwgs
   (progn
    (setq ss1 pwgs)
    (setq n 0)
    (repeat (sslength ss1)
    (setq ent (ssname ss1 n))


	(vla-TransformBy (vlax-ename->vla-object ent) (UCS2WCSMatrix))
	(vla-getboundingbox (vlax-ename->vla-object ent) 'MinPt 'MaxPt)
	(vla-TransformBy (vlax-ename->vla-object ent) (WCS2UCSMatrix))
	;### ��������� ���� UCS ������ ���� ��� 
	;(vla-GetBoundingBox (vlax-ename->vla-object ent) 'MinPt 'MaxPt)

  (setq ppw1 (vlax-safearray->list MinPt)) 
  (setq ppw2 (vlax-safearray->list MaxPt))

  (setq vpw1 (list (car ppw2) (cadr ppw1)));������
  (setq vpw2 (list (car ppw1) (cadr ppw2))) ;�»���

  (setq wx (- (car ppw2) (car ppw1)) ) ;������
  (setq wy (- (cadr ppw2) (cadr ppw1)) );����
  (if (> wx wy) (setq wlpa4 "L") (setq wlpa4 "P"))

  (setq pwwsel (ssget "W" ppw1 ppw2 ));��ü����
  (setq pdgscc1 (distance ppw1 ppw2))

; lt������ �����Ϸ��� ���� �ּ� �����ϸ� ��. ���� �׸��� ���鿡���� �ʿ� ��� �ּ� ó����.
;  (setq pdgscc4 (* pdgscc 4 )) ;ltscale ��������4��
;  (setvar "ltscale"  pdgscc4) ; ġ�������� ������ô�� ���� 

  (setvar "osmode" 4335)

; �Ʒ� ���� �߰���. ������ ������ ���缭 ����ϵ��� ����ϱ�
  (setq PLOTSCALEA4 (STRCAT "1=" (rtos (/ pdgscc1 pdgsccpapera4) 2 0)))


; scale �������� _ fit  ��������, on ������ ����
  (if (= pppscaleonfit "fit") (setq PLOTSCALEA4 "fit") (setq PLOTSCALEA4 PLOTSCALEA4))



; (command "zoom" ppw1 ppw2) ; ������ ��������

      (command "-PLOT"  
               "Y" 
               ""                        
               plotername               ;�������̸�
               papernamea4                   ;���� ũ��
               "M"                   ;����
               wlpa4                    ;������ ���� ���� �Ǵ��� L, P ����
               "N" 
               "W"
               ppw2 ppw1
               PLOTSCALEA4
               "C"
               "Y"   
               ctbnameA4
               "Y"                    ;������ġ�÷�
               "A"                    ;�����÷Լ��� / ǥ�õǴ� ���(A)/���̾�������(W)/����(H)/�� ��Ÿ��(V)/����(R)
               "N"                    ;�÷������ ���Ϸ�
               "N"                    ;���������� ����
               "Y"                    ;�÷�����
       )                     
	(command "osmode" "4335")
       (setq n (1+ n))
    )
   )
  ) 

  (prompt "\n ��¿Ϸ�!")
)



;; ���⿡������ A4 PDF�����
 (defun c:pdf4( / ent pwgs ss1 ppw1 ppw2 vpw1 vpw2 pwwsel pdgscc1 pdgscc pdgscc4 wlpa4) 

 (defun *error* (msg)(princ "error: ")(princ msg)
  (setvar "osmode" 0)
 (princ))
 (vl-load-com)
 (setq ent nil)

 (prompt "\n ����Ʈ �� ������ �����ϼ���(������ε� ����ܰ�) !!" ) 
 (setq pwgs (ssget (list (cons 0 "insert"))))

	;; Doug C. Broad, Jr.
	;; can be used with vla-transformby to
	;; transform objects from the UCS to the WCS
	(defun UCS2WCSMatrix ()
	(vlax-tmatrix
	(append
	(mapcar
	'(lambda (vector origin)
	(append (trans vector 1 0 t) (list origin))
	)
	(list '(1 0 0) '(0 1 0) '(0 0 1))
	(trans '(0 0 0) 0 1)
	)
	(list '(0 0 0 1))
	)
	)
	)
	;; transform objects from the WCS to the UCS
	(defun WCS2UCSMatrix ()
	(vlax-tmatrix
	(append
	(mapcar
	'(lambda (vector origin)
	(append (trans vector 0 1 t) (list origin))
	)
	(list '(1 0 0) '(0 1 0) '(0 0 1))
	(trans '(0 0 0) 1 0)
	)
	(list '(0 0 0 1))
	)
	)
	)


  (if pwgs
   (progn
    (setq ss1 pwgs)
    (setq n 0)
    (repeat (sslength ss1)
    (setq ent (ssname ss1 n))


	(vla-TransformBy (vlax-ename->vla-object ent) (UCS2WCSMatrix))
	(vla-getboundingbox (vlax-ename->vla-object ent) 'MinPt 'MaxPt)
	(vla-TransformBy (vlax-ename->vla-object ent) (WCS2UCSMatrix))
	;### ��������� ���� UCS ������ ���� ��� 
	;(vla-GetBoundingBox (vlax-ename->vla-object ent) 'MinPt 'MaxPt)

  (setq ppw1 (vlax-safearray->list MinPt)) 
  (setq ppw2 (vlax-safearray->list MaxPt))

  (setq vpw1 (list (car ppw2) (cadr ppw1)));������
  (setq vpw2 (list (car ppw1) (cadr ppw2))) ;�»���

  (setq wx (- (car ppw2) (car ppw1)) ) ;������
  (setq wy (- (cadr ppw2) (cadr ppw1)) );����
  (if (> wx wy) (setq wlpa4 "l") (setq wlpa4 "p"))

  (setq pwwsel (ssget "W" ppw1 ppw2 ));��ü����
  (setq pdgscc1 (distance ppw1 ppw2))
  (setq pdgscc (/ pdgscc1 pdgsccpapera4 )) ; ����ô�� �밢���̷� ������ A3����(���� �� ũ�� Ʋ�� ��� ���⸦ �����ָ� ��)

; lt������ �����Ϸ��� ���� �ּ� �����ϸ� ��. ���� �׸��� ���鿡���� �ʿ� ��� �ּ� ó����.
;  (setq pdgscc4 (* pdgscc 4 )) ;ltscale ��������4��
;  (setvar "ltscale"  pdgscc4) ; ġ�������� ������ô�� ���� 

  (setvar "osmode" 4335)

; �Ʒ� ���� �߰���. ������ ������ ���缭 ����ϵ��� ����ϱ�
  (setq PLOTSCALEA4 (STRCAT "1=" (rtos (/ pdgscc1 pdgsccpapera4) 2 0)))

; scale �������� _ fit  ��������, on ������ ����
  (if (= pppscaleonfit "fit") (setq PLOTSCALEA4 "fit") (setq PLOTSCALEA4 PLOTSCALEA4))

 (setq filetime (rtos (getvar "cdate") 2 6)) ; �̸��� ���� �ð�

; PDF���� �̸��� ���� ĳ������_����ð�.pdf��
 (setq fname (getvar "dwgname"))
 (setq fname (substr fname 1 (- (strlen fname) 4)))
 (setq sffx (rtos (getvar "cdate") 2 6));;; �ð� �ҷ�����
; (setq fname (strcat PATH fname sffx ".pdf")) 
 (setq fname (strcat "c:\\pdf\\" fname "_" sffx ".pdf")) 



; (command "zoom" P_ppw1 P_ppw2) ; ������ ��������
 (command "filedia" "0"); ���� â �Ⱥ��̰�, ���̰��Ϸ��� fildia ��� �� 1 �Է�

      (command "-PLOT"  
               "Y" 
               "model"                        
               P_plotername               ;�������̸�
               P_papernamea4                   ;���� ũ��
               "M"                   ;����
               wlpa4                    ;������ ���� ���� �Ǵ��� L, P ����
               "N" 
               "W"
               ppw2 ppw1
               PLOTSCALEA4
               "C"
               "Y"   
               ctbnameA4
               "Y"                    ;������ġ�÷�
               "A"                    ;�����÷Լ��� / ǥ�õǴ� ���(A)/���̾�������(W)/����(H)/�� ��Ÿ��(V)/����(R)
	       fname			;���� �̸� c:\pdf ���� �ȿ� ����ð�.pdf�� ����
	       "Y"                    ;�÷� ��������
               "Y"                    ;�÷�����
       )                     
	 (command "delay"		;PDF������ ��Ǯ�� �ȵǹǷ� 5�� ������ ����. ���� ���� �ȵ� ��� �ð��� �ø�����. 10�ʴ� 10000�� 
	 PDFdelay
	 )
	(command "osmode" "4335")
       (setq n (1+ n))
    )
   )
  ) 

(command "filedia" "1"); ���� â ���̰�

  (prompt "\n ��¿Ϸ�!")
)



;;������� ��ġ�� A4 ���
 (defun c:mmm4( / ent pwgs ss1  ppw1 ppw2 vpw1 vpw2 pwwsel pdgscc1 pdgscc pdgscc4 ) 
 (defun *error* (msg)(princ "error: ")(princ msg)
 (setvar "osmode" 0)
 (princ))
 (vl-load-com)
 (setq ent nil)

 (prompt "\n ����Ʈ �� ������ �����ϼ���(������ε� ����ܰ�) !!" ) 
 (setq pwgs (ssget (list (cons 0 "insert"))))

	;; Doug C. Broad, Jr.
	;; can be used with vla-transformby to
	;; transform objects from the UCS to the WCS
	(defun UCS2WCSMatrix ()
	(vlax-tmatrix
	(append
	(mapcar
	'(lambda (vector origin)
	(append (trans vector 1 0 t) (list origin))
	)
	(list '(1 0 0) '(0 1 0) '(0 0 1))
	(trans '(0 0 0) 0 1)
	)
	(list '(0 0 0 1))
	)
	)
	)
	;; transform objects from the WCS to the UCS
	(defun WCS2UCSMatrix ()
	(vlax-tmatrix
	(append
	(mapcar
	'(lambda (vector origin)
	(append (trans vector 0 1 t) (list origin))
	)
	(list '(1 0 0) '(0 1 0) '(0 0 1))
	(trans '(0 0 0) 1 0)
	)
	(list '(0 0 0 1))
	)
	)
	)


  (if pwgs
   (progn
    (setq ss1 pwgs)
    (setq n 0)
    (repeat (sslength ss1)
    (setq ent (ssname ss1 n))


	(vla-TransformBy (vlax-ename->vla-object ent) (UCS2WCSMatrix))
	(vla-getboundingbox (vlax-ename->vla-object ent) 'MinPt 'MaxPt)
	(vla-TransformBy (vlax-ename->vla-object ent) (WCS2UCSMatrix))
	;### ��������� ���� UCS ������ ���� ��� 
	;(vla-GetBoundingBox (vlax-ename->vla-object ent) 'MinPt 'MaxPt)

  (setq ppw1 (vlax-safearray->list MinPt)) 
  (setq ppw2 (vlax-safearray->list MaxPt))

  (setq vpw1 (list (car ppw2) (cadr ppw1)));������
  (setq vpw2 (list (car ppw1) (cadr ppw2))) ;�»���

  (setq wx (- (car ppw2) (car ppw1)) ) ;������
  (setq wy (- (cadr ppw2) (cadr ppw1)) );����
  (if (> wx wy) (setq wlpa4 "l") (setq wlpa4 "p"))

  (setq pwwsel (ssget "W" ppw1 ppw2 ));��ü����
  (setq pdgscc1 (distance ppw1 ppw2))

; lt������ �����Ϸ��� ���� �ּ� �����ϸ� ��. ���� �׸��� ���鿡���� �ʿ� ��� �ּ� ó����.
;  (setq pdgscc4 (* pdgscc 4 )) ;ltscale ��������4��
;  (setvar "ltscale"  pdgscc4) ; ġ�������� ������ô�� ���� 

  (setvar "osmode" 4335)

; �Ʒ� ���� �߰���. ������ ������ ���缭 ����ϵ��� ����ϱ�
  (setq PLOTSCALEA4 (STRCAT "1=" (rtos (/ pdgscc1 pdgsccpapera4) 2 0)))

; scale �������� _ fit  ��������, on ������ ����
  (if (= pppscaleonfit "fit") (setq PLOTSCALEA4 "fit") (setq PLOTSCALEA4 PLOTSCALEA4))


; (command "zoom" ppw1 ppw2) ; ������ ��������

      (command "-PLOT"  
               "Y" 
               ""                        
               plotername               ;�������̸�
               papernamea4                   ;���� ũ��
               "M"                   ;�и����� ��ġ
               wlpa4                    ;������ ���� ���� �Ǵ��� L, P ����
               "N" 
               "W"
               ppw2 ppw1
               PLOTSCALEA4
               "C"
               "Y"   
               ctbnameA4
               "Y"                    ;������ġ�÷�
               "N"                    ;������ġ�÷� ��ô�� ����
	       mmmvorder              ;������������÷�
               mmmvhide               ;���������ü����� 20200326 N���� ���� (���� �ܰ��� ������ ������)
	       "N"                    ;�÷� ��������
	       "N"                    ;�÷� ��������
               "Y"                    ;�÷�����
       )                     
	(command "osmode" "4335")
       (setq n (1+ n))
    )
   )
  ) 

  (prompt "\n ��¿Ϸ�!")
)



;; ���⿡������ ������ A4 PDF�����
 
 ;;�Ʒ��� PDF�� ����ϴ� �뵵�� �����Դϴ�. CTB�� ���� ��� �뵵�� �����ϰ� ���󰩴ϴ�.
; (setq P_plotername "DWG to PDF.pc3");PDF����� �÷��� �̸� (Adobe PDF.pc3�� ���� ���� ������ �� �ȵ˴ϴ�.)
; (setq P_papername "ISO Ȯ�� A3 (420.00 x 297.00 MM)") ; ���� ũ��� A3 ���� ���� ����, �����͸��� ���� �ٸ��� Ȯ�ιٶ�. 
; (setq P_papernamea4 "ISO Ȯ�� A4 (297.00 x 210.00 MM)") ; ���� ũ��� A3 ���� ���� ����, �����͸��� ���� �ٸ��� Ȯ�ιٶ�. 
			 ;��) ISO ��ü������ A3(420.00 x 297.00 mm) ������ ������
; (setq PATH (getvar "c:\\pdf\\"))	;;; pdf���� ���� ��ġ ����� c:\pdf ������. ���� ���� ���� ���弼��.
; (setq PDFdelay 3000) ;PDF������ ��Ǯ�� �ȵǹǷ� 3�� ������ ����. �������� ���� ���� �ȵ� ��� �ð��� �ø�����. 10�ʴ� 10000��

 (defun c:pdfm4( / ent pwgs ss1 ppw1 ppw2 vpw1 vpw2 pwwsel pdgscc1 pdgscc pdgscc4 wlpa4) 

 (defun *error* (msg)(princ "error: ")(princ msg)
  (setvar "osmode" 0)
 (princ))
 (vl-load-com)
 (setq ent nil)

 (prompt "\n ����Ʈ �� ������ �����ϼ���(������ε� ����ܰ�) !!" ) 
 (setq pwgs (ssget (list (cons 0 "insert"))))

	;; Doug C. Broad, Jr.
	;; can be used with vla-transformby to
	;; transform objects from the UCS to the WCS
	(defun UCS2WCSMatrix ()
	(vlax-tmatrix
	(append
	(mapcar
	'(lambda (vector origin)
	(append (trans vector 1 0 t) (list origin))
	)
	(list '(1 0 0) '(0 1 0) '(0 0 1))
	(trans '(0 0 0) 0 1)
	)
	(list '(0 0 0 1))
	)
	)
	)
	;; transform objects from the WCS to the UCS
	(defun WCS2UCSMatrix ()
	(vlax-tmatrix
	(append
	(mapcar
	'(lambda (vector origin)
	(append (trans vector 0 1 t) (list origin))
	)
	(list '(1 0 0) '(0 1 0) '(0 0 1))
	(trans '(0 0 0) 1 0)
	)
	(list '(0 0 0 1))
	)
	)
	)


  (if pwgs
   (progn
    (setq ss1 pwgs)
    (setq n 0)
    (repeat (sslength ss1)
    (setq ent (ssname ss1 n))


	(vla-TransformBy (vlax-ename->vla-object ent) (UCS2WCSMatrix))
	(vla-getboundingbox (vlax-ename->vla-object ent) 'MinPt 'MaxPt)
	(vla-TransformBy (vlax-ename->vla-object ent) (WCS2UCSMatrix))
	;### ��������� ���� UCS ������ ���� ��� 
	;(vla-GetBoundingBox (vlax-ename->vla-object ent) 'MinPt 'MaxPt)

  (setq ppw1 (vlax-safearray->list MinPt)) 
  (setq ppw2 (vlax-safearray->list MaxPt))

  (setq vpw1 (list (car ppw2) (cadr ppw1)));������
  (setq vpw2 (list (car ppw1) (cadr ppw2))) ;�»���

  (setq wx (- (car ppw2) (car ppw1)) ) ;������
  (setq wy (- (cadr ppw2) (cadr ppw1)) );����
  (if (> wx wy) (setq wlpa4 "l") (setq wlpa4 "p"))

  (setq pwwsel (ssget "W" ppw1 ppw2 ));��ü����
  (setq pdgscc1 (distance ppw1 ppw2))
  (setq pdgscc (/ pdgscc1 pdgsccpapera4 )) ; ����ô�� �밢���̷� ������ A3����(���� �� ũ�� Ʋ�� ��� ���⸦ �����ָ� ��)

; lt������ �����Ϸ��� ���� �ּ� �����ϸ� ��. ���� �׸��� ���鿡���� �ʿ� ��� �ּ� ó����.
;  (setq pdgscc4 (* pdgscc 4 )) ;ltscale ��������4��
;  (setvar "ltscale"  pdgscc4) ; ġ�������� ������ô�� ���� 

  (setvar "osmode" 4335)

; �Ʒ� ���� �߰���. ������ ������ ���缭 ����ϵ��� ����ϱ�
  (setq PLOTSCALEA4 (STRCAT "1=" (rtos (/ pdgscc1 pdgsccpapera4) 2 0)))

; scale �������� _ fit  ��������, on ������ ����
  (if (= pppscaleonfit "fit") (setq PLOTSCALEA4 "fit") (setq PLOTSCALEA4 PLOTSCALEA4))

 (setq filetime (rtos (getvar "cdate") 2 6)) ; �̸��� ���� �ð�

; PDF���� �̸��� ���� ĳ������_����ð�.pdf��
 (setq fname (getvar "dwgname"))
 (setq fname (substr fname 1 (- (strlen fname) 4)))
 (setq sffx (rtos (getvar "cdate") 2 6));;; �ð� �ҷ�����
; (setq fname (strcat PATH fname sffx ".pdf")) 
 (setq fname (strcat "c:\\pdf\\" fname "_" sffx ".pdf")) 



; (command "zoom" P_ppw1 P_ppw2) ; ������ ��������
 (command "filedia" "0"); ���� â �Ⱥ��̰�, ���̰��Ϸ��� fildia ��� �� 1 �Է�

      (command "-PLOT"  
               "Y" 
               ""                         ;��ġ���� �����
               P_plotername               ;�������̸�
               P_papernamea4                   ;���� ũ��
               "M"                   ;�и�����
               wlpa4                    ;������ ���� ���� �Ǵ��� L, P ����
               "N" 
               "W"
               ppw2 ppw1
               PLOTSCALEA4
               "C"
               "Y"   
               ctbnameA4
               "Y"                    ;������ġ�÷�
               "N"                    ;������ġ�÷� ��ô�� ����
	       mmmvorder              ;������������÷�
               mmmvhide               ;���������ü����� 20200326 N���� ���� (���� �ܰ��� ������ ������)
	       fname			;���� �̸� c:\pdf ���� �ȿ� ����ð�.pdf�� ����
	       "N"                    ;�÷� ��������
               "Y"                    ;�÷�����
       )                     
	 (command "delay"		;PDF������ ��Ǯ�� �ȵǹǷ� 5�� ������ ����. ���� ���� �ȵ� ��� �ð��� �ø�����. 10�ʴ� 10000�� 
	 PDFdelay
	 )
	(command "osmode" "4335")
       (setq n (1+ n))
    )
   )
  ) 

(command "filedia" "1"); ���� â ���̰�

  (prompt "\n ��¿Ϸ�!")
)


;;===========================================================
; ����ϱ� �޴� 2023.12.28. Kim Hyun Chul (kimhyunchul.co.kr)
;  ->������ ������ ����ϴ� ����
;;------ PPP_autocad_Menu.dcl / PPP_autocad_Menu / PPP_autocad_Plot --------------------------------
(defun c:pppp(/ dlgid dname lno ra1 ra2 ra3 ra4 ra5 ra6 ra7 ra8 tem)
   (setq dlgid (load_dialog "c:/PDF/PPP/PPP_autocad.dcl"))
   (setq dname "ppp_dcl_autocad")
   (if (not (new_dialog dname dlgid)) (exit))
   (setq lno nil tem 3)
   (set_tile "ra1" "1")
   (action_tile "ra1" "(setq lno $key)")
   (action_tile "ra2" "(setq lno $key)")
   (action_tile "ra3" "(setq lno $key)")
   (action_tile "ra4" "(setq lno $key)")
   (action_tile "ra5" "(setq lno $key)")
   (action_tile "ra6" "(setq lno $key)")
   (action_tile "ra7" "(setq lno $key)")
   (action_tile "ra8" "(setq lno $key)")
   (action_tile "accept"  "(setq tem 9)(done_dialog)")
   (start_dialog)
   (unload_dialog dlgid)
   (if (= tem 9) (progn
      (if (= lno nil) (setq lno "ra1"))
      (cond
         ((= lno "ra1") (c:ppp))
         ((= lno "ra2") (c:pdf))
         ((= lno "ra3") (c:ppp4))
         ((= lno "ra4") (c:pdf4))
         ((= lno "ra5") (c:mmm))
         ((= lno "ra6") (c:pdfm))
         ((= lno "ra7") (c:mmm4))
         ((= lno "ra8") (c:pdfm4))
      )
   ))
(prin1))
