;;; init-evil.el --- evil configuration -*- coding: utf-8; lexical-binding: t -*-
(use-package evil
  :ensure t
  :custom ((evil-want-C-i-jump nil))  ;;evil下TAB不绑定，让org-mode生效
  )

(evil-mode 1)

(define-key evil-motion-state-map" " nil) 
;;(define-key evil-normal-state-map "\C-f" 'evil-forward-char)

(provide 'init-evil)
