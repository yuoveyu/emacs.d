;;; init-go.el --- go config -*- lexical-binding: t -*-
;;; Commentary:

;;; This file go the configuration

;;; Code:
(use-package go-mode
  ;; :load-path "~/.emacs.d/vendor/go-mode"
  :mode ("\\.go\\'" . go-mode)
  :init
  (setq gofmt-command "goimports"
        indent-tabs-mode t)
  :config
  (add-hook 'before-save-hook 'gofmt-before-save)
  :bind (:map go-mode-map
              ("\C-c \C-c" . compile)
              ("\C-c \C-g" . go-goto-imports)
              ("\C-c \C-k" . godoc)
              ("M-j" . godef-jump)))

(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

(provide 'init-go)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; init-go.el ends here
