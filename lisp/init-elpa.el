;;; init-elpa.el --- elpa change -*- lexical-binding: t -*-
;;; Commentary:

;;; This file elpa change the configuration

;;; Code:

(require 'package)

(setq package--init-file-ensured t      package-user-dir (expand-file-name "elpa" emacs-cache-directory)
      package-enable-at-startup nil
      package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                        ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(provide 'init-elpa)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; init-elpa.el ends here
