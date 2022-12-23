;;;;;;;;;快速复制的命令;;;;;;;;;;;;;;
;; 快速打开emacs-notepad


(defun slurp (f)
  (with-temp-buffer
    (insert-file-contents f)
    (buffer-substring-no-properties
       (point-min)
       (point-max))))
       
(defun yu-example ()
  (interactive)
(setq remainder  (split-string
   (slurp "~/data.txt") "\n" t) )
(setq aaa (car remainder) )
  (message aaa
           )
)

;;读取文件内容
(defun slurp (f)
  (with-temp-buffer
    (insert-file-contents f)
    (buffer-substring-no-properties
       (point-min)
       (point-max))))

;;know查询关键字文件
(defun yu-know (n)
  "执行shell命令并处理它的输出。这里为显示当前目录下的文件"
  (interactive "sEnter know key: ")
  (message "key: %s" n)
  (setq allcom (concat "know " n))
  ;;(set-buffer (get-buffer-create "*yu-know*"))
  ;;(with-current-buffer "*yu-know*")
  ;;(message (shell-command-to-string allcom))

  (switch-to-buffer-other-window "*Messages")
  (insert (shell-command-to-string allcom) )

)

(defun yu-index ()
  "执行shell命令并处理它的输出。这里为显示当前目录下的文件"
  (interactive)
  (setq aa  (buffer-substring-no-properties (line-beginning-position) (line-end-position) ))
  (message aa)
  (kill-this-buffer)
  (if (not (one-window-p)) (delete-window))
  (find-file aa)
)
;;(global-set-key (kbd "C-c y")   'yu-index)  ;给给函数绑定一个快捷键


;;Yud-index
(defun yu-index2 (n)
  "执行shell命令并处理它的输出。这里为显示当前目录下的文件"
  (interactive "sEnter know index: ")
  (message "index: %s" n)

  (setq nn (string-to-number n))
(setq remainder    (split-string
   (slurp "~/data.txt") "\n" t) )
(setq aaa (nth nn remainder) )
  (message aaa )
)



(defun yu-dir (dir)

  (let ((filelist (list-directory-tree dir)))
    (dolist (filename filelist)
      (message filename)
    )
  )
)


(provide 'cp-settings)

