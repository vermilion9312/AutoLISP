(defun c:32 (/ ent bp)
   (graphscr)

   (prompt " >> 객체 선택 <<")
   (setq ent (ssget ))
   (setq bp (getpoint "\n 삽입점 클릭 : "))(terpri)
   (command "_copybase" bp ent "" "_pasteblock" bp "erase" ent "")
   (princ)
);defun
