;;; init-other.el --- other config -*- lexical-binding: t -*-
;;; Commentary:

;;; This file other the configuration

;;; Code:

;;字体图标
(use-package all-the-icons
   :ensure t)

;;常用命令排前面
(use-package amx
  :ensure t
  :init (amx-mode))

;;快速跳转
(use-package avy
  :ensure t)


;;高亮当前Buffer 中所有的、与光标所在处的符号相同的符号
(use-package highlight-symbol
  :ensure t
  :init (highlight-symbol-mode)
  :bind ("<f3>" . highlight-symbol)) ;; 按下 F3 键就可高亮当前符号

;;括号颜色标记，good
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

;;撤销树
;;(use-package undo-tree
;;  :ensure t
;;  :init (global-undo-tree-mode))


;;git插件
(use-package magit
  :ensure t)

(use-package marginalia
  :ensure t
  :hook (after-init . marginalia-mode)
  :init
  :config)

(use-package bing-dict
  :ensure t
  :config
    (setq bing-dict-vocabulary-file "/opt/dir/yulove/org/english.org")
    (setq bing-dict-vocabulary-save t)
    (setq bing-dict-cache-auto-save t)
)



(provide 'init-other)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; init-other.el ends here
