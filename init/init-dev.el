;;; init-dev.el --- Basic development tools

;;; Commentary:

;;; Code:

(use-package projectile
  :ensure t
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :config (projectile-mode +1))

(use-package restclient :ensure t)

(use-package magit
  :ensure t
  :bind ("\C-xg" . magit-status))

(use-package auto-complete :ensure t)

(use-package flycheck
  :ensure t
  :config (global-flycheck-mode))

(use-package multi-vterm :ensure t)

(use-package docker
  :ensure t
  :bind ("C-c d" . docker))

(provide 'init-dev)

;;; init-dev.el ends here
