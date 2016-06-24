;;; Original author of this emacs setup was miles steele, I have modified it to fit my specifc neeeds
;;; Add my directory to the load path.
;;; (add-to-list 'load-path (expand-file-name "miles" user-emacs-directory))


;(add-to-list 'load-path "~/.emacs.d/lisp/")
(setq user-emacs-directory (file-name-directory user-init-file))
;; someday may need to add autoload, but miles says its nonsense
;; (load-file "/usr/local/share/emacs/site-lisp/proof-general/generic/proof-site.el")
;;; Load files in order from ~/.emacs.d/miles
(let* ((dir (expand-file-name "andres" user-emacs-directory))
       (files (directory-files dir t "^..-.*\.el$")))
  (dolist (file files)
    (load file)))
