;===============================================================
; magit - interact with git
; http://www.emacswiki.org/emacs/Magit
;===============================================================
(require 'magit)
(global-set-key "\C-xg" 'magit-status)


;===============================================================
; flycheck
;===============================================================
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

;; add extra include paths
(add-hook 'flycheck-mode-hook
		  (lambda () (setq flycheck-clang-include-path
						   (list "/usr/local/src/libmesh-mbp/include"
								 ))))

;===============================================================
; ctags
;===============================================================
 (setq path-to-ctags "/usr/local/bin/ctags") ;; <- your ctags path here

(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "ctags -f %s -e -R %s" path-to-ctags (directory-file-name dir-name)))
  )

(setq tags-file-name
	  '("/usr/local/src/fenics/dolfin/site-packages/TAGS"))

(eval-after-load "python-mode"
  (visit-tags-table "/usr/local/src/fenics/dolfin/site-packages/TAGS"))


;===============================================================
; yasnippet
;===============================================================

(require 'yasnippet)				  

;; (add-to-list 'load-path
;;               "~/.emacs.d/yasnippet-0.8.0")
;; (require 'yasnippet)
;; (yas-global-mode 1)

;; (add-to-list 'load-path "~/.emacs.d/yasnippet-0.8.0")
;; (require 'yasnippet)
;; (yas--initialize)
;; (yas-load-directory "~/.emacs.d/yasnippet-0.8.0/snippets")
