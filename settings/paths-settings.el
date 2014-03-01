;===============================================================
;; load path for local elisp files
;===============================================================
;; (setq load-path (cons "~/.emacs.d/elisp" load-path))
;; load path for elpa packages 
(setq load-path (cons "~/.emacs.d/elpa" load-path))
(let* ((my-lisp-dir "~/.emacs.d/elpa")
       (default-directory my-lisp-dir)
       (orig-load-path load-path))
  (setq load-path (cons my-lisp-dir nil))
  (normal-top-level-add-subdirs-to-load-path)
  (nconc load-path orig-load-path))

;; ispell
;; (setq ispell-program-name "/usr/local/bin/aspell")

;; ; set PATH, because we don't load .bashrc
;; (setenv
;;  "PATH" (concat
;; 		 "/usr/local/bin:"
;; 		 "/usr/bin:/bin:"
;; 		 "/usr/sbin:/sbin"))

;; (setq exec-path (append exec-path '("/usr/local/bin")))

;; ;; Set PYTHONPATH, because we don't load .bashrc
;; (setenv "PYTHONPATH"
;; 		(concat
;; 		 "/usr/local/src/fenics/dolfin/lib/python2.7/site-packages" ":"
;; 		 "/usr/local/Cellar/sip/4.15.4/lib/python2.7/site-packages" ":"
;; 		 "/usr/local/Cellar/pyqt/4.10.3/lib/python2.7/site-packages" ":"
;; 		 "/Users/ysakamoto/.virtualenvs/ys-mbp/lib/python2.7/site-packages" ":"
;; 		 (getenv "PYTHONPATH")
;; 		 )
;; 		)

;; ;; example of setting env var named “path”, by appending a new path to existing path
;; (setenv "PATH"
;; 		(concat
;; 		 "/usr/local/src/fenics/dolfin/bin" ":"
;; 		 (getenv "PATH")
;; 		 )
;; 		)

;; (setenv "DYLD_LIBRARY_PATH"
;; 		(concat
;; 		 "/usr/local/src/fenics/dolfin/lib" ":"
;; 		 (getenv "DYLD_LIBRARY_PATH")
;; 		 )
;; 		)


;; (setenv "PKG_CONFIG_PATH"
;; 		(concat
;; 		 "/usr/local/src/fenics/dolfin/lib/pkgconfig" ":"
;; 		 (getenv "PKG_CONFIG_PATH")
;; 		 )
;; 		)


;; (setenv "MANPATH"
;; 		(concat
;; 		 "/usr/local/src/fenics/dolfin/share/man" ":"
;; 		 (getenv "MANPATH")
;; 		 )
;; 		)


;; (setenv "DYLD_FRAMEWORK_PATH"
;; 		(concat
;; 		 "/opt/local/Library/Frameworks" ":"
;; 		 (getenv "DYLD_FRAMEWORK_PATH")
;; 		 )
;; 		)



;; (setenv "UFC_DIR" "/usr/local/src/fenics/ufc/share/ufc")


