(defun c:BB (/ ent bp)
   (graphscr)

   (prompt " >> ��ü ���� <<")
   (setq ent (ssget ))
   (setq bp (getpoint "\n ������ Ŭ�� : "))(terpri)
   (command "_copybase" bp ent "" "_pasteblock" bp "erase" ent "")
   (princ)
);defun
