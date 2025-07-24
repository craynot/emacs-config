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
  (drag-stuff-define-keys))

(use-package treesit
  :config
  (add-to-list 'treesit-language-source-alist
	       '(json "https://github.com/tree-sitter/tree-sitter-json"))
  (add-to-list 'treesit-language-source-alist
	       '(dockerfile "https://github.com/camdencheek/tree-sitter-dockerfile")))

(defun open-project-org-file ()
  "Open a project-specific .org file in `verb-file-dir`.
Prioritizes projectile-project-name if available, otherwise falls back to:
1. Projectile's root directory name
2. project.el's root directory name

Checks:
1. If `verb-file-dir` variable exists
2. If directory exists
3. If we can detect a project name"
  (interactive)
  
  ;; 1. Validate required variable
  (unless (boundp 'verb-file-dir)
    (error "Variable `verb-file-dir` is not defined"))

  ;; 2. Validate directory exists
  (unless (file-directory-p verb-file-dir)
    (error "Target directory doesn't exist: %s" verb-file-dir))

  (let* (;; 3. Try to get project name (priority order):
         ;;    a. projectile-project-name (if defined)
         ;;    b. projectile-project-root basename
         ;;    c. project.el root basename
         (project-name (cond
                       ((and (fboundp 'projectile-project-name)
                             (projectile-project-name)))
                       ((fboundp 'projectile-project-root)
                        (file-name-base (directory-file-name
                                         (projectile-project-root))))
                       ((fboundp 'project-current)
                        (file-name-base (directory-file-name
                                         (project-root (project-current)))))))
         
         ;; 4. Build target filename
         (org-file (when project-name
                     (expand-file-name (concat project-name ".org") verb-file-dir))))

    ;; 5. Handle file operations
    (cond
     ((not project-name)
      (message "No project detected in current buffer"))
     ((not org-file)
      (message "Failed to construct valid file path"))
     ((file-exists-p org-file)
      (find-file org-file))
     (t
      (when (y-or-n-p (format "Create new file at %s?" org-file))
        (write-region "" nil org-file)  ; Create empty file
        (find-file org-file))))))

(provide 'init-base)

;;; init-base.el ends here
