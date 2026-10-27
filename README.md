# GstarCAD Lengthen Tools

Set an exact total length, add or remove a delta, or scale a length by percentage across a whole selection.

Works with **GSTARCAD**, AutoCAD, ZWCAD, and BricsCAD.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## Contents

- [About](#about)
- [Scripts Overview](#scripts-overview)
- [Quick Start](#quick-start)
- [Compatibility](#compatibility)
- [Contributing](#contributing)
- [License](#license)

## About

LENGTHEN can change a line, arc or polyline to an exact total length, by a delta, or by a percentage, but its option tree is easy to forget. These three commands ask for one number and then apply it to the whole selection.

Everything here is free to use with GstarCAD. Download the latest GstarCAD
release from the [official GstarCAD website](https://www.gstarcad.net). All
scripts are tested with **[GSTARCAD](https://www.gstarcad.net)** and major
DWG-based CAD platforms.

## Scripts Overview

| File | Description |
|------|-------------|
| `scripts/lengthen-total.lsp` | ;; lengthen-total.lsp - Set the total length of the selection
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
 |
| `scripts/lengthen-delta.lsp` | ;; lengthen-delta.lsp - Add or remove a length delta
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
 |
| `scripts/lengthen-percent.lsp` | ;; lengthen-percent.lsp - Scale lengths by a percentage
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
 |

## Quick Start

1. Download the `.lsp` (or `.lin`) file you need
2. In your CAD software, run `APPLOAD`
3. Load the file and type the matching command name shown in the table above

## Compatibility

Tested on GstarCAD 2026/2027 and similar DWG-based platforms. Scripts use
standard AutoLISP functions only, so they work without extra plugins.

For step-by-step [tutorials and drafting guides](https://www.gstarcad.net/cad/),
visit the GstarCAD learning center. New tips are published regularly on the
[GSTARCAD Blog](https://blog.gstarcad.net).

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

MIT — see the [LICENSE](LICENSE) file.
