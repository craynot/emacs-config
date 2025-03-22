;;; init-go.el --- GO tools

;;; Commentary:
;;
;; Example .dir.locals.el for rewriting gofmt-command:
;;
;; ((go-mode . ((gofmt-command . "my-go-fmt.sh"))))

;;; Code:

(use-package go-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.go$" . go-mode))
  (add-to-list 'safe-local-variable-values '(gofmt-command . "my-go-fmt.sh"))
  :init
  (add-hook 'go-mode-hook #'(lambda ()
			      (add-hook 'before-save-hook
                                        #'(lambda ()
                                            (when (eq major-mode 'go-mode)
                                              (let ((gofmt-command (or (cdr (assoc 'gofmt-command
                                                                                   (dir-locals-get-class-variables
                                                                                    (dir-locals-find-file default-directory))))
								       gofmt-command)))
						(gofmt-before-save))
                                              nil t)))))
  :bind (:map go-mode-map
              ("M-]" . lsp-bridge-find-def)
              ("M-[" . lsp-bridge-find-def-return)
              ("M-." . lsp-bridge-find-references)))

(provide 'init-go)

;;; init-go.el ends here
