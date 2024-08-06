;;; init.el --- Configuration

;;; Commentary:

;;; Code:

(defvar base-path (file-name-directory load-file-name))
(defvar vendor-path (concat base-path "vendor"))
(defvar init-path (concat base-path "init"))

(add-to-list 'load-path vendor-path)
(add-to-list 'load-path init-path)

;; Package

(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)



;; Initialization

(require 'init-base)
(require 'init-dev)
(require 'init-php)
(require 'init-go)
(require 'init-yaml)
(require 'init-sql)
(require 'init-markdown)
(require 'init-bind)

(provide 'init)

;;; init.el ends here
