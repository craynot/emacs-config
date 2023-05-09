;;; init-lisp.el --- lisp

;;; Commentary:

;;; Code:

(add-hook  'emacs-lisp-mode-hook
		   (lambda ()
			 (when (require 'auto-complete nil t)
			   (make-variable-buffer-local 'ac-sources)
			   (auto-complete-mode t))))

(provide 'init-lisp)

;;; init-lisp.el ends here
