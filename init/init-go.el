;;; init-go.el --- GO tools

;;; Commentary:

;;; Code:

(use-package go-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.go$" . go-mode)))

(provide 'init-go)

;;; init-go.el ends here
