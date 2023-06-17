;;; init-theme.el --- theme config -*- lexical-binding: t -*-
;;; Commentary:

;;; This file theme the configuration

;;; Code:

;;; load-theme: tango-dark
;;(load-theme 'modus-vivendi t)
;;(load-theme 'vs-dark t)
;;(use-package spacemacs-theme
;;  :ensure t)
;;(use-package nord-theme
;;  :ensure t)
(use-package spacemacs-theme
  :ensure t)

(load-theme 'spacemacs-dark t);;nord
(use-package doom-modeline
  :ensure t
  :hook
  (after-init . doom-modeline-mode)
  :config
  (setq doom-modeline-project-detection 'project)
  (setq doom-modeline-icon t)
  (setq doom-modeline-major-mode-color-icon t)
  (setq doom-modeline-major-mode-icon t)
  )


(provide 'init-theme)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; init-theme.el ends here
