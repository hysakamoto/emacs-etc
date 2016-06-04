;===============================================================
; MAJOR MODE SETTING
;===============================================================


;;===============================================================
;; This provides customized support for writing programs in diffe
;; rent kinds of programming languages.
;;===============================================================

;; set tab distance
(setq c-basic-offset 4)

;; This function is used in various programming language mode hooks below.  It
;; does indentation after every newline when writing a program.
(defun newline-indents ()
  "Bind Return to `newline-and-indent' in the local keymap."
  (local-set-key "\C-m" 'newline-and-indent))

;; Tell Emacs to use the function above in certain editing modes.
(add-hook 'lisp-mode-hook             (function newline-indents))
(add-hook 'emacs-lisp-mode-hook       (function newline-indents))
(add-hook 'lisp-interaction-mode-hook (function newline-indents))
(add-hook 'scheme-mode-hook           (function newline-indents))
(add-hook 'c-mode-hook                (function newline-indents))
(add-hook 'c++-mode-hook              (function newline-indents))
(add-hook 'java-mode-hook             (function newline-indents))

;; Fortran mode provides a special newline-and-indent function.
(add-hook 'fortran-mode-hook
	  (function (lambda ()
		      (local-set-key "\C-m" 'fortran-indent-new-line))))

;; Text-based modes (including mail, TeX, and LaTeX modes) are auto-filled.
(add-hook 'text-mode-hook (function turn-on-auto-fill))

;; This is how emacs tells the file type by the file suffix.
(setq auto-mode-alist
      (append '(("\\.mss$" . scribe-mode))
			  '(("\\.bib$" . bibtex-mode))
			  '(("\\.tex$" . latex-mode))
			  '(("\\.obj$" . lisp-mode))
			  '(("\\.st$"  . smalltalk-mode))
			  '(("\\.Z$"   . uncompress-while-visiting))
			  '(("\\.cs$"  . indented-text-mode))
			  '(("\\.C$"   . c++-mode))
			  '(("\\.cc$"  . c++-mode))
			  '(("\\.icc$" . c++-mode))
			  '(("\\.c$"   . c-mode))
			  '(("\\.y$"   . c-mode))
			  '(("\\.h$"   . c++-mode))
			  '(("\\.R$"   . R-mode))
			  auto-mode-alist))
