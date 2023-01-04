;;; init.el --- .emacs.d start -*- lexical-binding: t -*-
;;; Commentary:

;;; This file start the configuration

;;; Code:

(setq gc-cons-threshold most-positive-fixnum)
(setq message-log-max t)
(setq debug-on-error nil)

(defconst emacs-cache-directory
  (expand-file-name (concat user-emacs-directory ".cache/"))
  "Emacs cache directory.")

;;(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(defconst my-emacs-d (file-name-as-directory user-emacs-directory)
  "Directory of emacs.d.")

(defconst my-lisp-dir (concat my-emacs-d "lisp")
  "Directory of personal configuration.")

;; Light weight mode, fewer packages are used.
(setq my-lightweight-mode-p (and (boundp 'startup-now) (eq startup-now t)))

(defun require-init (pkg &optional maybe-disabled)
  "Load PKG if MAYBE-DISABLED is nil or it's nil but start up in normal slowly."
  (when (or (not maybe-disabled) (not my-lightweight-mode-p))
    (load (file-truename (format "%s/%s" my-lisp-dir pkg)) t t)))

;; Require package
(require-init 'init-elpa t) ; 下载源
(require-init 'init-start t) ; 启动页面
(require-init 'init-settings t) ;设置
(require-init 'init-evil t)  ;vim
(require-init 'init-key t) ; key
(require-init 'init-ivy t)  ; ivy
(require-init 'init-window t) ;窗口
(require-init 'init-file t)  ;文件和文件树
(require-init 'init-theme t) ;主题
(require-init 'init-code t);
(require-init 'init-java t)  ;java
;;(require 'init-python)  ;python
;;(require 'init-go)  ;go
;;(require 'init-web)  ;web
;;(require 'init-js)  ;web
(require-init 'init-org t) ;other
(require-init 'init-other t) ;other
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
   '(bing-dict browse-kill-ring treemacs-all-the-icons company-tabnine company-box company window-numbering which-key use-package treemacs-projectile treemacs-persp treemacs-magit treemacs-icons-dired treemacs-evil rainbow-delimiters popper org-superstar org-super-agenda org-pomodoro org-bullets org-appear marginalia lsp-treemacs ivy-rich highlight-symbol general evil-org doom-modeline dashboard counsel-projectile amx all-the-icons))
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
