;;; init-bind.el --- Global key bindings

;;; Commentary:

;;; Code:


;;(define-key global-map (kbd "RET") 'newline-and-indent)
(global-set-key [C-tab] "\C-q\t")
(global-set-key "\C-l" 'goto-line)
(global-set-key "\C-cs" 'multi-vterm-project)
(global-set-key (kbd "C-c t") (lambda ()
                                (interactive)
                                (term "/bin/bash")))


(provide 'init-bind)

;;; init-bind.el ends here
