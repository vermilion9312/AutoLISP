 (defun loadDialog ()
   
   (setq dclId (load_dialog "holeDialog"))
   
   (if (not (new_dialog "holeDialog" dclId))
     (exit)
   )
   
   (setq returnDialog (start_dialog))
   (unload_dialog dclId)
 )


(defun c:cc ()
  (loadDialog)
  
  (princ)
)