(setq gc-cons-threshold most-positive-fixnum)
(setq message-log-max t) 
(setq debug-on-error nil)

(defconst emacs-cache-directory
  (expand-file-name (concat user-emacs-directory ".cache/"))
  "Emacs cache directory.")

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

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
;;(require 'init-lsp)  ;lsp
(require 'init-code);
(require 'init-java)  ;java
;;(require 'init-python)  ;python
;;(require 'init-go)  ;go
;;(require 'init-web)  ;web
;;(require 'init-js)  ;web
(require 'init-org) ;other
(require 'init-other) ;other
;;(require 'init-markdown) ;markdown

(provide 'init)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(treemacs-all-the-icons company-tabnine company-box company window-numbering which-key use-package undo-tree treemacs-projectile treemacs-persp treemacs-magit treemacs-icons-dired treemacs-evil rainbow-delimiters popper org-superstar org-super-agenda org-pomodoro org-bullets org-appear marginalia lsp-treemacs ivy-rich highlight-symbol general evil-org doom-modeline dashboard counsel-projectile amx all-the-icons)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
