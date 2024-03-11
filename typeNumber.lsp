(defun c:qq ()
  (setq number (getint "\n시작 숫자를 입력하세요: "))
  (while T
    (command "change" pause "" "" "" "GHS" "" "" number)
    (setq number (1+ number))
  )
  (princ)
)