;===============================================================
; C/C++ Build
;===============================================================

;; This stuff is to ansi-colorize the compilation buffer after a
;; rails test so the terminal colors come through.
(define-derived-mode ansi-compilation-mode compilation-mode "ansi compilation"
  "Compilation mode that understands ansi colors."
  (require 'ansi-color)
  (toggle-read-only 0)
  (ansi-color-apply-on-region (point-min) (point-max)))

(defun colorize-compilation (one two)
  "ansi colorize the compilation buffer."
  (ansi-compilation-mode)
 )

(setq compilation-finish-function 'colorize-compilation)


(setq auto-mode-alist
      (append '(("\\.C$"  . c++-mode)
                ("\\.cc$" . c++-mode)
                ("\\.cpp$". c++-mode)
                ("\\.hh$" . c++-mode)
                ("\\.c$"  . c-mode)
                ("\\.h$"  . c++-mode))
              auto-mode-alist))

;; [F9]: run
;; [F7]: compile
;; [F4]: jump to an error line
;; [F1]: open manual for a word
;; SHIFT+[F7]: make clean
;; SHIFT+[F4]: jump to a previous error line
(add-hook 'c-mode-common-hook
     '(lambda ()
        (require 'vc-hooks)
        (setq completion-mode t)
        ;; make のオプションは聞いてこない
        (setq compilation-read-command nil)
        ;; make するとき 全バッファを自動的にsaveする
        (setq compilation-ask-about-save nil)
        (define-key c-mode-base-map [f1] 'manual-entry)
        (define-key c-mode-base-map [f4] 'next-error)
        (define-key c-mode-base-map [(shift f4)] 'previous-error)
        (define-key c-mode-base-map [f7] 'compile)
        (define-key c-mode-base-map [(shift f9)] 'kill-compilation)
	(define-key c-mode-base-map [(shift f7)] 
          '(lambda () 
             (interactive)
             ;;(require 'compile)
             ;;(save-some-buffers (not compilation-ask-about-save) nil)
             (compile-start "make clean" "No more errors")))
	(define-key c-mode-base-map [f9] 
          '(lambda () 
             (interactive)
             ;;(require 'compile)
             ;;(save-some-buffers (not compilation-ask-about-save) nil)
             (compilation-start "make run")))
      ))


;; for annoying macro indentation in openmp
;; (c-set-offset (quote cpp-macro) 0 nil)



;===============================================================
; GDB Mode
;===============================================================
(setq gdb-many-windows t)
(setq gdb-use-separate-io-buffer t) ; "IO buffer" が必要ない場合は  nil で
