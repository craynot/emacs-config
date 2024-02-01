;;; init-markdown.el --- MD

;;; Commentary:

;;; Code:

(use-package markdown-soma :ensure t)
(use-package markdown-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode)))


(provide 'init-markdown)

;;; init-markdown.el ends here
