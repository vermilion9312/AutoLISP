(defun c:pa4()

(setq oldOsmode (getvar "osmode"))
(setvar "osmode" 1)

(setvar "cmdecho" 0)


(setq firstPoint (getpoint "\n윈도우 왼쪽 위 좌표를 입력하십시오"))
(setq secondPoint (getcorner firstPoint "\n윈도우 오른쪽 아래 좌표를 입력하십시오"))


(command "-PLOT" "yes" "model" "FF K505p for ApeosPort C3570" "A4(210x297mm)" "millimeter" "landscape" "no" "window"
firstPoint
secondPoint
"fit" "center" "yes" "monochrome.ctb" "yes" "a" "no" "no" "yes")

(setvar "osmode" oldOsmode)
(princ)
)