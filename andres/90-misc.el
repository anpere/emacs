;;
;;; Enable evil-mode
(require 'evil)
(evil-mode 1)
(evil-escape-mode 1)
(setq-default evil-escape-key-sequence "fd")
(setq-default evil-escaped-delay 0.1)

;; define emacs key-mappings
(defun my-lisp-hook ()
  (elisp-slime-nav-mode)
  (turn-on-eldoc-mode)
  )
(add-hook 'emacs-lisp-mode-hook 'my-lisp-hook)
(evil-define-key 'normal emacs-lisp-mode-map (kbd "K")
  'elisp-slime-nav-describe-elisp-thing-at-point)


(define-key evil-normal-state-map (kbd ",wa") 'evil-window-left)
(define-key evil-normal-state-map (kbd ",we") 'evil-window-right)
(define-key evil-normal-state-map (kbd ",wo") 'evil-window-down)
(define-key evil-normal-state-map (kbd ",w,") 'evil-window-up)
(define-key evil-normal-state-map (kbd ",b") 'ibuffer) 

;; buffers
(define-key evil-normal-state-map (kbd "SPC") 'save-buffer)
(define-key evil-normal-state-map (kbd ",k") 'kill-this-buffer)
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
