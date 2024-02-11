(defun c:xx ()
  
  (setq centerPoint (getpoint "\n삽입점 입력:"))
  
  (entmake (list (cons 0 "CIRCLE") (cons 10 centerPoint) (cons 40 (* 5 (CONSTANT "TEMP")))))

)

(defun CONSTANT (string)
  (cond
    ((= string "TEMP") (setq return 0.333))
  )
  
  return
)
