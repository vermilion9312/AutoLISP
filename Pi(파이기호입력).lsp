(defun c:pi ()   

   (princ "=pi()")  
   (command "dimoverride" "dimpost" "%%c<>" "") 
   (prompt "\nǥ���� ġ���� �����ϼ���.")

   (princ)
)

 
;-PCD : (COMMAND "dimoverride" "dimpost" "PCD<>" "")
;-�߽ɿ� ���� : (COMMAND "dimoverride" "dimpost" "<> CENTRAL" "")
;-��ȣ : (COMMAND "dimoverride" "dimpost" "(<>)" "")
;-���� : (COMMAND "dimoverride" "dimpost" "<> REF" "")
;-�簢 : (COMMAND "dimoverride" "dimpost" "�� <>" "")
;-��� : (COMMAND "dimoverride" "dimpost" "<> EQ. SPACED" "")
;-���� : (COMMAND "dimoverride" "dimpost" "<> DEPTH" "")
;-�� : (COMMAND "dimoverride" "dimpost" "��<>" "")
;-ö : (COMMAND "dimoverride" "dimpost" "��<>" "")
;-�ٱ��� : (COMMAND "dimoverride" "dimpost" "<> OUT SIDE" "")
;-���� : (COMMAND "dimoverride" "dimpost" "<> IN SIDE" "")
