;===============================================================
; Auto-complete
;===============================================================

(require 'auto-complete)
(add-to-list 'ac-dictionary-directories 
			 "~/.emacs.d/elpa/auto-complete-20140208.653/dict")
(require 'auto-complete-config)
(ac-config-default)


(global-auto-complete-mode t)

(define-key ac-mode-map (kbd "C-.") 'auto-complete)



;; ;; ignore case
;; (setq ac-ignore-case t)
;; ;; starting number of words
;; (setq ac-auto-start 4)
;; ;; time to show the auto-complete list
;; (setq ac-auto-show-menu 1) 
;; ;; automaticly start auto-completion or not
;; (setq ac-auto-start 2)
;; ;; starting key 
;; (ac-set-trigger-key "TAB")
;; ;; ;; number of maximum candidate 
;; (setq ac-candidate-max 20)
;; ;; use auto-complete for everything
;; (global-auto-complete-mode t)
;; ;; sources
;; (setq ac-sources '(ac-source-yasnippet
;;                    ac-source-dictionary
;;                    ac-source-gtags
;;                    ac-source-words-in-buffer))
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")

;; ;; set modes to start auto-complete
;; ;; (add-to-list 'ac-modes 'yatex-mode)
;; ;; (add-to-list 'ac-modes 'octave-mode)
;; (add-to-list 'ac-modes 'latex-mode)

;; ;; ;; key binding in auto-complete list
;; (define-key ac-completing-map (kbd "C-n") 'ac-next)
;; (define-key ac-completing-map (kbd "C-p") 'ac-previous)
;; (define-key ac-completing-map (kbd "<tab>") 'ac-complete)
;; (define-key ac-completing-map (kbd "M-/") 'ac-stop)

;; ;; (setq
;; ;;  ac-auto-start 2
;; ;;  ac-override-local-map nil
;; ;;  ac-use-menu-map t
;; ;;  ac-candidate-limit 20)
