;;tango-dark
(load-theme 'modus-vivendi t)

(use-package doom-modeline
  :ensure t
  :hook
  (after-init . doom-modeline-mode)
  :config
  (setq doom-modeline-project-detection 'project))


(provide 'init-theme)