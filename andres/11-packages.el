(mapcar 'my-require-package
	'(
  evil
  evil-escape
  helm
  helm-descbinds
  powerline
  powerline-evil
  solarized-theme
  ace-jump-mode
  ag
  projectile
  evil-surround
  auto-complete
  helm-projectile
  linum-relative
  column-marker
  flymake-python-pyflakes
  ))

(require 'ace-jump-mode)
(projectile-global-mode)

(add-to-list 'load-path "~/.emacs.d/vendor")
