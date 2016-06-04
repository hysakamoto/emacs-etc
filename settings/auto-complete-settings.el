;===============================================================
; Auto-complete
;===============================================================

(require 'auto-complete)
(add-to-list 'ac-dictionary-directories 
			 "~/.emacs.d/elpa/auto-complete-20140208.653/dict")
(require 'auto-complete-config)
(ac-config-default)

;; use auto-complete for everything
(global-auto-complete-mode t)

;; (define-key ac-mode-map (kbd "C-.") 'auto-complete)


(setq
 ac-auto-start nil
 ac-override-local-map nil
 ac-use-menu-map t
 ac-candidate-limit 20
 ac-ignore-case t
 ac-auto-show-menu nil
)

;; ;; key binding in auto-complete list
;; (define-key ac-completing-map (kbd "C-n") 'ac-next)
;; (define-key ac-completing-map (kbd "C-p") 'ac-previous)
;; (define-key ac-completing-map (kbd "C-<tab>") 'ac-complete)
;; (define-key ac-completing-map (kbd "M-/") 'ac-stop)

(define-key ac-mode-map (kbd "C-<tab>") 'auto-complete)



;; ;; ignore case
;; (setq ac-ignore-case t)
;; ;; starting number of words
;; (setq ac-auto-start 4)
;; ;; time to show the auto-complete list
;; (setq ac-auto-show-menu 1) 
;; ;; automaticly start auto-completion or not
;; (setq ac-auto-start 2)
;; starting key 
;; (ac-set-trigger-key "TAB")
;; ;; ;; number of maximum candidate 
;; (setq ac-candidate-max 20)
;; ;; sources
;; (setq ac-sources '(ac-source-yasnippet
;;                    ac-source-dictionary
;;                    ac-source-gtags
;;                    ac-source-words-in-buffer))
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")


;; ETAGS

;; (add-hook 'auto-complete-mode-hook 'ac-etags-ac-setup)

;; (custom-set-variables
;;   '(ac-etags-requires 1))

;; (eval-after-load "ctags"
;;   '(progn
;;       (ac-etags-setup)))

;; (add-hook 'c-mode-common-hook 'ac-etags-ac-setup)
;; (add-hook 'python-mode-common-hook 'ac-etags-ac-setup)
