(defun get_counterbore_spec (tap_size)
  (cond                  ; dril  C/B  Depth
    ((= tap_size  3) (list  3.4  6.5  3.3))
    ((= tap_size  4) (list  4.5  8.0  4.4))
    ((= tap_size  5) (list  5.5  9.5  5.4))
    ((= tap_size  6) (list  6.6 11.0  6.5))
    ((= tap_size  8) (list  9.0 14.0  8.6))
    
    ((= tap_size 10) (list 11.0 17.5 10.8))
    ((= tap_size 12) (list 14.0 20.0 13.0))
    ((= tap_size 14) (list 16.0 23.0 15.2))
    ((= tap_size 16) (list 18.0 26.0 17.5))
    ((= tap_size 18) (list 20.0 29.0 19.5))
    
    ((= tap_size 20) (list 22.0 32.0 21.5))
    ((= tap_size 22) (list 24.0 35.0 23.5))
    ((= tap_size 24) (list 26.0 39.0 25.5))
    ((= tap_size 27) (list 30.0 43.0 29.0))
    ((= tap_size 30) (list 33.0 48.0 32.0))
    
    ((= tap_size 33) (list 36.0 54.0 35.0))
    
    (t nil)
  )
)