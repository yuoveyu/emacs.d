;;M-x mouse-wheel-mode 开启滚轮支持
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8) 
(set-terminal-coding-system 'utf-8) 
(set-keyboard-coding-system 'utf-8) 
(setq default-buffer-file-coding-system 'utf-8)

;;代替
(defalias 'yes-or-no-p 'y-or-n-p)

(setq-default cursor-type 'bar)

(defconst *is-mac* (eq system-type 'darwin)) 
(defconst *is-linux* (eq system-type 'gnu/linux)) 
;mac command键设置为meta
(when *is-mac* 
    (setq mac-command-modifier 'meta)
    (setq mac-option-modifier 'none))


;;yu自定义插件配置文件 start
(add-to-list 'load-path "~/.emacs.d/config")
(require 'cp-settings)

(electric-indent-mode 1)
(menu-bar-mode -1) 
(tool-bar-mode -1)
(cua-mode t)
(global-hl-line-mode 1)
(add-hook 'prog-mode-hook #'hs-minor-mode)

;;开启鼠标支持
(xterm-mouse-mode 1) 

;; 显示行号
(global-linum-mode -1) ;;line num 不显示行号

;;不要生成备份文件
(setq make-backup-files nil)

;关掉启动界面
;;(setq inhibit-startup-screen t)

(provide 'init-settings)