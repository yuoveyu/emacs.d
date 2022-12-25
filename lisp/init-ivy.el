;;; init-ivy.el --- ivy config -*- lexical-binding: t -*-
;;; Commentary:

;;; This file ivy the configuration

;;; Code:

;;; init-ivy.el
(use-package ivy
  :ensure t
  :diminish ivy-mode
  :hook (after-init . ivy-mode)
  :config
  (setq ivy-use-virtual-buffers t)
  (setq search-default-mode #'char-fold-to-regexp)
  (setq ivy-count-format "(%d/%d) ")
  :bind
  (("C-s" . 'swiper)
   ("C-x b" . 'ivy-switch-buffer)
   ("C-x C-@" . 'counsel-mark-ring); 在某些终端上 C-x C-SPC 会被映射为 C-x C-@，比如在 macOS 上，所以要手动设置
   ("C-x C-SPC" . 'counsel-mark-ring))
  :init
  (progn
    (setq ivy-height 12
	  ivy-wrap t
	  ivy-use-virtual-buffers t
	  ivy-fixed-height-minibuffer t)
    (setq-default projectile-completion-system 'ivy)))

(use-package ivy-rich
  :ensure t
  :hook (ivy-mode . ivy-rich-mode))



;;; init-evil.el --- evil config -*- lexical-binding: t -*-
;;; Commentary:

;;; This file evil the configuration

;;; Code:

(use-package counsel
  :ensure t
  :diminish ivy-mode counsel-mode
  :hook (after-init . counsel-mode)
  :bind (("M-x" . counsel-M-x))
  :init
  (progn
    (setq counsel-find-file-ignore-regexp "\\(?:^[#.]\\)\\|\\(?:[#~]$\\)\\|\\(?:^Icon?\\)|\\.DS_Store\\'|\\.git|\\.gitignore")
   ))

(use-package counsel-projectile)

(use-package swiper
  :ensure t
  :after ivy)


(provide 'init-ivy)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; init-ivy.el ends here
