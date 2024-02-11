(defun c:b_01 ()
  (setq dcl_id (load_dialog "book"))
  (if (not (new_dialog "test_dialog" dcl_id)) (exit))

  (action_tile "sample" "(setq sample $value)")

  (start_dialog)
  (done_dialog)
  (unload_dialog dcl_id)
)

(defun c:b_02 ()

  (setq dcl_id (load_dialog "book"))
  (if (not (new_dialog "test_button" dcl_id)) (exit))

  (action_tile "test_01" "(setq test_01 $value)")


  (start_dialog)
  (done_dialog)
  (unload_dialog dcl_id)
  (princ)
)

(defun c:b_03 ()

  (setq dcl_id (load_dialog "book"))
  (if (not (new_dialog "test_edit_box" dcl_id)) (exit))

  (action_tile "test_02" "(setq test_02 $value)")

  (start_dialog)
  (done_dialog)
  (unload_dialog dcl_id)
  (princ)
)

(defun c:b_04 ()

  (setq dcl_id (load_dialog "book"))
  (if (not (new_dialog "test_image_button" dcl_id)) (exit))

  (setq x (dimx_tile "test_image"))
  (setq y (dimy_tile "test_image"))
  (start_image "test_image")
  (slide_image 0 0 x y "sample")
  (end_image)

  (start_dialog)
  (done_dialog)
  (unload_dialog dcl_id)
  (princ)
)

(defun c:b_05 ()

  (setq dcl_id (load_dialog "book"))
  (if (not (new_dialog "test_list_box" dcl_id)) (exit))

  (action_tile "slist" "(setq slist $value)")

  (start_dialog)
  (done_dialog)
  (unload_dialog dcl_id)
  (princ)
)

(defun c:b_06 ()

  (setq dcl_id (load_dialog "book"))
  (if (not (new_dialog "test_popup_list" dcl_id)) (exit))

  (action_tile "plist" "(setq plist $value)")

  (start_dialog)
  (done_dialog)
  (unload_dialog dcl_id)
  (princ)
)

(defun c:b_07 ()

  (setq dcl_id (load_dialog "book"))
  (if (not (new_dialog "test_radio_button" dcl_id)) (exit))

  (action_tile "b_rb" "(setq b_rb $value)")
  (action_tile "n_rb" "(setq n_rb $value)")

  (start_dialog)
  (done_dialog)
  (unload_dialog dcl_id)
  (princ)
)

(defun c:b_08 ()

  (setq dcl_id (load_dialog "book"))
  (if (not (new_dialog "test_slider" dcl_id)) (exit))

  (action_tile "ts" "(setq ts $value)")

  (start_dialog)
  (done_dialog)
  (unload_dialog dcl_id)
  (princ)
)

(defun c:b_09 ()

  (setq dcl_id (load_dialog "book"))
  (if (not (new_dialog "test_toggle" dcl_id)) (exit))

  (action_tile "ad" "(setq ad $value)")

  (start_dialog)
  (done_dialog)
  (unload_dialog dcl_id)
  (princ)
)

(defun c:b_10 ()

  (setq dcl_id (load_dialog "book"))
  (if (not (new_dialog "test_column" dcl_id)) (exit))

  (action_tile "leng" "(setq leng $value)")
  (action_tile "ang" "(setq ang $value)")

  (start_dialog)
  (done_dialog)
  (unload_dialog dcl_id)
  (princ)
)

(defun c:b_11 ()

  (setq dcl_id (load_dialog "book"))
  (if (not (new_dialog "test_boxed_column" dcl_id)) (exit))

  (action_tile "leng" "(setq leng $value)")
  (action_tile "ang" "(setq ang $value)")

  (start_dialog)
  (done_dialog)
  (unload_dialog dcl_id)
  (princ)
)

(defun c:b_12 ()

  (setq dcl_id (load_dialog "book"))
  (if (not (new_dialog "test_row" dcl_id)) (exit))

  (action_tile "one" "(setq one $value)")
  (action_tile "two" "(setq two $value)")

  (start_dialog)
  (done_dialog)
  (unload_dialog dcl_id)
  (princ)
)

(defun c:b_13 ()

  (setq dcl_id (load_dialog "book"))
  (if (not (new_dialog "test_boxed_row" dcl_id)) (exit))

  (action_tile "one" "(setq one $value)")
  (action_tile "two" "(setq two $value)")

  (start_dialog)
  (done_dialog)
  (unload_dialog dcl_id)
  (princ)
)

(defun c:b_14 ()

  (setq dcl_id (load_dialog "book"))
  (if (not (new_dialog "test_radio_column" dcl_id)) (exit))

  (action_tile "one" "(setq one $value)")
  (action_tile "two" "(setq two $value)")
  (action_tile "three" "(setq three $value)")

  (start_dialog)
  (done_dialog)
  (unload_dialog dcl_id)
  (princ)
)

(defun c:b_15 ()

  (setq dcl_id (load_dialog "book"))
  (if (not (new_dialog "test_radio_column1" dcl_id)) (exit))

  (action_tile "one" "(setq one $value)")
  (action_tile "two" "(setq two $value)")
  (action_tile "three" "(setq three $value)")

  (start_dialog)
  (done_dialog)
  (unload_dialog dcl_id)
  (princ)
)

(defun c:b_16 ()

  (setq dcl_id (load_dialog "book"))
  (if (not (new_dialog "test_boxed_radio_column" dcl_id)) (exit))

  (action_tile "one" "(setq one $value)")
  (action_tile "two" "(setq two $value)")
  (action_tile "three" "(setq three $value)")

  (start_dialog)
  (done_dialog)
  (unload_dialog dcl_id)
  (princ)
)

(defun c:b_17 ()

  (setq dcl_id (load_dialog "book"))
  (if (not (new_dialog "test_radio_row" dcl_id)) (exit))

  (action_tile "one" "(setq one $value)")
  (action_tile "two" "(setq two $value)")
  (action_tile "three" "(setq three $value)")

  (start_dialog)
  (done_dialog)
  (unload_dialog dcl_id)
  (princ)
)

(defun c:b_18 ()

  (setq dcl_id (load_dialog "book"))
  (if (not (new_dialog "test_boxed_radio_row" dcl_id)) (exit))

  (action_tile "one" "(setq one $value)")
  (action_tile "two" "(setq two $value)")
  (action_tile "three" "(setq three $value)")

  (start_dialog)
  (done_dialog)
  (unload_dialog dcl_id)
  (princ)
)
(defun c:b_19 ()

  (setq dcl_id (load_dialog "book"))
  (if (not (new_dialog "test_ok1" dcl_id)) (exit))

  (start_dialog)
  (done_dialog)
  (unload_dialog dcl_id)
  (princ)
)

(defun c:b_20 ()

  (setq dcl_id (load_dialog "book"))
  (if (not (new_dialog "test_ok_cancel" dcl_id)) (exit))

  (start_dialog)
  (done_dialog)
  (unload_dialog dcl_id)
  (princ)
)

(defun c:b_21 ()

  (setq dcl_id (load_dialog "book"))
  (if (not (new_dialog "test_ok_cancel_help" dcl_id)) (exit))

  (start_dialog)
  (done_dialog)
  (unload_dialog dcl_id)
  (princ)
)
(defun c:b_22 ()

  (setq dcl_id (load_dialog "book"))
  (if (not (new_dialog "test_ok_cancel_help_info" dcl_id)) (exit))

  (start_dialog)
  (done_dialog)
  (unload_dialog dcl_id)
  (princ)
)
(defun c:b_23 ()
    (alert "ERROR MESSAGE")
)
