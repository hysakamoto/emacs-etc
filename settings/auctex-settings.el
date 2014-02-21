;===============================================================
; AUCTeX settings
;===============================================================

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-flyspell)

;; Use pdflatex
(setq TeX-PDF-mode t)

; column word number
;; (add-hook 'LaTeX-mode-hook '
;; 	  (lambda () (auto-fill-mode t) (setq fill-column
;; 		70) (autopair-mode) ))
(add-hook 'LaTeX-mode-hook '
	  (lambda () (auto-fill-mode t) (setq fill-column 70) ))

;; auto-pair
(add-hook 'LaTeX-mode-hook 'electric-pair-mode)

(add-hook 'LaTeX-mode-hook
		  '(lambda ()
			 (local-set-key (kbd "<f7>")
							'TeX-command-master)))

;; change pdf viewers
(setq TeX-view-program-list '(("preview" "open -a Preview.app %o")
							  ("skim" "open -a Skim.app %o")
							  ("acroread" "open -a Adobe\\ Reader %o")))
(setq TeX-view-program-selection '((output-pdf "skim")))

;; setting up the mactex path
(getenv "PATH")
(setenv "PATH"
		(concat
		 "/usr/texbin" ":"
		 (getenv "PATH")))

(add-hook 'LaTeX-mode-hook
		  '(lambda ()
			 (local-set-key (kbd "\C-c\C-a")   ; 'a' for ask, change to anything you want 
			   (lambda (arg) (interactive "P") 
				 (let ((TeX-command-force nil)) 
				   (TeX-command-master arg)))) 
			 ))

(setq TeX-command-force "")

;===============================================================
; ac-math
;===============================================================

(require 'ac-math)
(add-to-list 'ac-modes 'latex-mode)   ; make auto-complete aware of
									  ; `latex-mode`

(defun ac-latex-mode-setup () ; add ac-sources to default
  ; ac-sources
  (setq ac-sources
		(append '(ac-source-math-unicode ac-source-math-latex
										 ac-source-latex-commands) ac-sources)))

(add-hook 'LaTeX-mode-hook 'ac-latex-mode-setup)
(ac-flyspell-workaround)
