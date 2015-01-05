;===============================================================
; Key binding
;===============================================================


(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)

;; disable global C-z
(global-unset-key "\C-z")

;; switching windows
;; (windmove-default-keybindings 'alt)

(global-set-key (kbd "M-<up>") 'windmove-up)
(global-set-key (kbd "M-<down>") 'windmove-down)
(global-set-key (kbd "M-<right>") 'windmove-right)
(global-set-key (kbd "M-<left>") 'windmove-left)
