;; python autocomplete
(add-hook 'python-mode-hook 'auto-complete-mode)

;; virtualenv
;; (eval-after-load "python-mode"
;;   '(virtualenv-workon "ys-mbp"))

;; shared settings
(setq py-electric-colon-active t)
(add-hook 'python-mode-hook 'autopair-mode)
(add-hook 'python-mode-hook 'yas-minor-mode)


;===============================================================
; Python-Mode.el
;===============================================================

;; (require 'python-mode)
;; (add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
;; (setq py-split-windows-on-execute-p nil)

;; ;; use ipython as an interpreter
;; (add-hook 'python-mode-hook
;;           (lambda () (local-set-key (kbd "C-c C-c") #'py-execute-buffer-ipython)))
;; (add-hook 'python-mode-hook
;;           (lambda () (local-set-key (kbd "C-c C-r") #'py-execute-region-ipython)))




;===============================================================
; Python.el
;===============================================================
(require 'python)

;; virtualenv
;; (eval-after-load "python-mode"
;;   (lambda ()
;; 	(virtualenv-workon "ys-mbp")))

;; (add-hook 'python-mode-hook
;; 		  (lambda ()
;; 		  (virtualenv-workon "ys-mbp")))



;; jedi setup
(require 'jedi)
(add-hook 'python-mode-hook
		  (lambda ()
			(jedi:setup)
			(jedi:ac-setup)
			(local-set-key "\C-cd" 'jedi:show-doc)
			(local-set-key (kbd "C-.") 'jedi:complete)
			(local-set-key (kbd "M-.") 'jedi:goto-definition)
			(local-set-key (kbd "M-,") 'find-tag)
			(local-set-key (kbd "M-/") 'helm-etags-select)
			)
		  )


(setq jedi:server-args
      '("--sys-path" "/usr/local/src/fenics/dolfin/lib/python2.7/site-packages/"))

;; (autoload 'python-mode "python-mode" "Python Mode." t)
;; (add-to-list 'interpreter-mode-alist '("python" . python-mode))

;; ipython
(setq
 python-shell-interpreter "ipython"
 python-shell-interpreter-args ""
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code
 "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code
 "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code
 "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")


(defun python-shell-send-switch ()
  "send the buffer to python shell and switch to it"
  (interactive)
  (python-shell-send-buffer)
  (python-shell-switch-to-shell) )

(add-hook 'python-mode-hook
		  (lambda ()
			(local-set-key (kbd "C-c C-c") 'python-shell-send-switch)
			)
		  )

(defun dolfin-workon ()
  "set environmental variables for FEniCS/Dolfin"
  (interactive)
  (setenv "DYLD_LIBRARY_PATH"
		  (concat "/usr/local/src/dolfin/lib:" (getenv "DYLD_LIBRARY_PATH")))
  (setenv "PATH"
		  (concat "/usr/local/src/dolfin/bin:" (getenv "PATH")))
  (setenv "PKG_CONFIG_PATH"
		  (concat "/usr/local/src/dolfin/lib/pkgconfig:" (getenv "PKG_CONFIG_PATH")))
  (setenv "PYTHONPATH"
		  (concat "/Users/ysakamoto/.virtualenvs/fenics/lib/python2.7/site-packages:" (getenv "PYTHONPATH")))
  (setenv "MANPATH"
		  (concat "/usr/local/src/dolfin/share/man:" (getenv "$MANPATH")))
  (setenv "DYLD_FRAMEWORK_PATH"
		  (concat "/opt/local/Library/Frameworks:" (getenv "DYLD_FRAMEWORK_PATH"))
		  )
  )



;===============================================================
; highlight-indentation.el
;===============================================================

(require 'highlight-indentation)

(add-hook 'python-mode-hook 'highlight-indentation-current-column-mode)

(set-face-background 'highlight-indentation-face "#e3e3d3")
(set-face-background 'highlight-indentation-current-column-face "#c3b3b3")

;; (add-hook 'js2-mode-hook
;; 'highlight-indentation-mode)
