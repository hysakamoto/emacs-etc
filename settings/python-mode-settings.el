;===============================================================
;; python.el configuration
;===============================================================
;;; Code:


;; from python.el
(require 'python)
(setq
 python-indent-offset 4
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

;; http://hamukazu.com/2014/12/05/setting-emacs-for-python/
(add-hook 'python-mode-hook
		  (lambda ()
            (define-key python-mode-map (kbd "\C-m") 'newline-and-indent)
            (define-key python-mode-map (kbd "RET") 'newline-and-indent)))


;; shared settings
(setq py-electric-colon-active t)
;; (add-hook 'python-mode-hook 'autopair-mode)
;; (add-hook 'python-mode-hook 'yas-minor-mode)
;; (add-hook 'python-mode-hook 'persp-mode)

;; lint before save
;; (add-hook 'before-save-hook 'py-autopep8-before-save)

;===============================================================
;; emacs IPython notebook config
;===============================================================

;; ; use autocompletion, but don't start to autocomplete after a dot
;; (setq ein:complete-on-dot -1)
;; (setq ein:use-auto-complete 1)

;; ; set python console args
;; (setq ein:console-args
;;       (if (system-is-mac)
;; 	  '("--gui=osx" "--matplotlib=osx" "--colors=Linux")
;; 	(if (system-is-linux)
;; 	    '("--gui=wx" "--matplotlib=wx" "--colors=Linux"))))

;; ; timeout settings
;; (setq ein:query-timeout 1000)

;; ; IPython notebook
;; (include-plugin "emacs-ipython-notebook/lisp")
;; (require 'ein)

;; ; shortcut function to load notebooklist
;; (defun load-ein () 
;;   (ein:notebooklist-load)
;;   (interactive)
;;   (ein:notebooklist-open))


;===============================================================
;; pydoc
;===============================================================
(require 'pydoc-info)

;===============================================================
; jedi
;===============================================================
(require 'jedi)

;; use the setting from
;; http://txt.arboreus.com/2013/02/21/jedi.el-jump-to-definition-and-back.html
;; don't use default keybindings from jedi.el; keep C-. free
(setq jedi:setup-keys nil)
(setq jedi:tooltip-method nil)
(autoload 'jedi:setup "jedi" nil t)
(add-hook 'python-mode-hook 'jedi:setup)

;; Instead define these functions:
(defvar jedi:goto-stack '())
(defun jedi:jump-to-definition ()
  (interactive)
  (add-to-list 'jedi:goto-stack
               (list (buffer-name) (point)))
  (jedi:goto-definition))
(defun jedi:jump-back ()
  (interactive)
  (let ((p (pop jedi:goto-stack)))
    (if p (progn
            (switch-to-buffer (nth 0 p))
            (goto-char (nth 1 p))))))

;; redefine jedi's C-. (jedi:goto-definition)
;; to remember position, and set C-, to jump back
(add-hook 'python-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-.") 'jedi:jump-to-definition)
             (local-set-key (kbd "C-,") 'jedi:jump-back)
             (local-set-key (kbd "C-c d") 'jedi:show-doc)
             (local-set-key (kbd "C-<tab>") 'jedi:complete)))

(setq jedi:server-args
      '("--sys-path" "/usr/local/src/fenics/dolfin/lib/python2.7/site-packages/"))

;; ; jedi python completion
;; (include-elget-plugin "ctable")   ; required for epc
;; (include-elget-plugin "deferred") ; required for epc
;; (include-elget-plugin "epc")      ; required for jedi
;; (include-elget-plugin "jedi")
;; (require 'jedi)
;; (setq jedi:setup-keys t)
;; (autoload 'jedi:setup "jedi" nil t)
;; (add-hook 'python-mode-hook 'jedi:setup)

;;===============================================================
;; pyflakes flymake integration
;; http://stackoverflow.com/a/1257306/347942
;;===============================================================

;; ;; python-mode をロードする
;; (when (autoload 'python-mode "python-mode" "Python editing mode." t)
;;   ;; python-pep8 keybind
;;   (setq python-mode-hook
;; 		(function (lambda ()
;; 					(local-set-key (kbd "C-c p") 'python-pep8))))
;;   (setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
;;   (setq interpreter-mode-alist (cons '("python" . python-mode)
;;                                      interpreter-mode-alist)))

;; ;; flymake for python
;; (add-hook 'python-mode-hook 'flymake-find-file-hook)
;; (when (load "flymake" t)
;;   (defun flymake-pyflakes-init ()
;;     (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                        'flymake-create-temp-inplace))
;;            (local-file (file-relative-name
;;                         temp-file
;;                         (file-name-directory buffer-file-name))))))
;;   (add-to-list 'flymake-allowed-file-name-masks
;;                '("\\.py\\'" flymake-pyflakes-init)))
;; (load-library "flymake-cursor")


;===============================================================
; Set PYTHONPATH, because we don't load .bashrc
;===============================================================
;; (defun set-python-path-from-shell-PYTHONPATH ()
;;   (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PYTHONPATH'")))
;;     (setenv "PYTHONPATH" path-from-shell)))

;; (if window-system (set-python-path-from-shell-PYTHONPATH))

;; (setq auto-mode-alist
;;       (append 
;;        (list '("\\.pyx" . python-mode)
;;              '("SConstruct" . python-mode))
;;        auto-mode-alist))

;===============================================================
; keybindings
;===============================================================
(eval-after-load 'python
  '(define-key python-mode-map (kbd "C-c 1") 'python-shell-switch-to-shell))
;; (eval-after-load 'python
;;   '(define-key python-mode-map (kbd "C-c |") 'python-shell-send-region))


;===============================================================
; fenics path
;===============================================================

;; (defun fenics-workon ()
;;   "set environmental variables for FEniCS/Dolfin"
;;   (interactive)
;;   (setenv "DYLD_LIBRARY_PATH"
;; 		  (concat "/usr/local/src/fenics/lib:"
;; 				  (getenv "DYLD_LIBRARY_PATH")))
;;   (setenv "PATH"
;; 		  (concat "/usr/local/src/fenics/bin:" (getenv "PATH")))
;;   (setenv "PKG_CONFIG_PATH"
;; 		  (concat "/usr/local/src/fenics/lib/pkgconfig:" (getenv "PKG_CONFIG_PATH")))
;;   (setenv "PYTHONPATH"
;; 		  (concat "/Users/ysakamoto/.virtualenvs/fenics/lib/python2.7/site-packages:" (getenv "PYTHONPATH")))
;;   (setenv "MANPATH"
;; 		  (concat "/usr/local/src/fenics/share/man:" (getenv "$MANPATH")))
;;   (setenv "DYLD_FRAMEWORK_PATH"
;; 		  (concat "/opt/local/Library/Frameworks:" (getenv "DYLD_FRAMEWORK_PATH"))
;; 		  )
;;   )

;===============================================================
; highlight-indentation.el
;===============================================================

(require 'highlight-indentation)

(add-hook 'python-mode-hook 'highlight-indentation-current-column-mode)

(set-face-background 'highlight-indentation-face "#e3e3d3")
(set-face-background 'highlight-indentation-current-column-face "#c3b3b3")
