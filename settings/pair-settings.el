;===============================================================
; autopair
;===============================================================
;; (require 'autopair)
;; (autopair-global-mode) ;; enable autopair in all buffers

;; (add-hook 'term-mode-hook
;; 		  #'(lambda () 
;; 			  (autopair-mode -1))             ;; for emacsen >= 24
;; 		  )

;; for latex mode -> see AucTex mode
;; (add-hook 'latex-mode-hook 
;;           #'(lambda () (autopair-mode)))

;===============================================================
; smartparen
;===============================================================

(require 'smartparens-config)
(smartparens-global-mode t)
