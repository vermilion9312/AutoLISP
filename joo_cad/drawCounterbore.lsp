(load "holeSpecs.lsp")
(load "drawShape.lsp")

(defun draw_counterbore_top (center_point tap_size / drill_diameter counterbore_diameter)
  (setq drill_diameter       (nth 0 (get_counterbore_spec tap_size)))
  (setq counterbore_diameter (nth 1 (get_counterbore_spec tap_size)))
  
  (draw_circle_diameter center_point drill_diameter)
  (draw_circle_diameter center_point counterbore_diameter)
)

(defun draw_counterbore_section (start_point end_point tap_size theta / drill_diameter counterbore_diameter counterbore_depth x0 x1 x2 y0 y1 y2 y3)
  (setq drill_diameter       (nth 0 (get_counterbore_spec tap_size)))
  (setq counterbore_diameter (nth 1 (get_counterbore_spec tap_size)))
  (setq counterbore_depth    (nth 2 (get_counterbore_spec tap_size)))
  
  (setq x0 (nth 0 start_point))
  (setq x1 (+ (nth 0 start_point) counterbore_depth))
  (setq x2 (nth 0 end_point))
  
  (setq y0 (- (nth 1 start_point) (/ counterbore_diameter 2.0)))
  (setq y1 (- (nth 1 start_point) (/ drill_diameter       2.0)))
  (setq y2 (+ (nth 1 start_point) (/ drill_diameter       2.0)))
  (setq y3 (+ (nth 1 start_point) (/ counterbore_diameter 2.0)))
  
  

  (draw_line (rotate_vertor (list x0 y0) theta) (rotate_vertor (list x1 y0) theta))
  (draw_line (rotate_vertor (list x1 y1) theta) (rotate_vertor (list x2 y1) theta))
  (draw_line (rotate_vertor (list x1 y2) theta) (rotate_vertor (list x2 y2) theta))
  (draw_line (rotate_vertor (list x0 y3) theta) (rotate_vertor (list x1 y3) theta))
  (draw_line (rotate_vertor (list x1 y0) theta) (rotate_vertor (list x1 y3) theta))

  
  ; (draw_line (list x0 y0) (list x1 y0))
  ; (draw_line (list x1 y1) (list x2 y1))
  ; (draw_line (list x1 y2) (list x2 y2))
  ; (draw_line (list x0 y3) (list x1 y3))
  ; (draw_line (list x1 y0) (list x1 y3))
)  
