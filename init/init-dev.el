;;; init-dev.el --- Basic development tools

;;; Commentary:

;;; Code:

(use-package ivy :ensure t)

(use-package projectile
  :ensure t
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :config
  (projectile-mode +1)
  (setq projectile-completion-system 'ivy))

(require 'ansi-color)

(defun my/ansi-colorize-buffer ()
  "Colorize compilation buffer."
  (let ((buffer-read-only nil))
    (ansi-color-apply-on-region (point-min) (point-max))))

(add-hook 'compilation-filter-hook 'my/ansi-colorize-buffer)

(use-package restclient
  :ensure t
  :init
  (add-hook 'restclient-mode-hook #'(lambda ()
				      ;; Use spaces for indent
				      (setq-local tab-width 2)
				      )))

(use-package magit :ensure t)

(use-package auto-complete :ensure t)

(use-package flycheck
  :ensure t
  :config (global-flycheck-mode))

(use-package multi-vterm :ensure t)

(use-package docker
  :ensure t
  :bind ("C-c d" . docker))

(setenv "DOCKER_HOST" "unix:///run/user/1000/docker.sock")

(setq js-indent-level 2)

(use-package lsp-bridge
  :straight '(lsp-bridge :type git :host github :repo "manateelazycat/lsp-bridge"
            :files (:defaults "*.el" "*.py" "acm" "core" "langserver" "multiserver" "resources")
            :build (:not compile))
  :init
  (global-lsp-bridge-mode)
  (yas-global-mode 1))

(setq lsp-bridge-enable-hover-diagnostic nil)
(setq lsp-bridge-enable-diagnostics nil)

(provide 'init-dev)

;;; init-dev.el ends here
