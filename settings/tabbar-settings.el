;===============================================================
; tabbar
;===============================================================
(require 'tabbar)
(tabbar-mode 1)

;; buffer displayed in tabs
(defvar my-tabbar-displayed-buffers
  '("*scratch*" "*Python*" "*Backtrace*" "*Colors*" "*Faces*" "*vc-")
  "*Regexps matches buffer names always included tabs.")

(defun my-tabbar-buffer-list ()
  "Return the list of buffers to show in tabs.
Exclude buffers whose name starts with a space or an asterisk.
The current buffer and buffers matches `my-tabbar-displayed-buffers'
are always included."
  (let* ((hides (list ?\  ?\*))
         (re (regexp-opt my-tabbar-displayed-buffers))
         (cur-buf (current-buffer))
         (tabs (delq nil
                     (mapcar (lambda (buf)
                               (let ((name (buffer-name buf)))
                                 (when (or (string-match re name)
                                           (not (memq (aref name 0) hides)))
                                   buf)))
                             (buffer-list)))))
    ;; Always include the current buffer.
    (if (memq cur-buf tabs)
        tabs
      (cons cur-buf tabs))))

(setq tabbar-buffer-list-function 'my-tabbar-buffer-list)

;; keybind
(global-set-key (kbd "s-<right>") 'tabbar-forward)
(global-set-key (kbd "s-<left>") 'tabbar-backward)
(global-set-key (kbd "s-S-<right>")   'tabbar-forward-group)
(global-set-key (kbd "s-S-<left>")  'tabbar-backward-group)
