(defun c:qw ()
  (setq ss (ssget)) ; 사용자로부터 선택 집합을 받음
  (setq obj_list '()) ; 정렬할 객체를 담을 리스트

  ; 선택 집합에 속한 객체를 반복하여 리스트에 추가
  (if ss
    (progn
      (setq i 0)
      (while (< i (sslength ss))
        (setq obj (entget (ssname ss i)))
        (setq x_coord (cadr (assoc 10 obj))) ; 객체의 x 좌표 값 가져오기
        (setq y_coord (caddr (assoc 10 obj))) ; 객체의 y 좌표 값 가져오기
        (setq obj_list (cons (cons obj (cons x_coord y_coord)) obj_list)) ; 객체와 x, y 좌표 값을 리스트에 추가
        (setq i (1+ i))
      )
    )
  )

  ; x 좌표 값을 기준으로 먼저 정렬하고, 그 다음 y 좌표 값을 기준으로 정렬
  (setq sorted_list (vl-sort obj_list '(lambda (a b)
                                         (if (= (car a) (car b)) ; x 좌표 값이 같으면 y 좌표 값으로 비교
                                           (< (cadr a) (cadr b))
                                           (< (car a) (car b))
                                         )
                                       )
                            )
  )

  ; 정렬된 객체를 화면에 표시
  (foreach obj sorted_list
    (entmake (car obj))
  )
  (princ)
)
