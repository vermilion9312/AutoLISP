(defun c:qq ()
  (strlen (get_entity_name))
  (princ)
)


(defun get_entity_name ()
  (car (entsel))
)