;;; init-php.el --- PHP tools

;;; Commentary:

;;; Code:

(use-package php-ts-mode
  :straight '(php-ts-mode :type git :host github :repo "emacs-php/php-ts-mode"
            :files (:defaults "*.el"))
  :ensure t
  :init
  (add-hook 'php-ts-mode-hook #'(lambda ()
				 ;; Use spaces for indent
				 (setq-local indent-tabs-mode nil)
				 (setq-local tab-width 4)
				 ;; Lsp jump-to
				 (define-key php-ts-mode-map (kbd "M-]")
					     'lsp-bridge-find-def)
				 (define-key php-ts-mode-map (kbd "M-[")
					     'lsp-bridge-find-def-return)
				 (define-key php-ts-mode-map (kbd "M-.")
					     'lsp-bridge-find-references)
				 (define-key php-ts-mode-map (kbd "C-p")
					     'open-project-org-file)
				 
				 (setq-local show-trailing-whitespace t)))
  (customize-set-variable 'treesit-font-lock-level 4)
  (setq lsp-bridge-php-lsp-server "phpactor"))

(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("/views/.*\\.php" . web-mode))
  (add-to-list 'auto-mode-alist '("/view/.*\\.php" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (add-hook 'hack-local-variables-hook #'(lambda ()
					   (when (derived-mode-p 'web-mode)
					     (if (boundp 'web-mode-default-engine)
						 (web-mode-set-engine web-mode-default-engine))
					     )))
  :custom
  (web-mode-code-indent-offset 2))


(provide 'init-php)

;;; init-php.el ends here
