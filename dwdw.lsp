(defun c:create-block-at-center ()
  (setq obj (car (entsel "\nSelect an object: ")))

  (if (setq center (vlax-safearray->list (vlax-get obj 'boundingbox)))
    (progn
      (setq center-x (/ (+ (nth 0 center) (nth 3 center)) 2.0))
      (setq center-y (/ (+ (nth 1 center) (nth 4 center)) 2.0))
      (setq center-z (/ (+ (nth 2 center) (nth 5 center)) 2.0))

      (command "_.insert" "blockname" center "" "" "")
    )
  )
)

; 호출
(c:create-block-at-center)