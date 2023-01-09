;;; init-java.el --- java config -*- lexical-binding: t -*-
;;; Commentary:

;;; This file java the configuration

;;; Code:
(setq path-to-lombok "/opt/dir/d/soft/lombok.jar")
(setq lsp-java-vmargs
            `("-noverify"
              "-Xmx1G"
              "-XX:+UseG1GC"
              "-XX:+UseStringDeduplication"
              ,(concat "-javaagent:" path-to-lombok)
              ,(concat "-Xbootclasspath/a:" path-to-lombok)))

(defun enable-java ()
    "初始化java配置"
     (interactive)
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
)



(provide 'init-java)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; init-java.el ends here
