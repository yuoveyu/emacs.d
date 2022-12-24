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


;;C-x M-g 调用 magit-dispatch，会列出来所有可以调用的子命令，选中后再输入一些可选的选项和接下来的命令，就和正常输入 git 的命令一样。
;;(use-package magit
;;  :ensure t)








(provide 'init-other)
