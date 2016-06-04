;===============================================================
; markdown
;===============================================================

(setq markdown-command "/usr/local/bin/multimarkdown")
(setq markdown-command "/usr/local/bin/pandoc -s --mathml")

;; demote-key
(add-hook 'markdown-mode-hook
		  (function (lambda ()
					  (local-set-key (kbd "C-c <right>") 'markdown-demote)
					  (local-set-key (kbd "C-c <left>") 'markdown-promote)
					  (local-set-key (kbd "C-c <up>") 'markdown-move-up)
					  (local-set-key (kbd "C-c <down>") 'markdown-move-down)
					  (local-set-key (kbd "M-<right>") 'windmove-right)
					  (local-set-key (kbd "M-<left>") 'windmove-left)
					  (local-set-key (kbd "M-<up>") 'windmove-up)
					  (local-set-key (kbd "M-<down>") 'windmove-down)
					  )
					)
		  )


;; use 4 spaces for indentation
(add-hook 'markdown-mode-hook
		  (function (lambda ()
					  (setq-default indent-tabs-mode nil)
                      (setq-default electric-indent-mode nil)
					  (setq-default tab-width 4)
					  ;; (setq indent-line-function 'insert-tab)
                      (local-set-key (kbd "RET") 'newline)
					  )
					)
		  )
