(defun c:qq (/ default_cmdecho)
  (setq default_cmdecho (getvar "CMDECHO"))
  (setvar "CMDECHO" 0)
  
  (entget (car (entsel)))
  
  (setvar "CMDECHO" default_cmdecho)
  
  (princ)
)