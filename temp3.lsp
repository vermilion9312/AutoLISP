(defun c:xx ()
  (princ "\n자를 선을 선택하세요")
  (setq selectionSet1 (ssget))
  ; (princ "\n기준선을 선택하세요")
  ; (setq selectionSet2 (ssget))
  (princ (ssname selectionSet1))
  ; (foreach *Item (ssnamex selectionSet1)
  ;   (setq *Ename (cadr *Item))
  ;   (princ *Ename)
  ; )
)