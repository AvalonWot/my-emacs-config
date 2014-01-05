;; ¸ÃÅäÖÃcopy×Ôredguardtoo(binchen)µÄEmacsÅäÖÃ
;; git@github.com:redguardtoo/emacs.d.git

(defun require-package (package &optional min-version no-refresh)
  "Ask elpa to install given PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
	(package-install package)
      (progn
	(package-refresh-contents)
	(require-package package min-version t)))))


(package-initialize)

(require-package 'smex)
(require-package 'evil)

(provide 'init-elpa)
