(defun c:82(/ ent bname rebname elist)
	(setq ent (car (entsel "\n�̸��� �ٲ� ����� �����ϼ���.")))
	(while 
		(/= "INSERT" (cdr (assoc 0 (entget ent))))
		(setq ent (car (entsel "\n����� �ƴմϴ�. �ٽ� �����ϼ���.")))
	)
	(setq bname (getstring T "\n������ ����� �� �̸��� �Է��ϼ��� : "));getstring �ڿ� T�� �Է��ؾ� Spacebar�� �Է��� ���� �� �ֽ��ϴ�.
	(while
		(tblsearch "block" bname)
		(progn
			;(alert (strcat "�Է��� " bname "�� �̹� ��� ���Դϴ�."));alert�� ����ϸ�, ���޼����� �˾� â���� ��Ÿ���ϴ�.
			(setq rebname (strcat "�Է��� " bname "�� �̹� ��� ���Դϴ�. �ٽ� �Է��ϼ���. : "))
			(setq bname (getstring T rebname))
		)
	)
	(setq elist (entget (cdr (assoc 330 (entget (tblobjname "block" (cdr (assoc 2 (entget ent)))))))))
	(entmod (subst (cons 2 bname) (assoc 2 elist) elist))
	(princ)
)
(princ "\nCreated by Trusted_dwg")
(princ "\nRename Block. Command : RB")
(princ "\nNaver Blog : https://blog.naver.com/trusted_dwg")
(princ "\nYoutube : https://www.youtube.com/trusted_dwg")
(princ)