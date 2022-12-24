
(use-package company
  :ensure t
  :init (global-company-mode)
  :config
  (setq company-minimum-prefix-length 1) ; 只需敲 1 个字母就开始进行自动补全
  (setq company-tooltip-align-annotations t)
  (setq company-idle-delay 0.0)
  (setq company-show-numbers t) ;; 给选项编号 (按快捷键 M-1、M-2 等等来进行选择).
  (setq company-selection-wrap-around t)
  (setq company-transformers '(company-sort-by-occurrence))) ; 根据选择的频率进行排序，读者如果不喜欢可以去掉

(use-package company-box
  :ensure t
  :if window-system
  :hook (company-mode . company-box-mode))

;;AI智能补全
(use-package company-tabnine
  :ensure t
  :init (add-to-list 'company-backends #'company-tabnine))

;;代码片段
(use-package yasnippet
  :ensure t
  ;;:init
  ;;(yas-reload-all)
  :hook
  (prog-mode . yas-minor-mode)
  :config
  ;; add company-yasnippet to company-backends
  (defun company-mode/backend-with-yas (backend)
    (if (and (listp backend) (member 'company-yasnippet backend))
	backend
      (append (if (consp backend) backend (list backend))
              '(:with company-yasnippet))))
  (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))
  ;; unbind <TAB> completion
  (define-key yas-minor-mode-map [(tab)]        nil)
  (define-key yas-minor-mode-map (kbd "TAB")    nil)
  (define-key yas-minor-mode-map (kbd "<tab>")  nil)
  :bind
  (:map yas-minor-mode-map ("S-<tab>" . yas-expand)))

(use-package yasnippet-snippets
  :ensure t
  :after yasnippet)

;;代码检测
(use-package flycheck
  :ensure t
  :config
  (setq truncate-lines nil) ; 如果单行信息很长会自动换行
  :hook
  (prog-mode . flycheck-mode))




(add-to-list 'load-path "~/.emacs.d/site-lisp/lsp-bridge")

(require 'yasnippet)
(require 'lsp-bridge)
(require 'lsp-bridge-jdtls)       ;; 提供Java第三方库跳转和-data目录支持， Java用户必选

(yas-global-mode 1)
(global-lsp-bridge-mode)  

(provide 'init-code)
