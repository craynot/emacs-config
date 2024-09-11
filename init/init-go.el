;;; init-go.el --- GO tools

;;; Commentary:

;;; Code:

(use-package go-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.go$" . go-mode))
  :init
  (add-hook 'go-mode-hook #'(lambda ()
			      (add-hook 'before-save-hook
					#'gofmt-before-save
					nil t)
			      ;; Lsp jump-to
			      (define-key go-mode-map (kbd "M-]")
					  'lsp-bridge-find-def)
			      (define-key go-mode-map (kbd "M-[")
					  'lsp-bridge-find-def-return))))

(provide 'init-go)

;;; init-go.el ends here
