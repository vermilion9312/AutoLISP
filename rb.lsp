(defun c:82(/ ent bname rebname elist)
	(setq ent (car (entsel "\n이름을 바꿀 블록을 선택하세요.")))
	(while 
		(/= "INSERT" (cdr (assoc 0 (entget ent))))
		(setq ent (car (entsel "\n블록이 아닙니다. 다시 선택하세요.")))
	)
	(setq bname (getstring T "\n선택한 블록의 새 이름을 입력하세요 : "));getstring 뒤에 T를 입력해야 Spacebar의 입력을 받을 수 있습니다.
	(while
		(tblsearch "block" bname)
		(progn
			;(alert (strcat "입력한 " bname "은 이미 사용 중입니다."));alert를 사용하면, 경고메세지가 팝업 창으로 나타납니다.
			(setq rebname (strcat "입력한 " bname "은 이미 사용 중입니다. 다시 입력하세요. : "))
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