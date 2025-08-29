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

(use-package json-ts-mode
  :straight (:type built-in)
  :defer t
  :ensure t
  :init
  (add-to-list 'major-mode-remap-alist
	       '(json-mode . json-ts-mode))
  :config
  (add-hook 'json-ts-mode-hook
            (lambda ()
              (make-local-variable 'js-indent-level)
              (setq-local tab-width 4)
	      (setq-local indent-tabs-mode nil)
              (setq-local json-ts-mode-indent-offset 4)))
  (add-to-list 'auto-mode-alist '("\\.json$" . json-ts-mode)))

(use-package lsp-bridge
  :straight '(lsp-bridge :type git :host github :repo "manateelazycat/lsp-bridge"
            :files (:defaults "*.el" "*.py" "acm" "core" "langserver" "multiserver" "resources")
            :build (:not compile))
  :init
  (global-lsp-bridge-mode)
  (yas-global-mode 1)
  (setq lsp-bridge-enable-hover-diagnostic nil)
  (setq lsp-bridge-enable-diagnostics nil))


(use-package protobuf-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.proto$" . protobuf-mode)))

(add-hook 'protobuf-mode-hook
          (lambda ()
            (setq c-basic-offset 4)
            (setq indent-tabs-mode nil)))

(use-package dockerfile-ts-mode
  :straight (:type built-in)
  :defer t
  :mode (("\\Dockerfile\\'" . dockerfile-ts-mode)
         ("\\.dockerignore\\'" . dockerfile-ts-mode)))



(provide 'init-dev)

;;; init-dev.el ends here
