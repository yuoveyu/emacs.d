(use-package hydra
  :ensure t)

(use-package use-package-hydra
  :ensure t
  :after hydra) 

(defhydra hydra-buffer-yu (:color pink
                             :hint nil)
  "
^Project^               ^treemacs^             ^Frame^               ^window^                ^java^
^^^^^^^^------------------------------------------------------------------------------------------------------
_p f_: 快速打开文件    _t t_: 打开树的结构    _f s_: 选择已有窗格    _w h_: 窗口分为上下     _j m_: 执行当前函数
_p t_: 选择已有项目    _t p_: 树的结构项目    _f f_: 新开窗格文件    _w w_: 窗口分为左右     _j c_: 编译类的代码
_p s_: 项目内容搜索    _t r_: 移除树的项目    _f b_: 其它窗格缓冲    _w o_: 光标窗口移动     _j g_: 跳转到对应类
_p d_: 选择项目缓冲    _t a_: 添加树的项目    _f d_: 删除当前窗格    _w d_: 关闭当前窗口
_p a_: 添加新的项目    _a l_: 快速行的跳转    _w 4_: 选择窗口第四    _w 2_: 选择窗口第二
_p r_: 移除已有项目    _a c_: 快速字符跳转    _w 5_: 选择窗口第五    _w 3_: 选择窗口第三
"
  ("p f" counsel-projectile-find-file :exit t)
  ("p t" counsel-projectile-switch-project :exit t)
  ("p s" counsel-projectile-ag :exit t)
  ("p d" counsel-projectile-find-dir :exit t)
  ("p a" projectile-add-known-project :exit t)
  ("p r" projectile-remove-known-project :exit t)
  ("t t" treemacs :color blue)
  ("t p" treemacs-projectile :exit t)
  ("t r" treemacs-remove-project-from-workspace :exit t)
  ("t a" treemacs-add-project :exit t)
  ("a l" avy-goto-line :exit t)
  ("a c" avy-goto-char :color red)
  ("w h" split-window-below  :exit t) ;;C-x 2
  ("w w" split-window-right  :exit t) ;;C-x 3
  ("w o" other-window :exit t) ;;C-x o
  ("w d" delete-window :exit t) ;;C-x 0
  ;;("w 1" select-window-1  :exit t) 
  ("w 2" select-window-2  :exit t) 
  ("w 3" select-window-3  :exit t) 
  ("w 4" select-window-4  :exit t) 
  ("w 5" select-window-5  :exit t) 
  ("w 6" select-window-6  :exit t) 

  ("f s" select-frame-by-name  :exit t) 
  ("f f" find-file-other-frame :exit t) 
  ("f b" switch-to-buffer-other-frame :exit t) 
  ("f d" delete-frame :exit t) 

  ("j m" meghanada-exec-main  :exit t) 
  ("j c" meghanada-compile-file :exit t) 
  ("j g" meghanada-jump-declaration :exit t) 
  


  ;;("c" nil "cancel" :color red)
  ("c c" hydra-all-yu/body "返回" :color red)
  ("v" evil-mode "切换模式" :color red)
  ("s" save-buffer "保存" :color red)
  ("q" save-buffers-kill-emacs "quit" :color red)
)

(global-set-key (kbd "C-y") 'hydra-buffer-yu/body)



(defhydra hydra-all-yu (:color pink
                             :hint nil)
  "
^Project^       ^Window^          ^快捷^           ^保存^            ^编程语言^
^^^^^^^^------------------------------------------------------------------------------------------------------
_p_: 工程相关    _w_: 窗口相关    _a_: 快捷跳转    _v_: 视图保存     _j_: 执行java
_t_: 树形菜单    _f_: 窗格相关                                       _g_: 执行golang     
"
  ("p" one-key-menu-project :exit t)
  ("t" one-key-menu-treemacs :exit t)
  ("y" hydra-buffer-yu/body :exit t)
  ("w" one-key-menu-window :exit t)
  ("f" one-key-menu-frame :exit t)
  ("j" one-key-menu-java :exit t)
  ("a" one-key-menu-line :exit t)
  ("v" one-key-menu-view :exit t)
  ("g" one-key-menu-go :exit t)
  ("c" nil "cancel" :color red)
  ("e" evil-mode "切换模式" :color red)
  ("s" save-buffer "保存" :exit t :color red)
  ("q q" save-buffers-kill-emacs "quit" :color red)
)

(global-set-key (kbd "C-q") 'hydra-all-yu/body)

(defun my-hydra-func ()
  (interactive)
  (if evil-mode (hydra-all-yu/body) (ucs-insert "SPACE")))
;;(global-set-key (kbd "SPC") 'my-hydra-func)



(provide 'init-hydra)


;;| color    | toggle                     |
;;|----------+----------------------------|
;;| red      |                            |
;;| blue     | :exit t                    |
;;| amaranth | :foreign-keys warn         |
;;| teal     | :foreign-keys warn :exit t |
;;| pink     | :foreign-keys run          |
