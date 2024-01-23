(defun c:28()

(setq oldOsmode (getvar "osmode"))
(setvar "osmode" 32)

(setq listEntity (entsel "\n객체 선택"))
(setq listPoint (getpoint "\n끊을 점을 선택"))
(command "BREAK" listEntity "first" listPoint listPoint)

(setvar "osmode" oldOsmode)
(princ)
)