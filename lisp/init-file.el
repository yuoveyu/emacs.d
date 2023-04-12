;;; init-file.el --- file config -*- lexical-binding: t -*-
;;; Commentary:

;;; This file file the configuration

;;; Code:

;;项目管理
(use-package projectile
  :ensure t
  ;;:bind (("C-c p" . projectile-command-map))
  :config
  (setq projectile-mode-line "Projectile")
  ;;(setq projectile-track-known-projects-automatically t)
)

(use-package counsel-projectile
  :ensure t
  :after (projectile)
  :init (counsel-projectile-mode))


(provide 'init-file)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; init-file.el ends here
