;===============================================================
; tabbar
;===============================================================
(require 'tabbar)
(tabbar-mode 1)

;; buffer displayed in tabs
(defvar my-tabbar-displayed-buffers
  '("*scratch*" "*Python*" "*Backtrace*" "*Colors*" "*Faces*" "*vc-")
  "*Regexps matches buffer names always included tabs.")

(defun tabbar-buffer-groups ()
  "Return the list of group names the current buffer belongs to.
This function is a custom function for tabbar-mode's tabbar-buffer-groups.
This function group all buffers into 3 groups:
Those Dired, those user buffer, and those emacs buffer.
Emacs buffer are those starting with “*”."
  (list
   (cond
    ((eq major-mode 'dired-mode)
     "Dired"
     )
	((memq major-mode
		   '(help-mode apropos-mode Info-mode Man-mode))
	 "Common"
	 )
	((memq major-mode
		   '(html-mode
			 javascript-mode
			 js-mode
			 web-mode))
	 "Web"
	 )
	((memq major-mode
		   '(lisp-mode
			 emacs-lisp-mode
			 common-lisp-mode))
	 "Lisp"
	 )
	((memq major-mode
		   '(python-mode
			 inferior-python-mode))
	 "Python"
	 )
	((string-equal "*" (substring (buffer-name) 0 1))
     "Emacs Buffer"
     )
    (t
     "User Buffer"
     )
    )))

;; (setq *tabbar-ignore-buffers* '("TAGS" ".bbdb" "diary"))
;; (setq tabbar-buffer-list-function
;; 	  (lambda ()
;; 		(remove-if
;; 		 (lambda (buffer)
;; 		   (and (not (eq (current-buffer) buffer)) ; Always include the current buffer.
;; 				(loop for name in *tabbar-ignore-buffers* ;remove buffer name in this list.
;; 					  thereis (string-equal (buffer-name buffer) name))))
;; 		 (buffer-list))))


;; (defun my-tabbar-buffer-list ()
;;   "Return the list of buffers to show in tabs.
;; Exclude buffers whose name starts with a space or an asterisk.
;; The current buffer and buffers matches `my-tabbar-displayed-buffers'
;; are always included."
;;   (let* ((hides (list ?\  ?\*))
;;          (re (regexp-opt my-tabbar-displayed-buffers))
;;          (cur-buf (current-buffer))
;;          (tabs (delq nil
;;                      (mapcar (lambda (buf)
;;                                (let ((name (buffer-name buf)))
;;                                  (when (or (string-match re name)
;;                                            (not (memq (aref name 0) hides)))
;;                                    buf)))
;;                              (buffer-list)))))
;;     ;; Always include the current buffer.
;;     (if (memq cur-buf tabs)
;;         tabs
;;       (cons cur-buf tabs))))

;; (setq tabbar-buffer-list-function 'my-tabbar-buffer-list)

;; keybind
(global-set-key (kbd "s-<right>") 'tabbar-forward)
(global-set-key (kbd "s-<left>") 'tabbar-backward)
(global-set-key (kbd "s-S-<right>")   'tabbar-forward-group)
(global-set-key (kbd "s-S-<left>")  'tabbar-backward-group)
