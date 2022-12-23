(load-theme 'tango-dark t)

(use-package doom-modeline
  :hook
  (after-init . doom-modeline-mode)
  :config
  (setq doom-modeline-project-detection 'project))


(provide 'init-theme)
