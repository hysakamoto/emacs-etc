;===============================================================
; helm
;===============================================================
;; http://tuhdo.github.io/helm-intro.html

;;; Code:

(require 'helm-config)
(require 'helm-command)
(require 'helm-descbinds)

;; helm prefix key
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

;; define other helm keys
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-^")   'helm-c-apropos)
(global-set-key (kbd "C-'")   'helm-resume)
(global-set-key (kbd "M-s")   'helm-occur)
(global-set-key (kbd "M-x")   'helm-M-x)
(global-set-key (kbd "M-y")   'helm-show-kill-ring)
(global-set-key (kbd "M-z")   'helm-do-grep)
(global-set-key (kbd "C-S-h") 'helm-descbinds)
(global-set-key (kbd "C-!")   'helm-imenu)
(global-set-key (kbd "C-`")  'helm-bookmarks)

;; rebind tab to run persistent action
;; (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
;; make TAB works in terminal
;; (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
;; list actions using C-z
;; (define-key helm-map (kbd "C-z")  'helm-select-action) 

(setq
 ;; open helm buffer inside current window, not occupy whole other window
 ;; helm-split-window-in-side-p           t
 ;; fuzzy matching buffer names when non--nil
 ;; helm-buffers-fuzzy-matching           t
 ;; move to end or beginning of source when reaching top or bottom of source.
 ;; helm-move-to-line-cycle-in-source     t
 ;; search for library in `require' and `declare-function' sexp.
 helm-ff-search-library-in-sexp        t
 helm-scroll-amount                    16 
 helm-ff-file-name-history-use-recentf t
 helm-idle-delay             0.1
 helm-input-idle-delay       0.1
 helm-candidate-number-limit 200
 )

(set-face-attribute 'helm-selection nil :background "#441100")

(helm-mode 1)

;; do not use locate for helm-for-files
(setq helm-for-files-preferred-list
	  '(helm-source-buffers-list
		helm-source-recentf
		helm-source-bookmarks
		helm-source-file-cache
		helm-source-files-in-current-dir
		))

(setq helm-mini-default-sources
	  '(helm-source-buffers-list
		helm-source-recentf
		helm-source-files-in-current-dir
		helm-source-bookmarks
		helm-source-file-cache
		helm-source-buffer-not-found
		))

;; ;; replace grep with ack-grep
;; (when (executable-find "ack-grep") (setq helm-grep-default-command
;;   "ack-grep -Hn --no-group --no-color %e %p %f"
;;   helm-grep-default-recurse-command "ack-grep -H --no-group --no-color
;;   %e %p %f"))


;; ;; want helm-M-x to show functions too

;===============================================================
; helm-gtags
;===============================================================
(require 'helm-gtags)

;;; Enable helm-gtags-mode
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)

;; customize
(setq helm-gtags-ignore-case t)
(setq helm-gtags-read-only t)

;; ;; (setq helm-gtags-path-style 'absolute)
;; ;; (setq helm-gtags-path-style 'relative)

;; key bindings
(add-hook 'helm-gtags-mode-hook
          '(lambda ()
			 (local-set-key (kbd "M-t") 'helm-gtags-find-tag) ;; where it's defined
			 (local-set-key (kbd "M-r") 'helm-gtags-find-rtag) ;; where it's used
			 (local-set-key (kbd "M-s") 'helm-gtags-find-symbol) ;; where it appears
			 (local-set-key (kbd "M-p") 'helm-gtags-find-files)
			 (local-set-key (kbd "C-t") 'helm-gtags-pop-stack))) ;; go back



;; ===============================================================
;; helm-ls-git
;; ===============================================================
;; https://github.com/emacs-helm/helm-ls-git
(require 'helm-ls-git)
(global-set-key (kbd "<f6>") 'helm-ls-git-ls)
(global-set-key (kbd "C-x C-d") 'helm-browse-project)



;; ===============================================================
;; helm-ag
;; ===============================================================
;; https://github.com/syohex/emacs-helm-ag
(require 'helm-ag)

(global-set-key (kbd "M-g .") 'helm-ag)
(global-set-key (kbd "M-g ,") 'helm-ag-pop-stack)
(global-set-key (kbd "C-M-s") 'helm-ag-this-file)
(setq helm-ag-base-command "ag --nocolor --nogroup --ignore-case")
(setq helm-ag-command-option "--all-text")
(setq helm-ag-insert-at-point 'symbol)
