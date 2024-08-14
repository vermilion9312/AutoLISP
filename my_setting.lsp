(my_setting)

(defun my_setting()
  (vl-load-com)
  
  (setvar 'STARTMODE 0)
  (setvar 'STARTUP 0)
  (setvar 'OSMODE 55)
  (setvar 'PICKBOX 15)
  (setvar 'SHORTCUTMENU 0)
  
  (setq acadObj (vlax-get-acad-object))
  (setq preferences (vlax-get-property acadObj 'Preferences))
  (setq display (vlax-get-property preferences 'Display))
  
  ;; RGB 값을 설정합니다. 여기서 255 255 255는 흰색입니다.
  (setq colorValue (list 39 40 34))  ;; 흰색 배경
  
  ;; 배경색을 설정합니다.
  (vlax-put-property display 'ModelBackgroundColor colorValue)
  
  (setq magentaColor 6)
  (vlax-put-property display 'CrosshairColor magentaColor)
  
  (princ)
)