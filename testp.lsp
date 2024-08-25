; (defun c:qq ()
;   (setq filter_block (list (cons 0 "INSERT")))
;   (ssget filter_block)
  
;   ; (setq entity_name (entget (car (entsel))))
;   ; (setq block_name (cdr (assoc 2 entity_name)))
;   ; (princ block_name)
;   (princ)
; )

(defun splitString (str sep / start end result)
  (setq start 0 end 0 result '())
  (while (setq end (vl-string-search sep str start))
    (setq result (append result (list (substr str (+ start 1) (- end start)))))
    (setq start (+ end 1))
  )
  (setq result (append result (list (substr str (+ start 1)))))
  result
)

(defun compareBOM (a b)
  (if (< (atoi (nth 0 (splitString (car a) "_"))) (atoi (nth 0 (splitString (car b) "_"))))
    -1
    (if (> (atoi (nth 0 (splitString (car a) "_"))) (atoi (nth 0 (splitString (car b) "_"))))
      1
      0
    )
  )
)

(defun c:qq ( / ss count-list entity ename block-name parts bom-order product-name material i)
  ;; 선택 세트 얻기
  (setq ss (ssget '((0 . "INSERT"))))
  
  ;; 블록 이름과 개수 저장을 위한 리스트 초기화
  (setq count-list '())
  
  ;; 선택 세트가 유효한지 확인
  (if ss
    (progn
      ;; 선택 세트의 각 객체 순회
      (setq i 0)
      (repeat (sslength ss)
        (setq ename (ssname ss i))  ; 선택 세트에서 객체 이름 가져오기
        (setq entity (entget ename)) ; 객체의 엔티티 데이터 가져오기
        (setq block-name (cdr (assoc 2 entity))) ; 블록 이름 가져오기
        
        ;; 블록 이름을 BOM 순서, 제품 이름, 재질로 분리
        (setq parts (splitString block-name "_"))
        (setq bom-order (nth 0 parts))
        (setq product-name (nth 1 parts))
        (setq material (nth 2 parts))
        
        ;; 이미 리스트에 존재하는 블록 이름인지 확인
        (if (assoc block-name count-list)
          ;; 존재하면 개수 증가
          (setq count-list
                (subst (cons block-name (1+ (cdr (assoc block-name count-list))))
                       (assoc block-name count-list)
                       count-list))
          ;; 존재하지 않으면 리스트에 추가
          (setq count-list (cons (cons block-name 1) count-list))
        )
        (setq i (1+ i))
      )
      
      ;; BOM 리스트 정렬
      (setq count-list (vl-sort count-list 'compareBOM))
      
      ;; BOM 표 생성
      (setq startX 0.0) ; 표 시작 X 좌표
      (setq startY 0.0) ; 표 시작 Y 좌표
      (setq rowHeight 2.5) ; 행 높이
      (setq colWidths (list 5.0 20.0 10.0 5.0)) ; 열 너비
      
      ;; 표 그리기
      (setq row 0)
      (foreach item count-list
        (setq block-name (car item))
        (setq parts (splitString block-name "_"))
        (setq bom-order (nth 0 parts))
        (setq product-name (nth 1 parts))
        (setq material (nth 2 parts))
        (setq count (cdr item))
        
        ;; 행 그리기
        (vl-cmdf "_.LINE" 
                 (list startX (+ startY (* rowHeight row))) 
                 (list (+ startX (nth 0 colWidths)) (+ startY (* rowHeight row))) "")
        (vl-cmdf "_.LINE" 
                 (list startX (+ startY (* rowHeight row))) 
                 (list startX (+ startY (* rowHeight (1+ row)))) "")
        (vl-cmdf "_.LINE" 
                 (list (+ startX (nth 0 colWidths)) (+ startY (* rowHeight row))) 
                 (list (+ startX (nth 0 colWidths)) (+ startY (* rowHeight (1+ row)))) "")
        
        ;; 데이터 입력
        (vl-cmdf "_.TEXT" 
                 (list (+ startX 1.0) (+ startY (* rowHeight row) 1.0)) 
                 1.5 0 bom-order)
        (vl-cmdf "_.TEXT" 
                 (list (+ startX (nth 0 colWidths) 1.0) (+ startY (* rowHeight row) 1.0)) 
                 1.5 0 product-name)
        (vl-cmdf "_.TEXT" 
                 (list (+ startX (apply '+ (nth 0 colWidths) (nth 1 colWidths)) 1.0) (+ startY (* rowHeight row) 1.0)) 
                 1.5 0 material)
        (vl-cmdf "_.TEXT" 
                 (list (+ startX (apply '+ (nth 0 colWidths) (nth 1 colWidths) (nth 2 colWidths)) 1.0) (+ startY (* rowHeight row) 1.0)) 
                 1.5 0 (itoa count))
        
        (setq row (1+ row))
      )
      
      ;; 표 테두리 그리기
      (vl-cmdf "_.LINE" 
               (list startX startY) 
               (list (+ startX (apply '+ colWidths)) startY) "")
      (vl-cmdf "_.LINE" 
               (list startX (+ startY (* rowHeight row))) 
               (list (+ startX (apply '+ colWidths)) (+ startY (* rowHeight row))) "")
      (vl-cmdf "_.LINE" 
               (list startX startY) 
               (list startX (+ startY (* rowHeight row))) "")
      (vl-cmdf "_.LINE" 
               (list (+ startX (apply '+ colWidths)) startY) 
               (list (+ startX (apply '+ colWidths)) (+ startY (* rowHeight row))) "")
      
    )
    ;; 선택 세트가 비어있을 경우 메시지 출력
    (princ "\nNo blocks selected.")
  )
  
  ;; 명령어 종료 메시지
  (princ)
)

;; 명령어 등록
(princ "\nType 'GenerateBOM' to generate the Bill of Materials.")
(princ)
