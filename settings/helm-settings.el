 ;===============================================================
; helm
;===============================================================
;; (add-to-list 'load-path "/home/ysakamoto/.emacs.d/helm")
;; (add-to-list 'load-path "/home/ysakamoto/.emacs.d/helm-descbinds")
(require 'helm-config)
(require 'helm-command)
(require 'helm-descbinds)

;; ミニバッファで C-h でヘルプでないようにする
;; (load "term/bobcat")
;; (when (fboundp 'terminal-init-bobcat)
;;   (terminal-init-bobcat))

(setq helm-idle-delay             0.1
      helm-input-idle-delay       0.1
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
		 (,(kbd "C-!") helm-imenu)
		 )))
  (loop for (key func) in key-and-func
        do (global-set-key key func)))

;; want helm-M-x to show functions too

;===============================================================
; helm-gtags
;===============================================================
;; (require 'helm-config)
(require 'helm-gtags)

;;; Enable helm-gtags-mode
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

;; customize
;; (setq helm-gtags-path-style 'relative)
(setq helm-gtags-ignore-case t)
;; (setq helm-gtags-read-only t)

;; key bindings
(add-hook 'helm-gtags-mode-hook
          '(lambda ()
              (local-set-key (kbd "M-t") 'helm-gtags-find-tag) ;; where it's defined
              (local-set-key (kbd "M-r") 'helm-gtags-find-rtag) ;; where it's used
              (local-set-key (kbd "M-s") 'helm-gtags-find-symbol) ;; where it appears
              (local-set-key (kbd "M-p") 'helm-gtags-find-files)
              (local-set-key (kbd "C-t") 'helm-gtags-pop-stack))) ;; go back
