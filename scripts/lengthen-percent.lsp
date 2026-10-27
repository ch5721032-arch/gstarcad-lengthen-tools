;; lengthen-percent.lsp - Scale lengths by a percentage
;; Command: LPCT
(defun c:LPCT ( / ss val )
  (setq ss (ssget '((0 . "LINE,ARC,LWPOLYLINE,POLYLINE"))))
  (if ss
    (progn
      (setq val (getreal "\nPercent of current length <100>: "))
      (if (null val) (setq val 100.0))
      (command "_.LENGTHEN" "_P" val ss "")
    )
    (princ "\nNothing selected.")
  )
  (princ)
)
