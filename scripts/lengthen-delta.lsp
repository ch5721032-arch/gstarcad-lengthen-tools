;; lengthen-delta.lsp - Add or remove a length delta
;; Command: LDELTA
(defun c:LDELTA ( / ss val )
  (setq ss (ssget '((0 . "LINE,ARC,LWPOLYLINE,POLYLINE"))))
  (if ss
    (progn
      (setq val (getreal "\nLength delta (negative shortens): "))
      (if val (command "_.LENGTHEN" "_DE" val ss ""))
    )
    (princ "\nNothing selected.")
  )
  (princ)
)
