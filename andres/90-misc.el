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
(define-key evil-normal-state-map (kbd ",n") 'switch-to-buffer)

;; time
(defun insert-current-time () (interactive)
       (move-end-of-line nil)
       (insert "\n")
       (insert (shell-command-to-string "echo -n $(date +%H:%M) "))
       (insert " ")
       (evil-insert-state))
(define-key evil-normal-state-map (kbd ",t") 'insert-current-time)

;;; Enable helm-mode
;;; Enable Helm
(require 'helm)
(require 'helm-config)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

;;; Evil-ify helm
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-j") 'helm-next-line)
(define-key helm-map (kbd "C-k") 'helm-previous-line)
(define-key helm-map (kbd "C-d") 'helm-next-page)
(define-key helm-map (kbd "C-u") 'helm-previous-page)

;;; C-p to search for files
(global-set-key (kbd "C-p") 'helm-multi-files)
(define-key evil-normal-state-map (kbd "C-p") 'helm-multi-files)

(setq
 ;; open helm buffer inside current window
 helm-split-window-in-side-p t
 ;; Search for library in `require' and `declare-function'
 helm-ff-search-library-in-sexp t
 ;; scroll 8 lines other window using M-<next>/M-<prior>
 helm-scroll-amount 8
 helm-ff-file-name-history-use-recentf t
 ;; Circular movement in helm.
 helm-move-to-line-cycle-in-source t
 )

(helm-mode 1)

;;; Descbinds
(require 'helm-descbinds)
(helm-descbinds-mode 1)

;;; Great Helm tutorial
;;; http://tuhdo.github.io/helm-intro.html#sec-2

;;; CtrlP is helm with projectile
(define-key evil-normal-state-map (kbd "C-p") 'helm-projectile)

;;; Symbol browser
(define-key evil-normal-state-map (kbd "r") 'helm-imenu)

(defun helm-multi-all-custom ()
  "multi-occur in all buffers backed by files."
  (interactive)
  (helm-multi-occur
   (delq nil
	 (mapcar (lambda (b)
		   (when (buffer-file-name b) (buffer-name b)))
		          (buffer-list)))))




