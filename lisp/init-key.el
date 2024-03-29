;;; init-key.el --- key config -*- lexical-binding: t -*-
;;; Commentary:

;;; This file key the configuration

;;; Code:


(use-package general
  :ensure t
  :init
  (with-eval-after-load 'evil
    (general-add-hook 'after-init-hook
                      (lambda (&rest _)
                        (when-let ((messages-buffer (get-buffer "*Messages*")))
                          (with-current-buffer messages-buffer
                            (evil-normalize-keymaps))))
                      nil
                      nil
                      t))


  (general-create-definer global-definer
    :keymaps 'override
    :states '(insert emacs normal hybrid motion visual operator)
    :prefix "SPC"
    :non-normal-prefix "C-SPC")

  (defmacro +general-global-menu! (name infix-key &rest body)
    "Create a definer named +general-global-NAME wrapping global-definer.
Create prefix map: +general-global-NAME. Prefix bindings in BODY with INFIX-KEY."
    (declare (indent 2))
    `(progn
       (general-create-definer ,(intern (concat "+general-global-" name))
         :wrapping global-definer
         :prefix-map ',(intern (concat "+general-global-" name "-map"))
         :infix ,infix-key
         :wk-full-keys nil
         "" '(:ignore t :which-key ,name))
       (,(intern (concat "+general-global-" name))
        ,@body)))

  (general-create-definer global-leader
    :keymaps 'override
    :states '(emacs normal hybrid motion visual operator)
    :prefix ","
    "" '(:ignore t :which-key (lambda (arg) `(,(cadr (split-string (car arg) " ")) . ,(replace-regexp-in-string "-mode$" "" (symbol-name major-mode)))))))



