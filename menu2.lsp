(defun makeCircle (centerPoint innerDia outerDia)
  (entmake (list (cons 0 "CIRCLE") (cons 10 centerPoint) (cons 40 (/ innerDia 2))))
  (entmake (list (cons 0 "CIRCLE") (cons 10 centerPoint) (cons 40 (/ outerDia 2))))
)

(defun c:66 ()
  (setq view (getstring "\n 카운터보어 뷰 선택 [T(평면도)/S(단면도)]: "))
  
  (while (and (/= view "t") (/= view "T") (/= view "s") (/= view "S"))
    (princ "\n 옵션 키워드를 입력하세요")
    (setq view (getstring "\n 카운터보어 뷰 선택 [T(평면도)/S(단면도)]: "))
  )
  
  (if (or (= view "t") (= view "T"))

  )
  
  (if (or (= view "s") (= view "S"))

  )
)