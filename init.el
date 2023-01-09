;;; init.el --- .emacs.d start -*- lexical-binding: t -*-
;;; Commentary:

;;; This file start the configuration

;;; Code:

(setq gc-cons-threshold most-positive-fixnum)
(setq file-name-handler-alist nil)
(setq message-log-max t)
(setq debug-on-error nil)

(defconst emacs-cache-directory
  (expand-file-name (concat user-emacs-directory ".cache/"))
  "Emacs cache directory.")

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path "~/.emacs.d/site-lisp/lazy-load") ; add sort-tab to your load-path
(require 'lazy-load)


;; Require package
(require 'init-elpa) ; 下载源
(require 'init-start) ; 启动页面
(require 'init-settings) ;设置
(require 'init-evil)  ;vim
(require 'init-key) ; key
(require 'init-ivy)  ; ivy
(require 'init-window) ;窗口
(require 'init-file)  ;文件和文件树
(require 'init-theme) ;主题

;;(require-init 'init-code t);
(lazy-load-global-keys
 '(("C-c t c" . enable-code))
 "init-code")

(lazy-load-global-keys
 '(("C-c t j" . enable-java))
 "init-java")
;;(require-init 'init-java t)  ;java
;;(require 'init-python)  ;python
;;(require 'init-go)  ;go
;;(require 'init-web)  ;web
;;(require 'init-js)  ;web
(require 'init-org) ;other


(require 'init-other) ;other
(lazy-load-global-keys
 '(("h" . enable-hightlight)
   ("g" . enable-magit)
   ("e" . enable-eaf)
   ("b" . enable-bing-dict))
 "init-other"
 "C-c t")

;;(require 'init-markdown) ;markdown




(provide 'init)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("171d1ae90e46978eb9c342be6658d937a83aaa45997b1d7af7657546cae5985b" default))
 '(package-selected-packages
   '(dap-mode lsp-ivy lsp-ui flycheck lsp-java yasnippet-snippets yasnippet dynamic-fonts bing-dict browse-kill-ring treemacs-all-the-icons company-tabnine company-box company window-numbering which-key use-package treemacs-projectile treemacs-persp treemacs-magit treemacs-icons-dired treemacs-evil rainbow-delimiters popper org-superstar org-super-agenda org-pomodoro org-bullets org-appear marginalia lsp-treemacs ivy-rich highlight-symbol general evil-org doom-modeline dashboard counsel-projectile amx all-the-icons))
 '(select-enable-clipboard t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; init.el ends here
