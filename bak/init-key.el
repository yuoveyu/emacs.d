


(add-to-list 'load-path "~/.emacs.d/site_lisp/one-key/")
(require 'one-key)
;;(setq one-key-popup-window nil)
;;(global-set-key (kbd "SPC") 'meow-keypad)

;;;###autoload
(defmacro lazy-one-key-create-menu (title &rest keybinds)
  (let (one-key-key-alist)
    (dolist (ele keybinds)
      (autoload (plist-get ele :command) (plist-get ele :filename) nil t)
      (push
       (cons (cons (plist-get ele :key) (plist-get ele :description)) (plist-get ele :command))
       one-key-key-alist))
    `(one-key-create-menu ,title (quote ,one-key-key-alist))))


;;projectile key
(one-key-create-menu
 "Project"
 '((("f" . "快速打开文件") . counsel-projectile-find-file)
   (("p" . "选择已有项目") . counsel-projectile-switch-project)
   (("s" . "项目内容搜索") . counsel-projectile-ag)
   (("f" . "选择项目缓冲") . counsel-projectile-find-dir)
   (("a" . "添加新的项目") . projectile-add-known-project)
   (("d" . "移除已有项目") . projectile-remove-known-project)
   (("c" . "返回") . hydra-all-yu/body)
  )
)

;;treemacs key
(one-key-create-menu
 "Treemacs"
 '((("t" . "打开树的结构") . treemacs)
   (("p" . "树的结构项目") . treemacs-projectile)
   (("r" . "移除树的项目") . treemacs-remove-project-from-workspace)
   (("a" . "添加树的项目") . treemacs-add-project)
   (("c" . "返回") . hydra-all-yu/body)
  )
)

;;window key
(one-key-create-menu
 "Window"
 '((("h" . "垂直分割窗口") . split-window-below)
   (("w" . "水平分割窗口") . split-window-right)
   (("o" . "切换其他窗口") . other-window)
   (("d" . "删除当前窗口") . delete-window)
   (("1" . "选择窗口第一") . select-window-1 )
   (("2" . "选择窗口第二") . select-window-2 )
   (("3" . "选择窗口第三") . select-window-3 )
   (("4" . "选择窗口第四") . select-window-4 )
   (("5" . "选择窗口第五") . select-window-5 )
   (("6" . "选择窗口第六") . select-window-6 )
   (("c" . "返回") . hydra-all-yu/body)
  )
)

;;frame key
(one-key-create-menu
 "Frame"
 '((("s" . "选择已有窗格") . select-frame-by-name)
   (("f" . "新开窗格文件") . find-file-other-frame)
   (("b" . "其它窗格缓冲") . switch-to-buffer-other-frame)
   (("d" . "删除当前窗格") . delete-frame)
   (("c" . "返回") . hydra-all-yu/body)
  )
)
;;java key
(one-key-create-menu
 "Java22"
 '((("m" . "执行当前函数") . meghanada-exec-main)
   (("c" . "编译类的代码") . meghanada-compile-file)
   (("g" . "跳转到对应类") . meghanada-jump-declaration)
   (("p" . "跳转到对应类") . meghanada-back-jump);;switch-to-prev-buffer
   (("c c" . "返回") . hydra-all-yu/body)
  )
)
(one-key-create-menu
 "Java"
 '((("m" . "执行当前函数") . dap-java-debug)
   (("c" . "编译类的代码") . lsp-java-build-project)
   (("g" . "跳转到对应类") . lsp-goto-implementation)
   (("p" . "返回到对应类") . meghanada-back-jump);;switch-to-prev-buffer
   (("c c" . "返回") . hydra-all-yu/body)
  )
)
;;go key
(one-key-create-menu
 "Go"
 '((("f" . "格式化代码") . gofmt)
   (("r" . "go-remove-unused-imports") . go-remove-unused-imports)
   (("g" . "跳转到对应类") . godef-jump)
   (("p" . "返回前面的类") . pop-tag-mark) ;;beginning-of-defun
   (("c" . "返回") . hydra-all-yu/body)
  )
)

;;avy-line key
(one-key-create-menu
 "Line"
 '((("l" . "快速行的跳转") . avy-goto-line)
   (("c" . "快速字符调整") . avy-goto-char)
  )
)

;;ivy-view key
(one-key-create-menu
 "View"
 '((("a" . "ivy-push-view") . ivy-push-view)
   (("s" . "ivy-switch-view") . ivy-switch-view)
   (("r" . "ivy-pop-view") . ivy-pop-view)
   (("c" . "返回") . hydra-all-yu/body)
  )
)

(use-package which-key
  :ensure t
  :init (which-key-mode))

(provide 'init-key)
