;;; init-start.el --- start config -*- lexical-binding: t -*-
;;; Commentary:

;;; This file start the configuration

;;; Code:

;;欢迎页面
(use-package dashboard
  :ensure t
  :config
  (setq dashboard-banner-logo-title "Welcome to yumore Emacs!") ;; 个性签名
   (setq dashboard-projects-backend 'projectile)
  (setq dashboard-items '((recents  . 5)   ;; 显示多少个最近文件
			  (bookmarks . 5)  ;; 显示多少个最近书签
			  (agenda . 5)
			  (projects . 5))) ;; 显示多少个最近项目
  (dashboard-setup-startup-hook))


(defun dashboard-insert-custom (list-size)
  "dashboard insert custom"
  (insert "I love emacs day by day!!!"))

(add-to-list 'dashboard-item-generators  '(custom . dashboard-insert-custom))
(add-to-list 'dashboard-items '(custom) t)
(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)
(setq dashboard-set-navigator t)
(setq dashboard-center-content t)

(provide 'init-start)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; init-start.el ends here
