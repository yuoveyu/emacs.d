
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;tabbar设置start;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;windows 编号
(use-package window-numbering
  :ensure t)
(window-numbering-mode 1)

;; tab
(add-to-list 'load-path "~/.emacs.d/site-lisp/sort-tab") ; add sort-tab to your load-path
(require 'sort-tab)
(sort-tab-mode 1)

(provide 'init-window)