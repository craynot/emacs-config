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


;; Initialization

(require 'init-base)
(require 'init-dev)
(require 'init-php)
(require 'init-yaml)
(require 'init-sql)
(require 'init-markdown)
(require 'init-bind)

(provide 'init)

;;; init.el ends here
