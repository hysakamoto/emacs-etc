;===============================================================
; Octave Mode
;===============================================================
;; use octave mode
(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))

;; turn on the abbrevs, auto-fill and font-lock features
(add-hook 'octave-mode-hook
          (lambda ()
            (abbrev-mode 1)
            (auto-fill-mode 1)
            (if (eq window-system 'x)
                (font-lock-mode 1))))

;; octave process setting
(add-hook 'inferior-octave-mode-hook
	  (lambda ()
	    (turn-on-font-lock)
	    (define-key inferior-octave-mode-map [up]
	      'comint-previous-input)
	    (define-key inferior-octave-mode-map [down]
	      'comint-next-input)))

;; RET adds a newline and indents it
(add-hook 'octave-mode-hook 
	  '(lambda nil
	     (define-key octave-mode-map (kbd "C-c !")
	       'run-octave)
	     (define-key octave-mode-map (kbd "C-;")
	       'comment-dwim-line)
	     (define-key octave-mode-map (kbd "C-m")
	       'octave-reindent-then-newline-and-indent)
	     (define-key octave-mode-map (kbd "C-M-z") 
	       'octave-complete-symbol)))

	     ;; (define-key octave-mode-map [(meta control tab)] 


(setq octave-continuation-string "...")
