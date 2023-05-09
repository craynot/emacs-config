;;; init-dev.el --- Base initialization

;;; Commentary:
;;; Code:

(setq ring-bell-function 'ignore)

(setq custom-file (concat user-emacs-directory "custom.el"))

(setq-default truncate-lines t)
(setq-default inhibit-startup-message t)

(fset 'yes-or-no-p 'y-or-n-p)

(customize-set-variable 'tramp-default-method "ssh")

(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; (setq default-buffer-file-coding-system 'utf-8)
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)) ;; From Emacs wiki


(defun bar-off ()
  "Disable all bars."
  (interactive)
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

(bar-off)

(use-package color-theme-modern
  :ensure t
  :config
  (load-theme 'hober t t)
  (enable-theme 'hober))

(use-package drag-stuff
  :ensure t
  :config
  (drag-stuff-global-mode 1)
  (drag-stuff-define-keys)
  )

(provide 'init-base)

;;; init-base.el ends here
