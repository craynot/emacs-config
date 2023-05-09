;;; init-sql.el --- SQL

;;; Commentary:

;;; Code:

(require 'mysql)
(require 'sql-completion)

(setq sql-interactive-mode-hook
         (lambda ()
           (define-key sql-interactive-mode-map "\t" 'comint-dynamic-complete)
           (sql-mysql-completion-init)
	   ))

(provide 'init-sql)

;;; init-sql.el ends here
