;;
;; File init.el - These commands are executed when GNU emacs starts up.
;;
;; revised 3/2/2012
;;


;; load path for local elisp files
(setq load-path (cons "~/.emacs.d/elisp" load-path))
;; load path for auto-install elispfiles
(setq load-path (cons "~/.emacs.d/auto-install" load-path))

;===============================================================
; Startup
;===============================================================
;; want two windows at startup 
;; (split-window-horizontally)

;===============================================================
; General
;===============================================================
;; common lisp
(require 'cl)

;; require help mode otherwise ac-symbol-documentation fails
(require 'help-mode)

;; disable start page
(setq inhibit-startup-message t)

;; disable scratch message
(setq initial-scratch-message "")

;; hide tool bar
(tool-bar-mode -1)

;; menu bar
;; (menu-bar-mode -1) 

;; scroll bar
(set-scroll-bar-mode nil)
;;(set-scroll-bar-mode 'right)

;; line number
;; (global-linum-mode t)
;; (set-face-attribute 'linum nil
;;                     :foreground "#800"
;;                     :height 0.9)
;; ;; line number format
;; (setq linum-format "%4d")

;; check corresponding parentetheis
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'expression) ; 'mixed
;; parentetheis color
(set-face-background 'show-paren-match-face "#FFFF66")

;; region color
(set-face-background 'region "#FFCC66")

;; tab width
(custom-set-variables '(tab-width 4))

;; yes or no to y or n
(fset 'yes-or-no-p 'y-or-n-p)

;; recent files and number of recent files
(recentf-mode t)
(setq recentf-max-menu-items 500)

;; number of saved recent files
(setq recentf-max-saved-items 3000)

;; line-spacing
(setq-default line-spacing 0)

;; show line and column numbers
(setq line-number-mode t)
(setq column-number-mode t)

;; fonts are automatically highlighted.
(global-font-lock-mode t)

;;日本語infoの文字化け防止
(auto-compression-mode t)
;; display clock
;;(display-time)
;; disable beep sound
(setq visible-bell t)

;; highlight a line
(global-hl-line-mode t)
(set-face-background 'hl-line "#CCFF99")

;; delete auto-save file when closing
(setq delete-auto-save-files t)

;; kills whole line if a cursor is at the beginning of the line
(setq kill-whole-line t)

;; show file name on a title bar
(setq frame-title-format (format "emacs@%s : %%f" (system-name)))

;; show current function name on a mode line
(which-function-mode 1)

;; ignore case for completion
(setq read-file-name-completion-ignore-case t)

;; fix for clipboard problem
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

;;; put directory name if two files with same names exist
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; (set-background-color "dark slate gray")
;; (set-foreground-color "blanched almond")

;===============================================================
; modeline
;===============================================================

;; モードラインの割合表示を総行数表示
;; (defvar my-lines-page-mode t)
;; (defvar my-mode-line-format)

;; (when my-lines-page-mode
;;   (setq my-mode-line-format "%d")
;;   (if size-indication-mode
;;       (setq my-mode-line-format (concat my-mode-line-format " of %%I")))
;;   (cond ((and (eq line-number-mode t) (eq column-number-mode t))
;;          (setq my-mode-line-format (concat my-mode-line-format " (%%l,%%c)")))
;;         ((eq line-number-mode t)
;;          (setq my-mode-line-format (concat my-mode-line-format " L%%l")))
;;         ((eq column-number-mode t)
;;          (setq my-mode-line-format (concat my-mode-line-format " C%%c"))))

;;   (setq mode-line-position
;;         '(:eval (format my-mode-line-format
;;                         (count-lines (point-max) (point-min))))))

;===============================================================
; Key binding
;===============================================================

;; disable global C-z
;(global-unset-key "\C-z")

;; switching windows
(global-set-key (kbd "M-<up>") 'windmove-up)
(global-set-key (kbd "M-<down>") 'windmove-down)
(global-set-key (kbd "M-<right>") 'windmove-right)
(global-set-key (kbd "M-<left>") 'windmove-left)


;===============================================================
; Anthy
;    CTRL-\ for japanese/english input switch
;===============================================================
;; (load-library "anthy")
;; (setq default-input-method "japanese-anthy")

;===============================================================
; Font
;===============================================================

;; (cond
;;  (window-system
;;   (set-default-font "Inconsolata-10")
;;   (set-face-font 'variable-pitch "Inconsolata-10")
;;   (set-fontset-font (frame-parameter nil 'font) 'japanese-jisx0208
;; 					'("Takaoゴシック" . "unicode-bmp"))
;;  )
;; )

;===============================================================
; Auto-install
;===============================================================
;; (require 'auto-install)
;; (setq auto-install-directory "~/.emacs.d/auto-install/")
;; (auto-install-update-emacswiki-package-name t)
;; (auto-install-compatibility-setup)             ; 互換性確保

;===============================================================
; multi-term
;===============================================================
;; terminal emulator
;; http://www.emacswiki.org/emacs/multi-term.el
(when (require 'multi-term nil t)
  (setq multi-term-program "/bin/bash"))


;===============================================================
; auto-async-byte-compile
;===============================================================
;; auto-compile
;; http://www.emacswiki.org/emacs/auto-async-byte-compile.el
(when (require 'auto-async-byte-compile nil t)
  ;; 自動コンパイルを無効にするファイル名の正規表現
  (setq auto-async-byte-compile-exclude-files-regexp "init.el")
  (add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode))

;===============================================================
; Anything
;===============================================================
;; (require 'anything-startup)
;; (require 'anything-config)

;; ;; anything list
;; (setq anything-sources
;; 	  '(;; anything-c-source-buffers+
;; 		;; anything-c-source-colors
;; 		;; anything-c-source-recentf
;; 		;; anything-c-source-files-in-current-dir
;; 		anything-c-source-emacs-commands
;; 		;; anything-c-source-extended-command-history
;; 		anything-c-source-minibuffer-history
;; 		;; anything-c-source-emacs-functions
;; 		;; anything-c-source-man-pages
;; 		))

;; ;; anything key
;; ;; (define-key global-map (kbd "C-;") 'anything)
;; (define-key global-map (kbd "M-x") 'anything)
;; ;; 
;; ;; (add-to-list 'anything-sources 'anything-c-source-emacs-commands)
;; ;; Useful command: anything-for-files, anything-approps

;; ;; for non-x environment
;; (setq anything-c-find-files-icons-directory nil)

;; (define-key anything-map (kbd "C-M-n") 'anything-next-source)
;; (define-key anything-map (kbd "C-M-p") 'anything-previous-source)

;; ;; search within buffer
;; (define-key global-map (kbd "C-s")
;;   '(lambda ()
;;      "Search current buffer in anything"
;;      (interactive)
;;      (anything '(anything-c-source-occur))))

;; ;; buffer list + buffer history + files in current directory
;; (define-key global-map (kbd "C-x b")
;;   (lambda ()
;;     "Open buffer list in anything"
;;     (interactive)
;;     (anything '(anything-c-source-buffers+
;; 				anything-c-source-recentf
;;                 ;; anything-c-source-file-name-history
;;                 anything-c-source-files-in-current-dir
;; 				))))


;; ;; function help
;; ;; (define-key global-map (kbd "C-h f")
;; ;;   (lambda ()
;; ;;     "Open function help in anything"
;; ;;     (interactive)
;; ;;     (anything '(anything-c-source-emacs-functions
;; ;; 				))))

;; ;; moving up and down sources
;; (define-key anything-map (kbd "C-M-n") 'anything-next-source)
;; (define-key anything-map (kbd "C-M-p") 'anything-previous-source)

;; ;; calc
;; ;; (define-key global-map (kbd "C-c C-a c")
;; ;;   (lambda ()
;; ;;     "Calculate in anything"
;; ;;     (interactive)
;; ;;     (anything '(anything-c-source-calculation-result))))

;; ;; killring history
;; (define-key global-map (kbd "C-M-y") 'anything-show-kill-ring)

;; ;; emacs commands
;; ;; (define-key global-map (kbd "M-x")
;; ;;   (lambda ()
;; ;;     "Execute emacs commands in anything"
;; ;;     (interactive)
;; ;;     (anything '(anything-c-source-emacs-commands))))


;; ;; tag jump
;; ;(require 'anything-etags)
;; (require 'anything-gtags)
;; (define-key global-map (kbd "C-x t")
;;   (lambda ()
;;     "Tag jump using etags, gtags and `anything'."
;;     (interactive)
;;     (let* ((initial-pattern (regexp-quote (or (thing-at-point 'symbol) ""))))
;;       (anything (list anything-c-source-gtags-select
;;                       anything-c-source-etags-select))
;;       "Find Tag: " nil)))

;; ;; misc setting
;; (setq
;;  ;; time to show candidates
;;  anything-idle-delay 0.2
;;  ;; rewrite idel delay time (default)
;;  anything-input-idle-delay 0.1
;;  ;; number of candidates (default)
;;  anything-candidate-number-limit 250
;;  ;; qucik update
;;  ;; anything-quick-update t
;;  ;; 選択候補のショートカットをアルファベットに
;;  ;; これ大文字ファイル名の選択で嵌らないか?
;;  ;; anything-enable-shortcuts 'alphabet
;;  )

;===============================================================
; Redo+
;===============================================================
(require 'redo+)
(global-set-key (kbd "C-M-/") 'redo)
(setq undo-no-redo t)
(setq undo-limit 60000)
(setq undo-strong-limit 600000)

;===============================================================
; Windows.el
;===============================================================
;; change key-binding 
;; default: C-c C-w
;; delete next 3 lines if you don't want to change
;; (setq win:switch-prefix "\C-z")
;; (define-key global-map win:switch-prefix nil)
;; (define-key global-map "\C-z1" 'win-switch-to-window)
;; (require 'windows)
;; ;; do not create a new frame
;; (setq win:use-frame nil)
;; (win:startup-with-window)
;; (define-key ctl-x-map "C" 'see-you-again)

;===============================================================
; workgroups.el
;===============================================================
(require 'workgroups)
(workgroups-mode 1)
(setq wg-morph-on nil)


;===============================================================
; other settings
;===============================================================

;; Emacs and Other Info files
(require 'info)
(setq Info-default-directory-list
  (cons (expand-file-name "~/info/")
    Info-default-directory-list))

;; Cause the region to be highlighted and prevent region-based commands
;; from running when the mark isn't active.
 
(pending-delete-mode t)
 (setq transient-mark-mode t)



;;===============================================================
;;===============================================================
;; MAJOR MODE SETTING
;;===============================================================
;;===============================================================


;;===============================================================
;; This provides customized support for writing programs in diffe
;; rent kinds of programming languages.
;;===============================================================

;; set tab distance
(setq c-basic-offset 2)

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
	      auto-mode-alist))

;===============================================================
; Yatex settings
;===============================================================

;; (setq auto-mode-alist
;;       (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
;; (autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
;; (setq load-path
;;       (cons (expand-file-name "/usr/share/emacs/site-lisp/yatex") load-path))

;; ; old key-binding
;; ;(setq YaTeX-inhibit-prefix-letter nil)

;; ; tex to dvi
;; ; pdflatex ->xelatex
;; (setq tex-command "xelatex")
;; ;dvi previewer
;; (setq dvi2-command "evince")
;; ;(setq dvi2-command "xdvi -paper us")
;; ; dvi to pdf
;; (setq dviprint-command-format "dvips %s")

;; (setq YaTeX-use-LaTeX2e t)
;; (setq YaTeX-use-AMS-LaTeX t)

;; ; column word number
;; (add-hook 'yatex-mode-hook '
;; 	  (lambda () (auto-fill-mode t) (setq fill-column 80)))

;; ; flyspell
;; (add-hook 'yatex-mode-hook 'turn-on-flyspell)

;; ; yatex coloring
;; (custom-set-variables )
;; (custom-set-faces '(YaTeX-sectioning-0 ((((class
;;  color)) (:background "#009fff" :foreground "#ff0000"))))
;;  '(YaTeX-sectioning-1 ((((class
;;  color)) (:background "#00aeff" :foreground "#f90000"))))
;;  '(YaTeX-sectioning-2 ((((class
;;  color)) (:background "#00bdff" :foreground "#f30000"))))
;;  '(YaTeX-sectioning-3 ((((class
;;  color)) (:background "#00ccff" :foreground "#ec0000"))))
;;  '(YaTeX-sectioning-4 ((((class
;;  color)) (:background "#00dbff" :foreground "#e60000"))))
;;  '(YaTeX-sectioning-5 ((((class
;;  color)) (:background "#00eaff" :foreground "#e00000"))))
;;  '(YaTeX-sectioning-6 ((((class
;;  color)) (:background "#00f9ff" :foreground "#d00900")))))

;===============================================================
; AUCTeX settings
;===============================================================

(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

;; load path for auctex elisp files
(setq load-path (cons "~/.emacs.d/auctex" load-path))
(load "auctex_settings.el")
;;(load "auto-complete-auctex.el")  

; column word number
(add-hook 'LaTeX-mode-hook '
	  (lambda () (auto-fill-mode t) (setq fill-column 80) (autopair-mode)
		))

(add-hook 'LaTeX-mode-hook
		  '(lambda ()
			 (local-set-key (kbd "<f7>")
							'TeX-command-master)))

(add-hook 'LaTeX-mode-hook
		  '(lambda ()
			 (local-set-key (kbd "\C-c\C-a")   ; 'a' for ask, change to anything you want 
			   (lambda (arg) (interactive "P") 
				 (let ((TeX-command-force nil)) 
				   (TeX-command-master arg)))) 
			 ))

(setq TeX-command-force "")

;; (add-hook 'LaTeX-mode-hook
;; 		  #'(lambda ()
;; 			  (push '(?\right( . ?\left))
;;                     (getf autopair-extra-pairs :everywhere))))

;; (add-hook 'LaTeX-mode-hook
;;           #'(lambda ()
;;               (push '(?$ . ?$)
;;                     (getf autopair-extra-pairs :code))
;; 			  (autopair-mode)))

;; (add-hook 'c++-mode-hook
;;           #'(lambda ()
;;               (push '(?< . ?>)
;;                     (getf autopair-extra-pairs :code))))

;===============================================================
; gtags
;===============================================================

;; (require 'gtags)
;; (define-key gtags-mode-map "\M-t" 'gtags-find-tag)
;; (define-key gtags-mode-map "\M-c" 'gtags-find-file)
;; (define-key gtags-mode-map "\M-r" 'gtags-find-rtag)
;; (define-key gtags-mode-map "\M-s" 'gtags-find-symbol)
;; (define-key gtags-mode-map "\C-t" 'gtags-pop-stack)
;; (add-hook 'c-mode-common-hook
;;           (lambda ()
;;             (gtags-mode 1)
;; 	    (gtags-make-complete-list)))

;===============================================================
; C/C++ Build
;===============================================================

(setq auto-mode-alist
      (append '(("\\.C$"  . c++-mode)
                ("\\.cc$" . c++-mode)
                ("\\.cpp$". c++-mode)
                ("\\.hh$" . c++-mode)
                ("\\.c$"  . c-mode)
                ("\\.h$"  . c++-mode))
              auto-mode-alist))

;; [F9]: run
;; [F7]: compile
;; [F4]: jump to an error line
;; [F1]: open manual for a word
;; SHIFT+[F7]: make clean
;; SHIFT+[F4]: jump to a previous error line
(add-hook 'c-mode-common-hook
     '(lambda ()
        (require 'vc-hooks)
        (setq completion-mode t)
        ;; make のオプションは聞いてこない
        (setq compilation-read-command nil)
        ;; make するとき 全バッファを自動的にsaveする
        (setq compilation-ask-about-save nil)
        (define-key c-mode-base-map [f1] 'manual-entry)
        (define-key c-mode-base-map [f4] 'next-error)
        (define-key c-mode-base-map [(shift f4)] 'previous-error)
        (define-key c-mode-base-map [f7] 'compile)
        (define-key c-mode-base-map [(shift f9)] 'kill-compilation)
	(define-key c-mode-base-map [(shift f7)] 
          '(lambda () 
             (interactive)
             ;;(require 'compile)
             ;;(save-some-buffers (not compilation-ask-about-save) nil)
             (compile-internal "make clean" "No more errors")))
	(define-key c-mode-base-map [f9] 
          '(lambda () 
             (interactive)
             ;;(require 'compile)
             ;;(save-some-buffers (not compilation-ask-about-save) nil)
             (compile-internal "make run" "No more errors")))
      ))


;; Replacement for the comment-dwim command. If no region is selected
;; and current line is not blank and we are not at the end of the
;; line, then comment current line. Replaces default behaviour of
;; comment-dwim, when it inserts comment at the end of the line."
(defun comment-dwim-line (&optional arg)
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))
(global-set-key "\M-;" 'comment-dwim-line)
	

;===============================================================
; Python Mode
;===============================================================

;; python-mode load path
;; (add-to-list 'load-path "~/.emacs.d/python-mode/") 
;; (setq py-install-directory "~/.emacs.d/python-mode/")
;; (require 'python-mode)

;; load path for python mode
(setq load-path (cons "~/.emacs.d/py-mode-ext" load-path))

;; pymacs
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(eval-after-load "pymacs"
  '(add-to-list 'pymacs-load-path "~/.emacs.d/py-mode-ext"))

;; python-mode, pycomplete 
(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("python" . python-mode)
                                   interpreter-mode-alist))
(autoload 'python-mode "python-mode" "Python editing mode." t)
(add-hook 'python-mode-hook
          '(lambda ()
             (require 'pycomplete)
             (setq ipython-command "ipython")
             (require 'ipython)))


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


;===============================================================
; GDB Mode
;===============================================================
(setq gdb-many-windows t)
(setq gdb-use-separate-io-buffer t) ; "IO buffer" が必要ない場合は  nil で


;===============================================================
; yasnippet
;===============================================================

;; (add-to-list 'load-path
;;               "~/.emacs.d/yasnippet-0.8.0")
;; (require 'yasnippet)
;; (yas-global-mode 1)

;; (add-to-list 'load-path "~/.emacs.d/yasnippet-0.8.0")
;; (require 'yasnippet)
;; (yas--initialize)
;; (yas-load-directory "~/.emacs.d/yasnippet-0.8.0/snippets")


;===============================================================
; Auto-complete
;===============================================================
;; https://github.com/m2ym/auto-complete

;; Load
(add-to-list 'load-path "/home/yusuke/.emacs.d/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/home/yusuke/.emacs.d/auto-complete/ac-dict")
(ac-config-default)

;; ignore case
(setq ac-ignore-case t)
;; starting number of words
(setq ac-auto-start 4)
;; time to show the auto-complete list
(setq ac-auto-show-menu 1) 
;; automaticly start auto-completion or not
(setq ac-auto-start nil)
;; starting key 
(ac-set-trigger-key "TAB")
;; ;; number of maximum candidate
;; (setq ac-candidate-max 20)
;; use auto-complete for everything
(global-auto-complete-mode t)
;; sources
(setq ac-sources '(ac-source-yasnippet
                   ac-source-dictionary
                   ac-source-gtags
                   ac-source-words-in-buffer))
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")

;; set modes to start auto-complete
;; (add-to-list 'ac-modes 'yatex-mode)
;; (add-to-list 'ac-modes 'octave-mode)
(add-to-list 'ac-modes 'latex-mode)

;; ;; key binding in auto-complete list
;; (define-key ac-completing-map (kbd "C-n") 'ac-next)
;; (define-key ac-completing-map (kbd "C-p") 'ac-previous)
;; (define-key ac-completing-map (kbd "<tab>") 'ac-complete)
(define-key ac-completing-map (kbd "M-/") 'ac-stop)


;===============================================================
; word count
;===============================================================

(defun word-count-region (start end)
  (interactive "r")
  (save-excursion
    (save-restriction
      (let ((c 0) (l 0) (w 0) (in-word nil) c-after)
        (goto-char start)
        (while (< (point) end)
          (setq c-after (char-after (point))) ; no need (point) if emacs 20
          (if (= c-after ?\n)
              (setq l (1+ l)))
          (if (or (= c-after ?\n) (= c-after ? ) (= c-after ?\C-i))
              (if in-word
                  (setq w (1+ w) in-word nil))
            (setq c (1+ c) in-word t))
          (forward-char))
        (message (format "%d lines, %d words, %d characters" l w c))))))

;;(global-set-key "\C-x\C-e" 'word-count-region)



;===============================================================
; popwin
;===============================================================
;; (require 'popwin)
;; (setq display-buffer-function 'popwin:display-buffer)

;; (push '("*anything*" :height 20) popwin:special-display-config)
;; (push '("*anything*" :position right) popwin:special-display-config)

(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
(push '("^\*helm .+\*$" :regexp t) popwin:special-display-config)


;; (add-hook 'latex-mode-hook
;;           '(lambda ()
;;               (push '(?$ . ?$)
;;                     (getf autopair-extra-pairs :code))))

;; (add-hook 'c++-mode-hook
;; 		  #'(lambda ()
;;               (push '(?< . ?>)
;;                     (getf autopair-extra-pairs :code))))

;; (autopair-global-mode) ;; enable autopair in all buffers


;===============================================================
; autopair
;===============================================================
(require 'autopair)
;; (autopair-global-mode) ;; enable autopair in all buffers

;; for latex mode -> see AucTex mode
;; (add-hook 'latex-mode-hook 
;;           #'(lambda () (autopair-mode)))

;===============================================================
; backward-kill-line
;===============================================================
;; define the function to kill the characters from the cursor 
;; to the beginning of the current line
(defun backward-kill-line (arg)
  "Kill chars backward until encountering the end of a line."
  (interactive "p")
  (kill-line 0))

;; you may want to bind it to a different key
(global-set-key [(control ,)] 'backward-kill-line)


;===============================================================
; color-moccur
;===============================================================
(require 'color-moccur)


;===============================================================
; tabbar
;===============================================================

(require 'tabbar)
(tabbar-mode 1)

(defun my-tabbar-buffer-list ()
  (delq nil
        (mapcar #'(lambda (b)
                    (cond
                     ;; Always include the current buffer.
                     ((eq (current-buffer) b) b)
                     ((buffer-file-name b) b)
                     ((char-equal ?\  (aref (buffer-name b) 0)) nil)
					 ((equal "*scratch*" (buffer-name b)) b) ; *scratch*バッファは表示する
					 ((char-equal ?* (aref (buffer-name b) 0)) nil) ; それ以外の * で始まるバッファは表示しない
                     ((buffer-live-p b) b)))
                (buffer-list))))
(setq tabbar-buffer-list-function 'my-tabbar-buffer-list)

;; keybind
(global-set-key (kbd "C-<tab>") 'tabbar-forward)
(global-set-key (kbd "C-S-<tab>") 'tabbar-backward)
(global-set-key (kbd "C-`")   'tabbar-forward-group)
(global-set-key (kbd "C-~")  'tabbar-backward-group)

;===============================================================
; helm
;===============================================================

(add-to-list 'load-path "/home/ysakamoto/.emacs.d/helm")
(add-to-list 'load-path "/home/ysakamoto/.emacs.d/helm-descbinds")
(require 'helm-config)
(require 'helm-command)
(require 'helm-descbinds)

;; ミニバッファで C-h でヘルプでないようにする
;; (load "term/bobcat")
;; (when (fboundp 'terminal-init-bobcat)
;;   (terminal-init-bobcat))

(setq helm-idle-delay             0.2
      helm-input-idle-delay       0.2
      helm-candidate-number-limit 200)

;; do not use locate for helm-for-files
(setq helm-for-files-preferred-list
  '(helm-source-buffers-list
    helm-source-recentf
    helm-source-bookmarks
    helm-source-file-cache
    helm-source-files-in-current-dir
    ))

(let ((key-and-func
       `((,(kbd "C-x b")   helm-for-files)
         (,(kbd "C-^")   helm-c-apropos)
         (,(kbd "C-'")   helm-resume)
         (,(kbd "M-s")   helm-occur)
         (,(kbd "M-x")   helm-M-x)
         (,(kbd "M-y")   helm-show-kill-ring)
         (,(kbd "M-z")   helm-do-grep)
         (,(kbd "C-S-h") helm-descbinds)
        )))
  (loop for (key func) in key-and-func
        do (global-set-key key func)))


