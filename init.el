;;
;; File init.el - These commands are executed when GNU emacs starts up.
;;
;; revised 2/12/2013
;;

(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

;===============================================================
; custom-themes
;===============================================================
;; for terminal backgroudn color
(setq term-default-bg-color nil)

(load-file "~/.emacs.d/settings/paths-settings.el")
(load-file "~/.emacs.d/settings/package-settings.el")

(load-file "~/.emacs.d/settings/auto-complete-settings.el")
(load-file "~/.emacs.d/settings/key-settings.el")

(load-file "~/.emacs.d/settings/general-settings.el")
(load-file "~/.emacs.d/settings/startup-settings.el")
(load-file "~/.emacs.d/settings/modeline-settings.el")
(load-file "~/.emacs.d/settings/font-settings.el")

(load-file "~/.emacs.d/settings/multi-term-settings.el")
(load-file "~/.emacs.d/settings/bytecompile-settings.el")
(load-file "~/.emacs.d/settings/redo-settings.el")

;; (load-file "~/.emacs.d/settings/windows-settings.el")

(load-file "~/.emacs.d/settings/major-mode-settings.el")

;; programming settings
(load-file "~/.emacs.d/settings/auctex-settings.el")
(load-file "~/.emacs.d/settings/cpp-mode-settings.el")
(load-file "~/.emacs.d/settings/python-mode-settings.el")
(load-file "~/.emacs.d/settings/octave-mode-settings.el")
(load-file "~/.emacs.d/settings/haskell-settings.el")


;; (load-file "~/.emacs.d/settings/popwin-settings.el")
(load-file "~/.emacs.d/settings/autopair-settings.el")
;; (load-file "~/.emacs.d/settings/color-moccur-settings.el")

(load-file "~/.emacs.d/settings/tabbar-settings.el")

(load-file "~/.emacs.d/settings/helm-settings.el")

(load-file "~/.emacs.d/settings/programming-tools-settings.el")


