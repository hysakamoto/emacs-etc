;; ;===============================================================
;; ; Startup
;; ;===============================================================
;; ;; want two windows at startup 
;; ;; (split-window-horizontally)

;; ;; default window width and height
;; (defun custom-set-frame-size ()
;;   (add-to-list 'default-frame-alist '(height . 40))
;;   (add-to-list 'default-frame-alist '(width . 100)))
;; (custom-set-frame-size)
;; (add-hook 'before-make-frame-hook 'custom-set-frame-size)


;; ;; ===============================================================
;; ;; recenter horizontally
;; ;; ===============================================================
;; (defun my-horizontal-recenter ()
;;   "make the point horizontally centered in the window"
;;   (interactive)
;;   (let ((mid (/ (window-width) 2))
;;         (line-len (save-excursion (end-of-line) (current-column)))
;;         (cur (current-column)))
;;     (if (< mid cur)
;;         (set-window-hscroll (selected-window)
;;                             (- cur mid)))))

;; (global-set-key (kbd "C-S-l") 'my-horizontal-recenter)


;; (defun toggle-fullscreen ()
;;   (interactive)
;;   (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
;; 	    		 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
;;   (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
;; 	    		 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
;; )
;; (toggle-fullscreen)
