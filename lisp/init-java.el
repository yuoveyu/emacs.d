

(use-package lsp-java
:ensure t
:config (add-hook 'java-mode-hook 'lsp))

;;(use-package dap-java
;;:ensure t)

;;(use-package lsp-java-boot
;;:ensure t)

;; to enable the lenses
(add-hook 'lsp-mode-hook #'lsp-lens-mode)
(add-hook 'java-mode-hook #'lsp-java-boot-lens-mode)


(provide 'init-java)