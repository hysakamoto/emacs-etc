;===============================================================
; Windows.el
;===============================================================
;; change key-binding 
;; default: C-c C-w
;; delete next 3 lines if you don't want to change
;; (setq win:switch-prefix "\C-z")
;; (define-key global-map win:switch-prefix nil)
;; (define-key global-map "\C-z1" 'win-switch-to-window)
;; (require 'windows)
;; ;; do not create a new frame
;; (setq win:use-frame nil)
;; (win:startup-with-window)
;; (define-key ctl-x-map "C" 'see-you-again)

;===============================================================
; workgroups.el
;===============================================================
;; (require 'workgroups2)

;; ;; session file
;; (setq wg-session-file "~/.emacs.d/.emacs_workgroups")

;; ;; Change prefix key (before activating WG)
;; (setq wg-prefix-key (kbd "C-z"))
;; (global-set-key (kbd "C-z <right>") 'wg-switch-to-workgroup)
;; (global-set-key (kbd "C-z <left>") 'wg-switch-to-previous-workgroup)


;; (workgroups-mode 1)


;; ;===============================================================
;; ; perspective.el
;; ;===============================================================
;; (require 'perspective)

;; ;; key bindings
;; (add-hook 'persp-mode-hook
;;           '(lambda ()
;; 			 (local-set-key (kbd "C-z s") 'persp-switch)
;; 			 (local-set-key (kbd "C-z r") 'persp-remove-buffer)
;; 			 (local-set-key (kbd "C-z k") 'persp-kill)
;; 			 (local-set-key (kbd "C-z A") 'persp-rename)
;; 			 (local-set-key (kbd "C-z a") 'persp-add-buffer)
;; 			 (local-set-key (kbd "C-z R") 'persp-set-buffer)
;; 			 (local-set-key (kbd "C-z i") 'persp-import)
;; 			 (local-set-key (kbd "C-z n") 'persp-next)
;; 			 (local-set-key (kbd "C-z <right>") 'persp-next)
;; 			 (local-set-key (kbd "C-z p") 'persp-prev)
;; 			 (local-set-key (kbd "C-z <left>") 'persp-prev)))

;; ;; (define-globalized-minor-mode global-persp-mode persp-mode
;; ;;   (lambda () (persp-mode 1)))

;; ;; (global-persp-mode 1)


;; ===============================================================
;; elscreen										;
;; elscreen-separate-buffer-list
;; elscreen-persist
;; ===============================================================
(setq elscreen-prefix-key (kbd "C-z"))
(elscreen-start)

;; no [X] at the beginning of tabs
(setq elscreen-tab-display-kill-screen nil)
;; no [<->]
(setq elscreen-tab-display-control nil)

;; (elscreen-persist-mode 1)
(elscreen-separate-buffer-list-mode 1)
(setq elscreen-next)

(global-set-key (kbd "C-z v") 'helm-elscreen)

;; ===============================================================
;; persp-mode.el
;; ===============================================================
;; (setq persp-keymap-prefix (kbd "C-c p")) ;prefix
;; (setq persp-add-on-switch-or-display t) ;バッファを切り替えたら見えるようにする
;; (persp-mode 1)
;; (defun persp-register-buffers-on-create ()
;;   (interactive)
;;   (dolist (bufname (condition-case _
;;                        (helm-comp-read
;;                         "Buffers: "
;;                         (mapcar 'buffer-name (buffer-list))
;;                         :must-match t
;;                         :marked-candidates t)
;;                      (quit nil)))
;;     (persp-add-buffer (get-buffer bufname))))
;; (add-hook 'persp-activated-hook 'persp-register-buffers-on-create)
