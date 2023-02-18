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

(add-to-list 'load-path (expand-file-name "lisp" "/opt/dir/emacs.d"))
(require 'init-elpa) ; 下载源
(require 'init-start) ; 启动页面
(require 'init-settings) ;设置
(require 'init-evil)  ;vim
(require 'init-key) ; key
(require 'init-ivy)  ; ivy
(require 'init-window) ;窗口
(require 'init-file)  ;文件和文件树
(require 'init-theme) ;主题
(require 'init-yu) ;yu config
(require 'init-other) ;yu config
;;(require-init 'init-code t);

(require 'init-org) ;other


 (setq org-directory "/opt/dir/yuorg/org")
 (setq org-agenda-files (list org-directory))
;;(require 'init-start) ; 启动页面
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