(use-package which-key
  :hook (after-init . which-key-mode)
  :ensure t
  :init
  (setq which-key-side-window-location 'bottom))


(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)




(global-set-key (kbd "C-c a") 'org-agenda)
;; r aka remember
(global-set-key (kbd "C-c r") 'org-capture)



(use-package general
  :init
  (general-emacs-define-key 'global [remap imenu] 'consult-imenu)
  (general-emacs-define-key 'global [remap apropos] 'consult-apropos)
  (global-definer
    "!" 'shell-command
    ":" 'counsel-M-x
    "-" 'counsel-M-x
    "1" '(sort-tab-yu-0 :which-key "切换到第1个buffer")
    "2" '(sort-tab-yu-1 :which-key "切换到第2个buffer")
    "3" '(sort-tab-yu-2 :which-key "切换到第3个buffer")
    "4" '(sort-tab-yu-3 :which-key "切换到第4个buffer")
    "5" '(sort-tab-yu-4 :which-key "切换到第5个buffer")
    "6" '(sort-tab-yu-5 :which-key "切换到第6个buffer")
    "SPC" 'execute-extended-command
    "y" 'bing-dict-brief
    ";" 'vterm
    "g" 'keyboard-quit
   )


  (+general-global-menu! "buffer" "b"
    "c" 'kill-current-buffer
    ;;"b" '(switch-to-buffer :which-key "switch buffer")
    "b" '(ido-switch-buffer :which-key "switch buffer")
    ;;"p" 'previous-buffer
    "R" 'rename-buffer
    "M" '((lambda () (interactive) (switch-to-buffer "*Messages*"))
          :which-key "messages-buffer")
    ;;"n" 'next-buffer
    ;;"i" 'ibuffer
    "k" 'kill-buffer
    "y" 'copy-buffer-name

    "1" 'sort-tab-yu-0
    "2" 'sort-tab-yu-1
    "3" 'sort-tab-yu-2
    "4" 'sort-tab-yu-3
    "5" 'sort-tab-yu-4
    "6" 'sort-tab-yu-5
    )

   (+general-global-menu! "code" "c"

    ;;"i"  'eglot-find-implementation
    ;;"d"  'eglot-find-declaration
    ;;"u"  'eglot-find-typeDefinition
    ;;"m"  'eglot-java-run-main
    "h"  'hs-toggle-hiding
    "g"  'lsp-goto-implementation
    "f"  'lsp-format-buffer
    "b"  'pop-tag-mark
   )
 

  (+general-global-menu! "edit" "e"

    "a"  'mark-whole-buffer
    "c"  'kill-ring-save
    "u"  'undo
    "s"  'save-buffer
    "S" 'save-some-buffers
    "x"  'kill-region
    "V"  'browse-kill-ring
    "v"  'yank)
  )

  (+general-global-menu! "file" "f"

    "f"  'counsel-projectile-find-file
    "l" 'avy-goto-line
    "c" 'avy-goto-char
    "r" 'consult-recent-file
    "L" 'consult-locate
    "d" 'consult-dir
    "w" 'sudo-edit
    "j" 'dired-jump
    "y" 'copy-file-name)


;; (+general-global-menu! "file" "F"
;;    "s" 'select-frame-by-name
;;    "f" 'find-file-other-frame
;;    "b" 'switch-to-buffer-other-frame
;;    "d" 'delete-frame
;; )

 (+general-global-menu! "layout" "l"

    "l" 'persp-switch
    "L" 'persp-state-load
    "TAB" 'persp-switch-last
    "A" 'persp-add-buffer
    "s" 'persp-state-save
    "b" 'persp-switch-to-buffer
    "R" 'persp-remove-buffer
    "k" 'persp-kill)


(+general-global-menu! "org-mode" "o"
    "f"  'counsel-projectile-find-file
    "m"  'org-archive-subtree-default
    "p" 'org-set-property  
    "s" 'org-schedule
    "d" 'org-deadline
    "t" 'org-todo
    "T" 'og-set-tags-command
    "o" 'org-open-at-point
    "1" 'open-org-inbox'
    "2" 'open-org-todo'
    "3" 'open-org-todo-often'
    "4" 'open-org-todo-back'
    "5" 'open-org-finsh'
    "a"  'org-agenda)


  (+general-global-menu! "project" "p"

    "f"  'counsel-projectile-find-file
    "p"  'counsel-projectile-switch-project
    "s"  'counsel-projectile-ag
    "a"  'projectile-add-known-project
    "d"  'projectile-remove-known-project

    "r" 'consult-recent-file
    "D" 'project-dired
    "b" 'consult-project-buffer
    "e" 'project-eshell
    "c" 'project-compile
    "x" 'project-forget-project)

   (+general-global-menu! "view" "v"
    "a" 'ivy-push-view
    "r" 'ivy-pop-view
    "f"  'counsel-projectile-find-file
    "s" 'ivy-switch-view)
  
   (+general-global-menu! "Search" "s"
     "t" '(counsel-projectile-ag :which-key "文本查询")
     )

  (+general-global-menu! "toggle" "t"
    "t"  'treemacs
    "s"  'treemacs-switch-workspace
    "c"  'treemacs-create-workspace
    "p"  'treemacs-projectile
    "r"  'treemacs-remove-project-from-workspace
    "a"  'treemacs-add-project)

 (+general-global-menu! "window" "w"
    "1" 'select-window-1
    "2" 'select-window-2
    "3" 'select-window-3
    "4" 'select-window-4
    "5" 'select-window-5
    "6" 'select-window-6
    "-" 'split-window-right
    "/" 'split-window-below
    "o" 'delete-other-windows
    "c" 'delete-window
    "=" 'balance-windows-area)

;;meghanada-exec-main  :exit t)
;;meghanada-compile-file :exit t)
;;meghanada-jump-declaration :exit t)
;;"执行当前函数") . dap-java-debug)
;;"编译类的代码") . lsp-java-build-project)
;;"跳转到对应类") . lsp-goto-implementation
;;("f" . "格式化代码") . gofmt)
;;"go-remove-unused-imports") . go-remove-unused-imports)
;;"跳转到对应类") . godef-jump)
;;"返回前面的类") . pop-tag-mark)
(provide 'init-key)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; init-key.el ends here
