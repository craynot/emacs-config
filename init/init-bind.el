;;; init-bind.el --- Global key bindings

;;; Commentary:

;;; Code:


;;(define-key global-map (kbd "RET") 'newline-and-indent)
(global-set-key [C-tab] "\C-q\t")
(global-set-key "\C-l" 'goto-line)
(global-set-key "\C-cs" 'multi-vterm-project)

(provide 'init-bind)

;;; init-bind.el ends here
