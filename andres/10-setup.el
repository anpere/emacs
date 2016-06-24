(message "andres/10-setup.el runs")
;; setup appropriate packages
;;(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
;;                         ("org" . "http://orgmode.org/elpa/")
;;                         ("gnu" . "http://elpa.gnu.org/packages/")))
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(defun my-require-package (name)
  (when (not (package-installed-p name))
    (package-refresh-contents)
    (package-install name)))

