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

;; hide menu bar
(menu-bar-mode -1) 

;; scroll bar
(set-scroll-bar-mode nil)
;;(set-scroll-bar-mode 'right)
 
;; (one-buffer-one-frame-mode 0) 
 
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
;; (set-face-background 'show-paren-match-face "orangered4")

;; region color
;; (set-face-background 'region "tomato4")

;; highlight a line
(global-hl-line-mode t)

;; #383838

;; tab width
;; (custom-set-variables '(tab-width 4))
(setq default-tab-width 4)

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

;; Japanese info encoding
(auto-compression-mode t)

;; display clock
;;(display-time)

;; disable beep sound
(setq visible-bell nil)

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
;; (setq x-select-enable-clipboard t)
;; (setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

;;; put directory name if two files with same names exist
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; for Slow scrolling speed in Emacs
(setq jit-lock-defer-time 0.05)

;; color mode for term
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
;;; Fix junk characters in shell-mode
;; (add-hook 'compilation-filter-hook
;;           'ansi-color-for-comint-mode-on)

;; Use Emacs terminfo, not system terminfo
(setq system-uses-terminfo nil)


;; mouse scrolls

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time

;; ;; Enable mouse support
;; (unless window-system
;;   (require 'mouse)
;;   (xterm-mouse-mode t)
;;   (global-set-key [mouse-4] '(lambda ()
;;                               (interactive)
;;                               (scroll-down 1)))
;;   (global-set-key [mouse-5] '(lambda ()
;;                               (interactive)
;;                               (scroll-up 1)))
;;   (defun track-mouse (e))
;;   (setq mouse-sel-mode t)
;; )


;; Cause the region to be highlighted and prevent region-based commands
;; from running when the mark isn't active.
(pending-delete-mode t)
(setq transient-mark-mode t)


;; Emacs and Other Info files
(require 'info)
(setq Info-default-directory-list
  (cons (expand-file-name "~/info/")
    Info-default-directory-list))


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


;; store all backup and autosave files in the tmp dir
(setq emacs-temp-dir "~/.emacs.d/tmp")
(setq backup-directory-alist
      `((".*" . , emacs-temp-dir)))
(setq auto-save-file-name-transforms
      `((".*" , emacs-temp-dir t)))

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
; backward-kill-line
;===============================================================
;; define the function to kill the characters from the cursor 
;; to the beginning of the current line
(defun backward-kill-line (arg)
  "Kill chars backward until encountering the end of a line."
  (interactive "p")
  (kill-line 0))

;; ;; you may want to bind it to a different key
;; (global-set-key [(control ,)] 'backward-kill-line)
(global-set-key (kbd "C-,") 'backward-kill-line)

;===============================================================
; rotate-between-beginnig-of-line-or-first-word
;===============================================================
(defun my-goto-line-beginning-or-indent (&optional $position)
  (interactive)
  (or $position (setq $position (point)))
  (let (($starting-position (progn (back-to-indentation) (point))))
    (if (eq $starting-position $position)
      (move-beginning-of-line 1))))

(global-set-key (kbd "C-a") 'my-goto-line-beginning-or-indent)

;===============================================================
; anzu-mode
;===============================================================
;; http://qiita.com/syohex/items/56cf3b7f7d9943f7a7ba
(global-anzu-mode +1)
(custom-set-variables
 '(anzu-mode-lighter "")
 '(anzu-deactivate-region t)
 '(anzu-search-threshold 1000))

;===============================================================
; volatile-highlights
;===============================================================
(require 'volatile-highlights)
(volatile-highlights-mode t)

;===============================================================
; copy rectangle region
;===============================================================
;;; http://yohshiy.blog.fc2.com/blog-entry-254.html
(defun copy-rectangle-ring-save (start end)
  "Copy the region-rectangle and save it as the last killed one."
  (interactive "r")
  (setq killed-rectangle (extract-rectangle start end))
  (deactivate-mark)
  (message "Copy rectangle region"))
(define-key ctl-x-r-map "e" 'my-kill-rectangle-ring-save)
