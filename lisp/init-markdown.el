;;; init-markdown.el --- markdown config -*- lexical-binding: t -*-
;;; Commentary:

;;; This file markdown the configuration

;;; Code:

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode ("/README\\(?:\\.\\(?:markdown\\|md\\)\\)?\\'" . gfm-mode)
  :init
  (setq markdown-enable-wiki-links t
	markdown-italic-underscore t
	markdown-asymmetric-header t
	markdown-make-gfm-checkboxes-buttons t
	markdown-fontify-code-blocks-natively t
	markdown-hide-urls nil
	markdown-enable-math t
	markdown-gfm-uppercase-checkbox t))

(setq markdown-command "~/.bin/pandoc")
;C-c C-c p 预览调用markdown命令

(provide 'init-markdown)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; init-markdown.el ends here
