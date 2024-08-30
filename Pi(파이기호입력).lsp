(defun c:pi ()   

   (princ "=pi()")  
   (command "dimoverride" "dimpost" "%%c<>" "") 
   (prompt "\n표시할 치수를 선택하세요.")

   (princ)
)

 
;-PCD : (COMMAND "dimoverride" "dimpost" "PCD<>" "")
;-중심에 대한 : (COMMAND "dimoverride" "dimpost" "<> CENTRAL" "")
;-괄호 : (COMMAND "dimoverride" "dimpost" "(<>)" "")
;-참고 : (COMMAND "dimoverride" "dimpost" "<> REF" "")
;-사각 : (COMMAND "dimoverride" "dimpost" "□ <>" "")
;-등간격 : (COMMAND "dimoverride" "dimpost" "<> EQ. SPACED" "")
;-깊이 : (COMMAND "dimoverride" "dimpost" "<> DEPTH" "")
;-요 : (COMMAND "dimoverride" "dimpost" "凹<>" "")
;-철 : (COMMAND "dimoverride" "dimpost" "凸<>" "")
;-바깥쪽 : (COMMAND "dimoverride" "dimpost" "<> OUT SIDE" "")
;-안쪽 : (COMMAND "dimoverride" "dimpost" "<> IN SIDE" "")
