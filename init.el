;;;
;;; File init.el - These commands are executed when GNU emacs starts up.
;;;
;;; revised 12/11/2014
;;;

;;; Code:

; fullscreen at startup
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(anzu-deactivate-region t)
 '(anzu-mode-lighter "")
 '(anzu-search-threshold 1000)
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

;===============================================================
; custom-themes
;===============================================================
;; for terminal backgroudn color
(setq term-default-bg-color nil)

(load-file "~/.emacs.d/settings/paths-settings.el")
(load-file "~/.emacs.d/settings/package-settings.el")
(load-file "~/.emacs.d/settings/general-settings.el")

(load-file "~/.emacs.d/settings/theme-settings.el")

(load-file "~/.emacs.d/settings/auto-complete-settings.el")
(load-file "~/.emacs.d/settings/key-settings.el")

(load-file "~/.emacs.d/settings/startup-settings.el")
(load-file "~/.emacs.d/settings/modeline-settings.el")
(load-file "~/.emacs.d/settings/font-settings.el")

(load-file "~/.emacs.d/settings/multi-term-settings.el")
(load-file "~/.emacs.d/settings/bytecompile-settings.el")
(load-file "~/.emacs.d/settings/redo-settings.el")

(load-file "~/.emacs.d/settings/major-mode-settings.el")

;; programming settings
(load-file "~/.emacs.d/settings/auctex-settings.el")
(load-file "~/.emacs.d/settings/cpp-mode-settings.el")
(load-file "~/.emacs.d/settings/python-mode-settings.el")
(load-file "~/.emacs.d/settings/octave-mode-settings.el")
(load-file "~/.emacs.d/settings/haskell-settings.el")
(load-file "~/.emacs.d/settings/r-settings.el")
(load-file "~/.emacs.d/settings/markdown-mode-settings.el")

;; (load-file "~/.emacs.d/settings/popwin-settings.el")
(load-file "~/.emacs.d/settings/pair-settings.el")
;; (load-file "~/.emacs.d/settings/color-moccur-settings.el")

;; (load-file "~/.emacs.d/settings/tabbar-settings.el")

(load-file "~/.emacs.d/settings/helm-settings.el")

(load-file "~/.emacs.d/settings/programming-tools-settings.el")

(load-file "~/.emacs.d/settings/workspace-settings.el")



;;; Stefan Monnier <foo at acm.org>. It is the opposite of
;;; fill-paragraph
(defun unfill-paragraph ()
  "Takes a multi-line paragraph and makes it into a single line of text."
  (interactive)
  (let ((fill-column (point-max)))
	(fill-paragraph nil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-selection-line ((t (:background "dark red")))))
