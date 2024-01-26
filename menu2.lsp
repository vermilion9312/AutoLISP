(defun makeCircle (centerPoint innerDia outerDia)
  (entmake (list (cons 0 "CIRCLE") (cons 10 centerPoint) (cons 40 (/ innerDia 2))))
  (entmake (list (cons 0 "CIRCLE") (cons 10 centerPoint) (cons 40 (/ outerDia 2))))
)

(defun c:66 ()
  (setq view (getstring "\n ī���ͺ��� �� ���� [T(��鵵)/S(�ܸ鵵)]: "))
  
  (while (and (/= view "t") (/= view "T") (/= view "s") (/= view "S"))
    (princ "\n �ɼ� Ű���带 �Է��ϼ���")
    (setq view (getstring "\n ī���ͺ��� �� ���� [T(��鵵)/S(�ܸ鵵)]: "))
  )
  
  (if (or (= view "t") (= view "T"))

  )
  
  (if (or (= view "s") (= view "S"))

  )
)