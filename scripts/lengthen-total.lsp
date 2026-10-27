;; lengthen-total.lsp - Set the total length of the selection
;; Command: LTOTAL
(defun c:LTOTAL ( / ss val )
  (setq ss (ssget '((0 . "LINE,ARC,LWPOLYLINE,POLYLINE"))))
  (if ss
    (progn
      (setq val (getreal "\nNew total length: "))
      (if val (command "_.LENGTHEN" "_T" val ss ""))
    )
    (princ "\nNothing selected.")
  )
  (princ)
)
